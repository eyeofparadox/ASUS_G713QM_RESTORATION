# Define Paths
$wimFile = "I:\sources\install.wim" # Path to install.wim
$targetIndex = 1                    # Windows 11 Home
$driverFolder = "F:\_drivers"       # Path to your driver folder
$workFolder = "F:\_work"            # Path for the fusion output and validation
$rundate = (Get-Date).ToString("yyyyMMdd-HHmmss") # Timestamp for logging
$logFile = "$workFolder\driver-integration-$rundate.log"

# Log Start
"--- Driver Integration Log ---`nRun Date: $rundate`nTarget Index: $targetIndex`n" | Out-File -FilePath $logFile

# Get all .inf files in the driver directory
$driverFiles = Get-ChildItem -Path $driverFolder -Recurse -Filter "*.inf"

# Loop through .inf files and integrate each driver
# Recommended: `dism /Image:I:\sources\install.wim /Index:1 /Add-Driver /Driver:F:\_drivers\<driver>.inf /Recurse`
foreach ($driver in $driverFiles) {
   try {
       Write-Host "`nDISM Command: /Image:$wimFile /Index:$targetIndex /Add-Driver /Driver:$($driver.FullName) /Recurse" -ForegroundColor Green
       "`nDISM Command: /Image:$wimFile /Index:$targetIndex /Add-Driver /Driver:$($driver.FullName) /Recurse" | Out-File -FilePath $logFile -Append

       $process = Start-Process dism.exe -ArgumentList "/Image:$wimFile /Index:$targetIndex /Add-Driver /Driver:$($driver.FullName) /Recurse" -Wait -NoNewWindow -PassThru
       if ($process.ExitCode -eq 0) {
           Write-Host "Success: $($driver.FullName)" -ForegroundColor Cyan
           "Success: $($driver.FullName)" | Out-File -FilePath $logFile -Append
       } else {
           Write-Host "Failed: $($driver.FullName)" -ForegroundColor Red
           "Failed: $($driver.FullName)" | Out-File -FilePath $logFile -Append
       }
   } catch {
       Write-Host "Error: $($driver.FullName)" -ForegroundColor Red
       "Error: $($driver.FullName)" | Out-File -FilePath $logFile -Append
   }
}

Write-Host "`nDriver Integration Completed. Log file: $logFile" -ForegroundColor Yellow
"Driver Integration Completed Successfully." | Out-File -FilePath $logFile -Append
