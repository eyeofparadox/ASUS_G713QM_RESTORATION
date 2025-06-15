:: Improved Batch Script with Error Handling | copilot-asus-oem-config-repair.bat

@echo off
title ASUS OEM Partition Repair
setlocal ENABLEDELAYEDEXPANSION
echo Fixing partition relationships...
echo Log file: %TEMP%\asus_oem_repair.log
echo ASUS OEM Repair Script Started > %TEMP%\asus_oem_repair.log

:: Check if running as Administrator
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo ERROR: Please run this script as Administrator.
    echo ERROR: Please run this script as Administrator. >> %TEMP%\asus_oem_repair.log
    exit /b 1
)

:: Ensure partitions exist
echo Checking partitions...
(echo list disk
 echo list volume
 echo exit) | diskpart > %TEMP%\diskpart_check.txt

findstr /I "RECOVERY RESTORE MYASUS" %TEMP%\diskpart_check.txt >nul
if %errorlevel% neq 0 (
    echo ERROR: Required partitions not found!
    echo ERROR: Required partitions not found! >> %TEMP%\asus_oem_repair.log
    exit /b 1
)

:: Assign drive letters temporarily
echo Assigning partition letters...
(echo select disk 0
 echo list volume
 echo select volume X  REM Replace X with RECOVERY partition number
 echo assign letter=X
 echo select volume Y  REM Replace Y with RESTORE partition number
 echo assign letter=Y
 echo select volume Z  REM Replace Z with MYASUS partition number
 echo assign letter=Z
 echo exit) | diskpart

:: Verify assignments
echo Verifying partition assignments...
if not exist X:\ (
    echo ERROR: RECOVERY partition assignment failed!
    echo ERROR: RECOVERY partition assignment failed! >> %TEMP%\asus_oem_repair.log
    exit /b 1
)

:: Remove old ReAgent.xml if exists
echo Cleaning up old ReAgent.xml...
if exist C:\Windows\System32\Recovery\ReAgent.xml (
    ren C:\Windows\System32\Recovery\ReAgent.xml ReAgent.old
    echo Renamed existing ReAgent.xml >> %TEMP%\asus_oem_repair.log
)

:: Link Windows Recovery Environment
echo Linking Windows Recovery Environment...
reagentc /disable
if %errorlevel% neq 0 (
    echo ERROR: reagentc /disable failed!
    echo ERROR: reagentc /disable failed! >> %TEMP%\asus_oem_repair.log
    exit /b 1
)

reagentc /setreimage /path X:\Recovery\WindowsRE /target C:\Windows
if %errorlevel% neq 0 (
    echo ERROR: reagentc /setreimage failed!
    echo ERROR: reagentc /setreimage failed! >> %TEMP%\asus_oem_repair.log
    exit /b 1
)

reagentc /enable
if %errorlevel% neq 0 (
    echo ERROR: reagentc /enable failed!
    echo ERROR: reagentc /enable failed! >> %TEMP%\asus_oem_repair.log
    exit /b 1
)

:: Remove assigned letters
echo Removing temporary partition assignments...
(echo select disk 0
 echo select volume X
 echo remove letter=X
 echo select volume Y
 echo remove letter=Y
 echo select volume Z
 echo remove letter=Z
 echo exit) | diskpart

echo Repair complete! Restart and check MyASUS in WinRE.
echo Repair complete! >> %TEMP%\asus_oem_repair.log
pause


