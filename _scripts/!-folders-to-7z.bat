@echo off
for /d %%D in (*) do (
    "X:\Program Files\7-Zip\7z.exe" a -y -r -m0=lzma2 -mx=9 -t7z "%%D.7z" "%%D\*"
)
