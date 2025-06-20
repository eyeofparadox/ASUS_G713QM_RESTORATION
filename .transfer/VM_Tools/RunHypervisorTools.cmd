REM RunHypervisorTools.cmd
@echo off
setlocal EnableDelayedExpansion
:: ================================
:: RunHypervisorTools.cmd - Unified Guest Tool Dispatcher
:: ================================
:: Author: David Bryan Roberson [EyeOfParadox]
:: Date: 2025-06-20
:: Logs: RunHypervisorTools.log
:: ================================

set "SCRIPT_ROOT=%~dp0"
set "LOG=%SCRIPT_ROOT%RunHypervisorTools.log"
echo [%DATE% %TIME%] Starting hypervisor dispatcher >> "%LOG%"

:: Check for VMware
wmic computersystem get manufacturer | findstr /i "VMware" >nul
if %errorlevel%==0 (
    if exist "%SCRIPT_ROOT%VMware\RunVMTools.cmd" (
        call "%SCRIPT_ROOT%VMware\RunVMTools.cmd"
        echo Launched VMware guest tools. >> "%LOG%"
        goto :EOF
    )
)

:: Check for VirtualBox
wmic baseboard get manufacturer | findstr /i "Oracle" >nul
if %errorlevel%==0 (
    if exist "%SCRIPT_ROOT%VBox\RunVBoxTools.cmd" (
        call "%SCRIPT_ROOT%VBox\RunVBoxTools.cmd"
        echo Launched VirtualBox guest tools. >> "%LOG%"
        goto :EOF
    )
)

echo No known hypervisor detected or tools missing. >> "%LOG%"
echo [SKIP] No matching guest toolchain launched.
endlocal
exit /b
