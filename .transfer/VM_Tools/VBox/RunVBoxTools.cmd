REM RunVBoxTools.cmd
@echo off
setlocal EnableDelayedExpansion
:: ================================
:: RunVBoxTools.cmd - VirtualBox Guest Integration
:: ================================
:: Author: David Bryan Roberson [EyeOfParadox]
:: Date: 2025-06-20
:: Logs: RunVBoxTools.log
:: ================================

set "SCRIPT_ROOT=%~dp0"
set "LOG=%SCRIPT_ROOT%RunVBoxTools.log"
echo [%DATE% %TIME%] Starting VirtualBox Tools injector >> "%LOG%"

:: Check for VirtualBox guest presence
wmic baseboard get manufacturer | findstr /i "Oracle" >nul
if errorlevel 1 (
    echo Not a VirtualBox environment. Aborting. >> "%LOG%"
    echo [SKIP] Not inside VirtualBox guest.
    goto :EOF
)

:: Check for VBoxService.exe
if not exist "%SCRIPT_ROOT%VBoxService.exe" (
    echo [WARN] VBoxService.exe missing. >> "%LOG%"
    echo Required runtime not found. >> "%LOG%"
    goto :EOF
)

:: Start VBoxService
start "" "%SCRIPT_ROOT%VBoxService.exe"
echo Started VBoxService.exe >> "%LOG%"

:: Optional: Driver install hooks (if bundled separately)
for %%F in (%SCRIPT_ROOT%\VBox*.sys) do (
    echo Staging driver %%~nxF >> "%LOG%"
    rem :: Manual driver injection goes here, if needed
)

:: Optional: Registry patch
if exist "%SCRIPT_ROOT%windows11-bypass.reg" (
    reg import "%SCRIPT_ROOT%windows11-bypass.reg" >> "%LOG%" 2>&1
    echo Applied registry patch. >> "%LOG%"
)

echo [%DATE% %TIME%] Complete. >> "%LOG%"
endlocal
exit /b
