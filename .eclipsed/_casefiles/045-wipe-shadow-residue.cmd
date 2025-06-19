rem __wipe-shadow-residue.cmd
@echo off
setlocal enabledelayedexpansion

set "target=G:\Lab\GitHub\in-the-eyeofparadox\iso\Windows_10_20H1_EN-US_KB5058379\Windows"
set "log=%~dp0orphan-cleanup.log"
set "blank=%~dp0blank"

echo === Orphan Cleanup Log === > "%log%"
echo Target: %target% >> "%log%"
echo %date% %time% >> "%log%"
echo. >> "%log%"

rd /s /q "%target%"
if exist "%target%" (
    echo RD failed. Trying robocopy overwrite... >> "%log%"
    if not exist "!blank!" md "!blank!"
    
    echo robocopy "!blank!" "!target!" /MIR >> "%log%"
    robocopy "!blank!" "!target!" /MIR /NFL /NDL /NJH /NJS /R:1 /W:1 >> "%log%" 2>&1
    rd /s /q "!blank!"
)

if exist "%target%" (
    echo FINAL FAIL: %target% still exists >> "%log%"
) else (
    echo SUCCESS: %target% removed or overwritten >> "%log%"
)
echo Done. >> "%log%"
