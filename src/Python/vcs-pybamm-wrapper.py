import pybamm
import numpy as np
import json
import os
from datetime import datetime
import traceback

# --- Global Logging Setup ---
try:
    SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
except NameError:
    SCRIPT_DIR = os.getcwd()
LOG_FILE_PATH = os.path.join(SCRIPT_DIR, "pybamm_debug.log")

def log_message(message):
    """Writes a timestamped message to the log file."""
    try:
        with open(LOG_FILE_PATH, "a") as f:
            timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
            f.write(f"{timestamp} - {message}\n")
    except Exception as e:
        print(f"CRITICAL: Failed to write to log file: {e}")

class PybammWrapper:
    """
    Final corrected version using a pure custom ECM with robust parameter mapping.
    """
    def __init__(self):
        self.model = None
        self.simulation = None
        self.solution = None
        self.soc_data = None
        self.ocv_data = None
        self.output_vars = [
            "Terminal voltage [V]", "Current [A]", "Open-circuit voltage [V]", "SoC"
        ]
        log_message("PybammWrapper initialized.")

    def __del__(self):
        log_message("PybammWrapper destroyed.")

    def generate_and_load_ocv_curve(self, chemistry="Chen2020"):
        try:
            param = pybamm.ParameterValues(chemistry)
            U_p_func = param["Positive electrode OCP [V]"]
            U_n_func = param["Negative electrode OCP [V]"]
            soc_points = np.linspace(0, 1, 101)
            ocv_points = np.zeros_like(soc_points)
            for i, soc in enumerate(soc_points):
                p_sto = 1 - soc; n_sto = soc
                U_p = U_p_func(p_sto); U_n = U_n_func(n_sto)
                ocv_points[i] = U_p - U_n
            self.soc_data = soc_points
            self.ocv_data = ocv_points
            log_message("Successfully generated and loaded OCV curve.")
            return "SUCCESS"
        except Exception as e:
            log_message(f"Error generating OCV curve: {e}")
            return f"Error generating OCV curve: {e}"

    def load_ocv_soc_curve(self, soc_data, ocv_data):
        self.soc_data = np.array(soc_data)
        self.ocv_data = np.array(ocv_data)
        log_message(f"Loaded custom OCV curve with {len(soc_data)} points.")
        return True

    def load_simulation(
        self,
        num_rc_pairs: int = 2,
        R0: float = 0.0015, R1: float = 0.001, C1: float = 2500.0,
        R2: float = 0.0008, C2: float = 40000.0,
        nominal_capacity_Ah: float = 5.0,
        upper_voltage_cutoff: float = 5.0, lower_voltage_cutoff: float = 3.0,
    ):
        try:
            # Data Validation
            if self.soc_data is None or self.ocv_data is None:
                log_message("load_simulation ERROR: OCV/SOC data has not been loaded.")
                return -1.0

            sort_indices = np.argsort(self.soc_data)
            sorted_soc = self.soc_data[sort_indices]
            sorted_ocv = self.ocv_data[sort_indices]

            log_message("Defining custom ECM model...")

            self.model = pybamm.BaseBatteryModel()
            soc = pybamm.Variable("SoC")
            v_r1 = pybamm.Variable("R1 overpotential [V]")
            v_r2 = pybamm.Variable("R2 overpotential [V]")
            current = pybamm.InputParameter("Current [A]")

            # Use plain floats for all custom parameters
            sorted_soc = self.soc_data
            sorted_ocv = self.ocv_data
            ocv = pybamm.Interpolant(sorted_soc, sorted_ocv, soc)
            r0 = R0
            r1 = R1
            c1 = C1
            r2 = R2
            c2 = C2
            capacity = nominal_capacity_Ah

            # Set model.variables and _variables BEFORE processing
            self.model.rhs = {
                soc: -current / (capacity * 3600),
                v_r1: (current / c1) - (v_r1 / (r1 * c1)),
                v_r2: (current / c2) - (v_r2 / (r2 * c2)),
            }
            self.model.initial_conditions = {
                soc: pybamm.Scalar(1.0), v_r1: pybamm.Scalar(0.0), v_r2: pybamm.Scalar(0.0)
            }
            self.model.variables = {
                "SoC": soc,
                "Open-circuit voltage [V]": ocv,
                "Terminal voltage [V]": ocv - current * r0 - v_r1 - v_r2,
                "Current [A]": current,
            }
            self.model._variables = self.model.variables

            # Parameter Assignment
            # Store parameter values for use in step_simulation
            parameter_values = {
                "My Capacity [A.h]": nominal_capacity_Ah,
                "My R0 [Ohm]": R0,
                "My R1 [Ohm]": R1,
                "My C1 [F]": C1,
                "My R2 [Ohm]": R2,
                "My C2 [F]": C2,
            }
            self.parameter_values = parameter_values
            log_message(f"Parameter dictionary: {parameter_values}")

            log_message("Creating pybamm.CasadiSolver for custom ECM model (ODE-only)...")
            self.parameter_values = parameter_values

            self.solver = pybamm.CasadiSolver(mode="fast")
            self.model_processed = True
            # Initial solve to set up the solution object (direct CasadiSolver)
            self.solution = self.solver.solve(
                self.model,
                t_eval=[0, 1e-6],
                inputs={"Current [A]": 0.0}
            )
            log_message("Initial solve complete.")
            actual_capacity = parameter_values['My Capacity [A.h]']
            log_message(f"Simulation loaded successfully with capacity: {actual_capacity} Ah.")
            return float(actual_capacity)

        except Exception as e:
            tb = traceback.format_exc()
            log_message(f"Error in load_simulation: {e}\nTraceback:\n{tb}")
            return -444.0

    def step_simulation(self, current_A, time_step_s):
        if self.solution is None:
            log_message("step_simulation ERROR: Solution object is None.")
            return float('nan'), float('nan')

        log_message(f"Stepping simulation: current={current_A}, dt={time_step_s}")
        t_start = float(self.solution.t[-1]) if self.solution is not None else 0.0
        t_end = t_start + time_step_s
        y0 = self.solution.y[:, -1]
        log_message(f"y0 for next step: {y0}")

        # Build a fresh ODE model for this step (floats/interpolants only)
        soc = pybamm.Variable("SoC")
        v_r1 = pybamm.Variable("R1 overpotential [V]")
        v_r2 = pybamm.Variable("R2 overpotential [V]")
        current_var = pybamm.InputParameter("Current [A]")
        ocv = pybamm.Interpolant(self.soc_data, self.ocv_data, soc)
        r0 = self.parameter_values["My R0 [Ohm]"]
        r1 = self.parameter_values["My R1 [Ohm]"]
        c1 = self.parameter_values["My C1 [F]"]
        r2 = self.parameter_values["My R2 [Ohm]"]
        c2 = self.parameter_values["My C2 [F]"]
        capacity = self.parameter_values["My Capacity [A.h]"]

        model = pybamm.BaseBatteryModel()
        model.rhs = {
            soc: -current_var / (capacity * 3600),
            v_r1: (current_var / c1) - (v_r1 / (r1 * c1)),
            v_r2: (current_var / c2) - (v_r2 / (r2 * c2)),
        }
        # Clamp initial SoC to [0, 1] between steps to avoid out-of-range interpolation
        soc0 = float(np.clip(float(y0[0]), 0.0, 1.0))
        if not np.isclose(soc0, float(y0[0])):
            log_message(f"step_simulation: initial SoC clamped from {float(y0[0])} to {soc0}")
        model.initial_conditions = {
            soc: pybamm.Scalar(soc0),
            v_r1: pybamm.Scalar(y0[1]),
            v_r2: pybamm.Scalar(y0[2]),
        }
        model.variables = {
            "SoC": soc,
            "Open-circuit voltage [V]": ocv,
            "Terminal voltage [V]": ocv - current_var * r0 - v_r1 - v_r2,
            "Current [A]": current_var,
        }
        model._variables = model.variables

        try:
            log_message(f"step_simulation: model.variables keys before solve: {list(model.variables.keys())}")
        except Exception as e:
            log_message(f"step_simulation: Exception logging model.variables keys: {e}")

        solver = pybamm.CasadiSolver(mode="fast")
        try:
            self.solution = solver.solve(model, t_eval=[t_start, t_end], inputs={"Current [A]": current_A})
        except Exception as e:
            tb = traceback.format_exc()
            log_message(f"Error during solver.solve: {e}\nTraceback:\n{tb}")
            return float('nan'), float('nan')

        try:
            sol_vars = list(self.solution.data.keys())
            log_message(f"step_simulation: solution variable keys after solve: {sol_vars}")
        except Exception as e:
            log_message(f"step_simulation: Exception listing solution keys: {e}")

        # Persist for next step
        self.model = model
        self.solver = solver

        # Extract outputs
        # Terminal voltage
        try:
            terminal_voltage = float(self.solution["Terminal voltage [V]"].entries[-1])
        except Exception:
            terminal_voltage = float('nan')

        # State of charge in percent
        soc_percent = float('nan')
        try:
            soc_val = None
            # Prefer exact variable if present
            if hasattr(self.solution, "data") and "SoC" in getattr(self.solution, "data", {}):
                soc_val = self.solution["SoC"].entries[-1]
            else:
                # Case-insensitive search for any SoC-like key
                for k in getattr(self.solution, "data", {}).keys():
                    if k.lower() == "soc" or "state of charge" in k.lower():
                        soc_val = self.solution[k].entries[-1]
                        break
            if soc_val is not None:
                soc_percent = float(soc_val * 100.0)
        except Exception:
            pass

        # Fallback: derive SoC directly from the first state variable in y
        if np.isnan(soc_percent):
            try:
                soc_percent = float(self.solution.y[0, -1] * 100.0)
                log_message(f"step_simulation: SoC fallback from y used: {soc_percent}")
            except Exception:
                pass

        # Clamp SoC% to [0, 100]
        if not np.isnan(soc_percent):
            _unclamped = soc_percent
            soc_percent = float(min(100.0, max(0.0, soc_percent)))
            if not np.isclose(_unclamped, soc_percent):
                log_message(f"step_simulation: SoC% clamped from {_unclamped} to {soc_percent}")

        return terminal_voltage, soc_percent
    def get_voltage(self):
        if self.solution:
            try:
                return float(self.solution["Terminal voltage [V]"].entries[-1])
            except Exception:
                return float('nan')
        return float('nan')

    def get_soc(self):
        if self.solution:
            try:
                # Prefer evaluating named variable if present
                if hasattr(self.solution, "data") and "SoC" in getattr(self.solution, "data", {}):
                    soc_val = self.solution["SoC"].entries[-1]
                    soc_percent = float(soc_val * 100)
                    clamped = float(min(100.0, max(0.0, soc_percent)))
                    if not np.isclose(soc_percent, clamped):
                        log_message(f"get_soc: SoC% clamped from {soc_percent} to {clamped}")
                    return clamped
                # Case-insensitive search
                for k in getattr(self.solution, "data", {}).keys():
                    if k.lower() == "soc" or "state of charge" in k.lower():
                        soc_val = self.solution[k].entries[-1]
                        soc_percent = float(soc_val * 100)
                        clamped = float(min(100.0, max(0.0, soc_percent)))
                        if not np.isclose(soc_percent, clamped):
                            log_message(f"get_soc: SoC% clamped from {soc_percent} to {clamped} (matched '{k}')")
                        return clamped
                # Fallback to state vector
                soc_val = self.solution.y[0, -1]
                soc_percent = float(soc_val * 100)
                clamped = float(min(100.0, max(0.0, soc_percent)))
                if not np.isclose(soc_percent, clamped):
                    log_message(f"get_soc: SoC% clamped from {soc_percent} to {clamped} (y fallback)")
                else:
                    log_message(f"get_soc: SoC from y fallback: {soc_percent}")
                return clamped
            except Exception as e:
                log_message(f"get_soc: Exception extracting SoC: {e}")
                return float('nan')
        log_message("get_soc: No solution available")
        return float('nan')

    def get_soc_ocv_curve(self):
        if self.soc_data is None or self.ocv_data is None:
            return '{"error": "No OCV/SOC curve loaded."}'
        curve_data = [[round(s * 100, 2), round(v, 4)] for s, v in zip(self.soc_data, self.ocv_data)]
        return json.dumps(curve_data)

    def reset_simulation(self):
        self.simulation = None
        self.solution = None
        log_message("Simulation reset.")
        return True

# --- Factory Functions for LabVIEW Integration ---

def create():
    return PybammWrapper()

def destroy(obj):
    del obj

def generate_and_load_ocv_curve(obj, chemistry="Chen2020"):
    return obj.generate_and_load_ocv_curve(chemistry)

def load_ocv_soc_curve(obj, soc_data, ocv_data):
    return obj.load_ocv_soc_curve(soc_data, ocv_data)

def load_simulation(
    obj,
    num_rc_pairs=2,
    R0=0.0015, R1=0.001, C1=2500.0,
    R2=0.0008, C2=40000.0,
    nominal_capacity_Ah=5.0,
    upper_voltage_cutoff=5.0, lower_voltage_cutoff=3.0,
):
    return obj.load_simulation(
        num_rc_pairs=num_rc_pairs,
        R0=R0, R1=R1, C1=C1,
        R2=R2, C2=C2,
        nominal_capacity_Ah=nominal_capacity_Ah,
        upper_voltage_cutoff=upper_voltage_cutoff,
        lower_voltage_cutoff=lower_voltage_cutoff,
    )

def step_simulation(obj, current_A, time_step_s):
    return obj.step_simulation(current_A, time_step_s)

def get_voltage(obj):
    return obj.get_voltage()

def get_soc(obj):
    return obj.get_soc()

def get_soc_ocv_curve(obj):
    return obj.get_soc_ocv_curve()

def reset_simulation(obj):
    return obj.reset_simulation()
