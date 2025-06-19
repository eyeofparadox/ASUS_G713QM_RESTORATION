rem force-dll-cleanup.cmd

@echo off
setlocal
set "target=G:\Lab\GitHub\in-the-eyeofparadox\iso\Windows_10_20H1_EN-US_KB5058379\Windows\"
set "log=%target%\dll-cleanup.log"

echo === DLL Force-Cleanup Log === > "%log%"
echo Target: %target% >> "%log%"
echo Timestamp: %date% %time% >> "%log%"
echo. >> "%log%"

for /R "%target%" %%F in (*.dll) do (
    echo Processing: %%F >> "%log%"
    takeown /f "%%F" /a >> "%log%" 2>&1
    icacls "%%F" /grant administrators:F >> "%log%" 2>&1
    del /f /q "%%F" >> "%log%" 2>&1

    if exist "%%F" (
        echo FAILED to delete: %%F >> "%log%"
    ) else (
        echo SUCCESS: deleted %%F >> "%log%"
    )
    echo. >> "%log%"
)

echo Cleanup complete. Log saved to: %log%
pause
