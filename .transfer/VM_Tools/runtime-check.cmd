REM runtime-check.cmd
@echo off
setlocal EnableDelayedExpansion
:: ================================
:: runtime-check.cmd - Environment Validator
:: ================================
:: Author: David Bryan Roberson [EyeOfParadox]
:: Date: 2025-06-20
:: Logs: runtime-check.log
:: ================================

set "SCRIPT_ROOT=%~dp0"
set "LOG=%SCRIPT_ROOT%runtime-check.log"
echo [%DATE% %TIME%] Runtime preflight check initiated >> "%LOG%"

:: Check for PowerShell ≥ 5.1
set "PSEXE=%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe"
if not exist "%PSEXE%" (
    echo [FAIL] PowerShell not found. >> "%LOG%"
    echo PowerShell not detected.
) else (
    for /f "tokens=2 delims==" %%v in ('"%PSEXE%" -Command "$PSVersionTable.PSVersion.Major"') do (
        set "PSVER=%%v"
    )
    if !PSVER! LSS 5 (
        echo [WARN] PowerShell version < 5.1: !PSVER! >> "%LOG%"
    ) else (
        echo PowerShell version: !PSVER! >> "%LOG%"
    )
)

:: Look for vcredist files
set "VCX=%SCRIPT_ROOT%_runtime\vcredist\vcredist_x86.exe"
set "VCX64=%SCRIPT_ROOT%_runtime\vcredist\vcredist_x64.exe"

if exist "%VCX%" (
    echo Found vcredist_x86.exe >> "%LOG%"
) else (
    echo [MISSING] vcredist_x86.exe >> "%LOG%"
)

if exist "%VCX64%" (
    echo Found vcredist_x64.exe >> "%LOG%"
) else (
    echo [MISSING] vcredist_x64.exe >> "%LOG%"
)

:: Detect VMware / VBox presence
wmic computersystem get manufacturer | findstr /i "VMware" >nul
if %errorlevel%==0 echo Detected VMware guest >> "%LOG%"

wmic baseboard get manufacturer | findstr /i "Oracle" >nul
if %errorlevel%==0 echo Detected VirtualBox guest >> "%LOG%"

echo [%DATE% %TIME%] Runtime check complete. >> "%LOG%"
endlocal
exit /b
