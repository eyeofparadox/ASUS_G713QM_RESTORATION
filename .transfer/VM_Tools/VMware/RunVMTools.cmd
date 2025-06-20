REM RunVMTools.cmd
@echo off
setlocal EnableDelayedExpansion
:: ================================
:: RunVMTools.cmd - VMware Guest Integration
:: ================================
:: Author: David Bryan Roberson [EyeOfParadox]
:: Date: 2025-06-20
:: Logs: RunVMTools.log
:: ================================

set "SCRIPT_ROOT=%~dp0"
set "LOG=%SCRIPT_ROOT%RunVMTools.log"
echo [%DATE% %TIME%] Starting VMware Tools injector >> "%LOG%"

:: Check for VMware guest presence
wmic computersystem get manufacturer | findstr /i "VMware" >nul
if errorlevel 1 (
    echo Not a VMware environment. Aborting. >> "%LOG%"
    echo [SKIP] Not inside VMware guest.
    goto :EOF
)

:: Detect OS Version
for /f "tokens=4-5 delims=. " %%i in ('ver') do (
    set "OSMAJOR=%%i"
    set "OSBUILD=%%j"
)
if "%OSMAJOR%"=="10" set "OSFOLDER=Win10"
if "%OSMAJOR%"=="6" (
    if "%OSBUILD%"=="1" set "OSFOLDER=Win7"
    if "%OSBUILD%"=="2" set "OSFOLDER=Win8"
)
if "%OSMAJOR%"=="11" set "OSFOLDER=Win11"

echo Detected OS folder: %OSFOLDER% >> "%LOG%"
if not exist "%SCRIPT_ROOT%drivers\%OSFOLDER%\" (
    echo [WARN] No driver folder for %OSFOLDER% >> "%LOG%"
    echo [FAIL] No drivers staged for %OSFOLDER%.
    goto :EOF
)

:: Inject drivers
for %%F in (%SCRIPT_ROOT%drivers\%OSFOLDER%\*.inf) do (
    echo Installing driver: %%~nxF >> "%LOG%"
    pnputil /add-driver "%%F" /install >> "%LOG%" 2>&1
)

:: Launch services if available
for %%X in (vmtoolsd.exe rpctool.exe VMwareToolboxCmd.exe) do (
    if exist "%SCRIPT_ROOT%%%X" (
        start "" "%SCRIPT_ROOT%%%X"
        echo Started %%X >> "%LOG%"
    )
)

echo [%DATE% %TIME%] Complete. >> "%LOG%"
endlocal
exit /b
