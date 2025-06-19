@echo off
:: Generates a scaffolded casefile markdown with timestamp, ID, and placeholder fields

setlocal
set "date=%DATE:~10,4%-%DATE:~4,2%-%DATE:~7,2%"
set /p id="Enter case number (e.g., 047): "
set /p title="Enter short case title: "

set "filename=_casefiles/%id%-%title:.=-%.md"
set "filename=%filename: =-%"

(
echo # Case File %id% – %title%
echo.
echo **Date:** %date%
echo **System:** [System Name / Context]
echo **Actor:** [User or Entity]
echo **Incident Tag:** `short-tag`
echo.
echo ---
echo.
echo ## Summary
echo.
echo [One-paragraph summary of what occurred, how it was discovered, and why it matters.]
echo.
echo ---
echo.
echo ## Trigger Chain
echo.
echo 1. [Initial event or condition]
echo 2. [Escalating factor or user interaction]
echo 3. [Failure point or anomalous result]
echo.
echo ---
echo.
echo ## Resolution
echo.
echo - [What was observed, attempted, and concluded]
echo - [Which tools or logs were used]
echo - [Outcome or system state post-recovery]
echo.
echo ---
echo.
echo ## Artifacts
echo.
echo - [Scripts, logs, or supporting files]
echo - [Relevant filepaths or system outputs]
echo - [Cross-links to timeline entries]
echo.
echo ---
echo.
echo ## Lessons Learned
echo.
echo - [Short and insightful takeaways]
echo - [What to document, avoid, or reuse]
echo.
echo ---
echo.
echo ## Commentary
echo.
echo > [Optional quote, reflection, or humor from the incident]
echo.
echo ---
echo.
echo ## Timeline Reference
echo.
echo Logged in `timeline.md` as Case %id%
) > "%filename%"

echo.
echo Casefile scaffold created: %filename%
