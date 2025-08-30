@echo off
setlocal

rem -----------------------------------------------------------------
rem Volta Control Suite - Python venv bootstrap (clean version)
rem Creates venv under %LOCALAPPDATA% by default then installs pyproject deps.
rem Usage:
rem   Setup-Python.bat                (default location)
rem   Setup-Python.bat "D:\Custom Path\MyVenv"  (custom venv root)
rem   Setup-Python.bat /force         (reuse default path, recreate)
rem   Setup-Python.bat /debug         (verbose)
rem   Setup-Python.bat /force "D:\AltVenv" /debug  (order independent)
rem Flags: /force /debug can appear anywhere; first non-flag argument is treated as venv path.
rem -----------------------------------------------------------------

if not defined LOCALAPPDATA (echo [ERROR] LOCALAPPDATA not defined & exit /b 10)

set "VENV_DIR_DEFAULT=%LOCALAPPDATA%\Volta Control Suite\Python\venv"
set "VENV_DIR=%VENV_DIR_DEFAULT%"
set "VENV_OVERRIDE=0"
rem VENV_PYTHON will be set after argument parsing
set "FORCE=0"
set "DEBUG=0"
set "PIP_RC=0"

:PARSE_ARGS
if "%~1"=="" goto ARGS_DONE
if /I "%~1"=="/force" set "FORCE=1"& shift & goto PARSE_ARGS
if /I "%~1"=="-force" set "FORCE=1"& shift & goto PARSE_ARGS
if /I "%~1"=="/debug" set "DEBUG=1"& shift & goto PARSE_ARGS
if /I "%~1"=="-debug" set "DEBUG=1"& shift & goto PARSE_ARGS
rem If it's the first non-flag argument, treat it as custom VENV_DIR
if "%VENV_OVERRIDE%"=="0" (
	set "VENV_DIR=%~1"
	set "VENV_OVERRIDE=1"
	shift
	goto PARSE_ARGS
)
echo [WARN] Ignoring extra arg %~1
shift
goto PARSE_ARGS
:ARGS_DONE
set "VENV_PYTHON=%VENV_DIR%\Scripts\python.exe"
if "%DEBUG%"=="1" echo [DEBUG] FORCE=%FORCE% VENV_DIR=%VENV_DIR% (override=%VENV_OVERRIDE%)

set "SCRIPT_DIR=%~dp0"
set "PYPROJECT_FILE=%SCRIPT_DIR%pyproject.toml"
if not exist "%PYPROJECT_FILE%" if exist "%SCRIPT_DIR%..\Python\pyproject.toml" set "PYPROJECT_FILE=%SCRIPT_DIR%..\Python\pyproject.toml"
if not exist "%PYPROJECT_FILE%" if exist "%SCRIPT_DIR%..\pyproject.toml" set "PYPROJECT_FILE=%SCRIPT_DIR%..\pyproject.toml"
if not exist "%PYPROJECT_FILE%" if exist "%VENV_DIR%\..\pyproject.toml" set "PYPROJECT_FILE=%VENV_DIR%\..\pyproject.toml"
for %%F in (pyproject.toml) do if exist "%%~fF" set "PYPROJECT_FILE=%%~fF"
if not exist "%PYPROJECT_FILE%" (echo [ERROR] pyproject.toml not found & exit /b 2)
for %%F in ("%PYPROJECT_FILE%") do set "PYPROJECT_DIR=%%~dpF"

echo [INFO] Python virtual environment target: "%VENV_DIR%"
if "%VENV_OVERRIDE%"=="1" if not "%VENV_DIR%"=="%VENV_DIR_DEFAULT%" echo [INFO] Using custom venv path override
echo [INFO] pyproject source: "%PYPROJECT_FILE%"

if exist "%VENV_PYTHON%" if "%FORCE%"=="0" goto HAVE_VENV
if "%FORCE%"=="1" if exist "%VENV_DIR%" (echo [INFO] /force removing existing venv & rmdir /S /Q "%VENV_DIR%" 2>nul)
echo [INFO] Creating virtual environment...
where py >nul 2>&1 && (py -3 -m venv "%VENV_DIR%") || (where python >nul 2>&1 || (echo [ERROR] No Python found on PATH & exit /b 3) & python -m venv "%VENV_DIR%")
for /L %%I in (1,1,15) do if not exist "%VENV_PYTHON%" (ping 127.0.0.1 -n 2 >nul) else goto VENV_OK
if not exist "%VENV_PYTHON%" (echo [ERROR] venv creation failed python.exe missing & exit /b 4)
:VENV_OK
echo [INFO] Virtual environment ready.

:HAVE_VENV
"%VENV_PYTHON%" -m ensurepip --upgrade >nul 2>&1
if not exist "%VENV_DIR%\Scripts\pip.exe" (echo [ERROR] pip missing after ensurepip & exit /b 5)
"%VENV_PYTHON%" -m pip install --upgrade pip setuptools wheel >nul 2>&1
if "%DEBUG%"=="1" echo [DEBUG] Upgraded pip tooling

pushd "%PYPROJECT_DIR%" >nul 2>&1
echo [INFO] Installing project dependencies...
"%VENV_PYTHON%" -m pip install .
set "PIP_RC=%ERRORLEVEL%"
if not "%PIP_RC%"=="0" (
	echo [WARN] Install failed code %PIP_RC% - retry once after pip upgrade
	"%VENV_PYTHON%" -m pip install --upgrade pip setuptools wheel >nul 2>&1
	"%VENV_PYTHON%" -m pip install .
	set "PIP_RC=%ERRORLEVEL%"
)
popd >nul 2>&1
if not "%PIP_RC%"=="0" (
	echo [WARN] Some dependencies failed (exit %PIP_RC%)
) else (
	echo [INFO] Dependencies installed.
)

call "%VENV_DIR%\Scripts\activate.bat" >nul 2>&1
if not defined VIRTUAL_ENV (echo [ERROR] Activation failed VIRTUAL_ENV not set & exit /b 7)
python -c "import sys; print(sys.executable)" 1>nul 2>nul || (echo [ERROR] Test python invocation failed & exit /b 8)

if "%PIP_RC%"=="0" (
	echo [SUCCESS] Virtual environment created and dependencies installed.
) else (
	echo [SUCCESS] Virtual environment created. Run 'pip install .' to finish deps.
)
echo [SUCCESS] Activate later with: call "%VENV_DIR%\Scripts\activate.bat"
exit /b %PIP_RC%
