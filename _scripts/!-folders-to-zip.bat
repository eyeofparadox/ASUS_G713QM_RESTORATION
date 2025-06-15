@echo off
for /d %%D in (*) do (
    "C:\Program Files\7-Zip\7z.exe" a -mx5 "%%D.zip" "%%D\*"
)
