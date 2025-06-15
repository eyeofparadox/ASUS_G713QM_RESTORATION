@echo off
setlocal enabledelayedexpansion

for /f "tokens=*" %%F in (image-list--get-hash.txt) do (
    echo Processing: %%F
    certutil -hashfile "%%F" MD5
    echo.
)
pause
