@echo off
for /f "tokens=*" %%A in (R:\folders.txt) do (
  md "R:\_IMAGES\%%A"
)