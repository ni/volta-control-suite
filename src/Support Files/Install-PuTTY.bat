@echo off
:: ============================================================================
:: Name:        Install-PuTTY.bat
:: Description: Downloads and installs the latest stable 64-bit version of PuTTY.
:: Author:      Brandon Jones
:: Version:     1.1
:: Date:        August 28, 2025
:: ============================================================================
setlocal EnableDelayedExpansion
:: Exit Codes:
:: 0 = Success / Already present
:: 1 = Missing admin rights
:: 2 = Download failed
:: 3 = Installation (msiexec) failed
:: 4 = plink not found after install
:: 5 = Failed to add PuTTY directory to PATH
set "ERRORFLAG=0"

:: ----------------------------------------------------------------------------
:: 0. Check if plink already exists (on PATH or in common install dirs)
:: ----------------------------------------------------------------------------
where plink >nul 2>&1 && set "SKIPINSTALL=1"
if defined SKIPINSTALL echo plink already available on PATH. Skipping PuTTY installation.
if not defined SKIPINSTALL (
    for %%D in ("C:\Program Files\PuTTY" "C:\Program Files (x86)\PuTTY") do if exist "%%~D\plink.exe" (
         echo Found existing plink at "%%~D\plink.exe" ^(adding to PATH^).
         set "FoundPlink=%%~D\"
         set "SKIPINSTALL=1"
    )
)

:: ----------------------------------------------------------------------------
:: 1. Check for Administrator Privileges
:: ----------------------------------------------------------------------------
echo Checking for Administrator privileges...
net session >nul 2>&1
if %errorLevel% NEQ 0 (
    >&2 echo ============================================================
    >&2 echo  ERROR: Administrator permissions are required.
    >&2 echo  Please right-click this script and select "Run as administrator".
    >&2 echo ============================================================
    set "ERRORFLAG=1"
    goto :Finalize
)
echo Privileges OK.

:: ----------------------------------------------------------------------------
:: 2. Set Variables
:: ----------------------------------------------------------------------------
:: The official PuTTY site provides a direct link to the latest stable 64-bit MSI installer.
set "DownloadURL=https://the.earth.li/~sgtatham/putty/latest/w64/putty-64bit-0.83-installer.msi"

:: Define where to save the installer and what to name it.
set "InstallerFile=%TEMP%\putty_installer.msi"

echo(
echo ============================================================
echo  PuTTY Automated Installer
echo ============================================================
echo(
echo  Download URL: %DownloadURL%
echo  Saving to:    %InstallerFile%
echo(

:: ----------------------------------------------------------------------------
:: 3. Download the Installer
:: ----------------------------------------------------------------------------
if not defined SKIPINSTALL (
    echo Downloading PuTTY...
    powershell -NoLogo -NoProfile -Command "try { (New-Object System.Net.WebClient).DownloadFile('%DownloadURL%','%InstallerFile%') } catch { Write-Host 'DOWNLOAD FAILED' ; exit 1 }"
    if not exist "%InstallerFile%" (
        >&2 echo ERROR: Download failed.
        >&2 echo Please check your internet connection and the Download URL in the script.
    set "ERRORFLAG=2"
        goto :VerifyPlink
    )
    echo Download complete.
)

:: ----------------------------------------------------------------------------
:: 4. Install PuTTY Silently
:: ----------------------------------------------------------------------------
if not defined SKIPINSTALL (
    echo(
    echo Installing PuTTY silently...
    msiexec /i "%InstallerFile%" /qn
    if errorlevel 1 (
        >&2 echo ERROR: Installation failed with error code %errorLevel%.
    set "ERRORFLAG=3"
        goto :cleanup
    )
    echo PuTTY installation succeeded.
)

:: ----------------------------------------------------------------------------
:: 5. Cleanup
:: ----------------------------------------------------------------------------
:cleanup
echo(
echo Cleaning up downloaded files...
if exist "%InstallerFile%" (
    del "%InstallerFile%"
)
echo Cleanup complete.
echo(

:: ----------------------------------------------------------------------------
:: 6. Finish
:: ----------------------------------------------------------------------------
echo ============================================================
echo  Installation phase finished.
echo ============================================================

:VerifyPlink
echo(
echo Verifying that plink is available on PATH...
where plink >nul 2>&1
if errorlevel 1 (
    call :EnsurePlinkPath
) else (
    echo plink.exe is available on PATH.
)

:Finalize
endlocal & exit /b %ERRORFLAG%

:: ----------------------------------------------------------------------------
:: Subroutines
:: ----------------------------------------------------------------------------
goto :eof

:EnsurePlinkPath
echo ------------------------------------------------------------
echo  WARNING: plink.exe was NOT found on the current PATH.
echo ------------------------------------------------------------
echo  Searching common installation directories...
set "FoundPlink="
for %%P in ("C:\Program Files\PuTTY\plink.exe" "C:\Program Files (x86)\PuTTY\plink.exe") do (
    if exist "%%~P" (
        echo    Located: %%~P
        set "FoundPlink=%%~dpP"
        goto :FoundPlinkDir
    )
)
>&2 echo  plink.exe was not located in default PuTTY install paths.
>&2 echo  Installation may have failed or used a custom directory.
set "ERRORFLAG=4"
goto :eof

:FoundPlinkDir
echo(
echo  plink.exe exists but its folder is not on PATH.
echo  Attempting to add folder to SYSTEM PATH automatically...
set "PlinkDir=!FoundPlink:~0,-1!"  
:: Add only if not already present in machine PATH
powershell -NoLogo -NoProfile -Command "try { $p=[Environment]::GetEnvironmentVariable('Path','Machine'); if(($p.Split(';') -notcontains '%PlinkDir%')) { [Environment]::SetEnvironmentVariable('Path', ($p.TrimEnd(';') + ';%FoundPlink%'), 'Machine'); Write-Host 'Added %FoundPlink% to system PATH.' } else { Write-Host 'Folder already present in system PATH.' } } catch { Write-Host 'Failed to modify system PATH: ' + $_; exit 1 }"
if errorlevel 1 (
    set "ERRORFLAG=5"
    >&2 echo  ERROR: Failed to add PuTTY folder to system PATH.
)
set "PATH=%PATH%;%FoundPlink%"
echo  Updated current session PATH.
echo  NOTE: New terminals or applications may need to be restarted to see the updated PATH.
goto :eof