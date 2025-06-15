$source = "G:\DAZ 3D"
$destination = "K:\DAZ 3D"
$logFile = "K:\DAZ_3D_Migration.log"

# Create or append to the log file
function Log-Message {
    param([string]$message)
    Add-Content -Path $logFile -Value "$(Get-Date) - $message"
}

Log-Message "Starting validation and migration process"

# Get source and destination files
$sourceFiles = Get-ChildItem -LiteralPath "$source" -Recurse | Where-Object { $_.PSIsContainer -eq $false }
$destinationFiles = Get-ChildItem -LiteralPath "$destination" -Recurse | Where-Object { $_.PSIsContainer -eq $false }

# Create a hash table of destination files
$destinationHash = @{}
foreach ($file in $destinationFiles) {
    $relativePath = $file.FullName.Replace($destination, "")
    $destinationHash[$relativePath] = $file
}

# Validate and remove source copies if they exist in destination
foreach ($file in $sourceFiles) {
    $relativePath = $file.FullName.Replace($source, "")
    $destPath = "`"$destination$relativePath`""

    if ($destinationHash.ContainsKey($relativePath)) {
        Remove-Item -LiteralPath "`"$file.FullName`"" -Force
        Log-Message "Removed duplicate: $file.FullName"
    }
}

# Identify and move files that were skipped
$remainingSourceFiles = Get-ChildItem -LiteralPath "$source" -Recurse | Where-Object { $_.PSIsContainer -eq $false }
foreach ($file in $remainingSourceFiles) {
    $relativePath = $file.FullName.Replace($source, "")
    $destPath = "`"$destination$relativePath`""

    try {
        Move-Item -LiteralPath "`"$file.FullName`"" -Destination "`"$destPath`"" -Force
        Log-Message "Moved: $file.FullName -> $destPath"
    } catch {
        Log-Message "Exception moving $file.FullName: $_"
    }
}

Log-Message "Migration process completed"
Write-Host "Migration complete. Check $logFile for details."
