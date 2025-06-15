# Define paths !-validate-drivers-hash-sha-256-list.ps1
$listFile = "D:\INSTALLERS\drivers-hash-sha-256-list.txt"
$logFile = "D:\INSTALLERS\drivers-hash-validation-results.log"

# Function to compute SHA-256 hash
function Get-FileHashSHA256 {
    param([string]$FilePath)
    $hash = Get-FileHash -Path $FilePath -Algorithm SHA256
    return $hash.Hash
}

# Log function
function Write-Log {
    param([string]$InstallerPath, [string]$Status, [string]$Details = "")
    $timestamp = (Get-Date).ToString("yyyy-MM-dd HH:mm:ss")
    $logEntry = "$timestamp | $InstallerPath | $Status | $Details"
    Write-Host $logEntry
    Add-Content -Path $logFile -Value $logEntry
}

# Ensure list file exists
if (!(Test-Path $listFile)) {
    Write-Log "drivers-hash-sha-256-list.txt" "Fail" "File not found."
    Exit
}

# Clear previous log file
if (Test-Path $logFile) {
    Remove-Item -Path $logFile -Force
}

Write-Log "Header" "Succeed" "SHA-256 validation process started."

# Read the file and process each line
Get-Content $listFile | ForEach-Object {
    $line = $_ -split "SHA-256: "  # Split line into path and expected hash
    if ($line.Count -eq 2) {
        $installerPath = $line[0].Trim()
        $expectedHash = $line[1].Trim()

        try {
            if (Test-Path $installerPath) {
                # Compute file hash
                $computedHash = Get-FileHashSHA256 -FilePath $installerPath

                # Compare hashes
                if ($computedHash -eq $expectedHash) {
                    Write-Log $installerPath "Succeed" "Hash matches expected value."
                } else {
                    Write-Log $installerPath "Fail" "Hash mismatch. Expected: $expectedHash | Computed: $computedHash"
                }
            } else {
                Write-Log $installerPath "Not Found" "Installer file does not exist."
            }
        } catch {
            Write-Log $installerPath "Fail" "Error: $($_.Exception.Message)"
        }
    } else {
        Write-Log "Invalid Line Format" "Fail" "Line does not contain valid path and hash."
    }
}

Write-Log "Summary" "Succeed" "SHA-256 validation process completed."
