import pybamm
import numpy as np
import matplotlib.pyplot as plt

def run_minimal_hybrid_ecm_test():
    """
    This function builds and runs a custom ECM, then plots the results
    to visually verify its behavior.
    """
    try:
        # 1. Start with the base battery model
        model = pybamm.BaseBatteryModel()

        # 2. Define the variables
        soc = pybamm.Variable("SoC")
        v_r1 = pybamm.Variable("R1 overpotential [V]")
        v_r2 = pybamm.Variable("R2 overpotential [V]")
        current = pybamm.InputParameter("Current [A]")
        
        # 3. Define the parameters
        ocv = pybamm.Parameter("Open-circuit voltage [V]")
        r0 = pybamm.Parameter("R0 [Ohm]")
        r1 = pybamm.Parameter("R1 [Ohm]")
        c1 = pybamm.Parameter("C1 [F]")
        r2 = pybamm.Parameter("R2 [Ohm]")
        c2 = pybamm.Parameter("C2 [F]")
        capacity = pybamm.Parameter("Nominal cell capacity [A.h]")

        # 4. Define the model's equations
        model.rhs = {
            soc: current / (capacity * 3600),
            v_r1: (current / c1) - (v_r1 / (r1 * c1)),
            v_r2: (current / c2) - (v_r2 / (r2 * c2)),
        }
        model.initial_conditions = {
            soc: pybamm.Scalar(1.0),
            v_r1: pybamm.Scalar(0.0),
            v_r2: pybamm.Scalar(0.0),
        }
        model.variables = {
            "SoC": soc,
            "Terminal voltage [V]": ocv - current * r0 - v_r1 - v_r2,
            "Open-circuit voltage [V]": ocv,
        }

        # 5. Create the parameter set
        parameter_values = pybamm.ParameterValues("Chen2020")
        ecm_params = {
            "Nominal cell capacity [A.h]": 5.0,
            "Current function [A]": current,
            "Open-circuit voltage [V]": pybamm.Interpolant(
                np.array([0, 1]), np.array([3.0, 4.2]), soc 
            ),
            "R0 [Ohm]": 0.0015,
            "R1 [Ohm]": 0.001,
            "C1 [F]": 2500.0,
            "R2 [Ohm]": 0.0008,
            "C2 [F]": 40000.0,
        }
        parameter_values.update(ecm_params, check_already_exists=False)

        # 6. Create and run a full discharge simulation
        sim = pybamm.Simulation(model, parameter_values=parameter_values)
        # Simulate a 1C discharge for 1 hour (3600 seconds)
        solution = sim.solve([0, 3600], inputs={"Current [A]": -5.0})

        # 7. Plot the results
        soc_sol = solution["SoC"].entries
        ocv_sol = solution["Open-circuit voltage [V]"].entries
        voltage_sol = solution["Terminal voltage [V]"].entries
        
        plt.figure(figsize=(8, 6))
        plt.plot(soc_sol * 100, voltage_sol, label="Terminal Voltage")
        plt.plot(soc_sol * 100, ocv_sol, linestyle='--', label="Open-Circuit Voltage (OCV)")
        plt.xlabel("State of Charge (%)")
        plt.ylabel("Voltage (V)")
        plt.title("Simulated Battery Discharge")
        plt.legend()
        plt.grid(True)
        plt.show()

        return "SUCCESS: Minimal hybrid ECM ran and plotted without errors."

    except Exception as e:
        return f"FAILURE: {e}"

# This allows the script to be run directly from a terminal for testing
if __name__ == '__main__':
    print(run_minimal_hybrid_ecm_test())
