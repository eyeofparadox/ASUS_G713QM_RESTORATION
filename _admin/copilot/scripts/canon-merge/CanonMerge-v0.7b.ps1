# CanonMerge-v0.7.ps1
<#
.SYNOPSIS
    Canon-aware dry-run merge tool with semantic diffing, overflow redirection, and structured logging.

.PARAMETER SourceRoot
    Primary comparison folder (e.g., Git-G)

.PARAMETER TargetRoot
    Secondary comparison folder (e.g., Git-X)

.PARAMETER SampleParents
    Number of top-level folders to include (/p)

.PARAMETER SampleDepth
    Subdirectory depth to scan within each parent (/d)

.PARAMETER SampleLimit
    Max number of files to simulate (/s)

.PARAMETER SimulateOnly
    [Switch] If set, outputs where files would go without comparing content

.PARAMETER LogTail
    Naming tail for .md logs (e.g., dryrun-sample-001)

.PARAMETER EnableOverflow
    [Switch] Redirect >2GB files to overflow staging path

.PARAMETER OverflowRoot
    Custom overflow target, defaults to ..\Lab\Overflow
#>

param (
    [string]$SourceRoot = "G:\Lab\_In",
    [string]$TargetRoot = "G:\Lab\_Open",
    [int]$SampleParents = 3,
    [int]$SampleDepth = 5,
    [int]$SampleLimit = 15,
    [switch]$SimulateOnly,
    [switch]$EnableOverflow,
    [string]$OverflowRoot = "..\Lab\Overflow",
    [string]$LogTail = "dryrun-001",
    [switch]$LogCompact
)

# function Parse-CanonName($filePath) {
    # $base = [System.IO.Path]::GetFileNameWithoutExtension($filePath)
    # $ext = [System.IO.Path]::GetExtension($filePath)
    # return "$($base)-canonicalized$ext"
# }

# Identify top-level folders to sample
# $parents = Get-ChildItem -Path $SourceRoot -Directory | Select-Object -First $SampleParents
# $files = foreach ($parent in $parents) {
    # Get-ChildItem -Path $parent.FullName -Recurse -Depth $SampleDepth -File |
        # Select-Object -First ($SampleLimit / $SampleParents)
# }
$files = Get-ChildItem -Path $SourceRoot -Recurse -File


# Initialize output buffer
$logSample = @()
$counter = 0
$overflowThreshold = 2GB
$charLimit = if ($LogCompact) { 7800 } else { [int]::MaxValue }
$currentLength = 0

# Header block
$logHeader = @"
## CanonMerge v0.7b - Sample Report  
LogMode: $(if ($LogCompact) { "Compact" } else { "Full" })  
SampleParents: $SampleParents  
SampleDepth: $SampleDepth  
SampleLimit: $SampleLimit  
OverflowThreshold: 2GB  
EnableOverflow: $($EnableOverflow.IsPresent)  

---
"@
$logSample += $logHeader
$currentLength += $logHeader.Length

# Begin per-sample logging
foreach ($file in $files) {
    $counter++
    $relativePath = $file.FullName.Substring($SourceRoot.Length).TrimStart('\')
    # $canonName = Parse-CanonName $file.FullName
    $destPath = Join-Path $TargetRoot $relativePath
    $isOverflow = $EnableOverflow -and ($file.Length -gt $overflowThreshold)
    $newPath = if ($isOverflow) { Join-Path $OverflowRoot $relativePath } else { $destPath }
    $status = if ($isOverflow) { "WOULD REDIRECT TO OVERFLOW" } else { "WOULD COPY TO TARGET" }

# Canonical Name: $canonName  
    $entry = @"
## Sample #$counter  
Source: $($file.FullName)  
Size: $([math]::Round($file.Length / 1MB, 2)) MB  
Canonical Name: <pending-implementation>  
Target: $newPath  
Status: $status  

"@
    $currentLength += $entry.Length
    if ($currentLength -gt $charLimit) { break }
    $logSample += $entry
}

# Write to log file
$logFile = "merge-$LogTail.md"
$logSample | Out-File $logFile -Encoding UTF8 -Force

Write-Host "`n[CanonMerge Sample Pass Complete]"
Write-Host "==> Sample log written to: $logFile"

<#
-scriptLaunchAt	G:\Lab\_In\GitHub\_admin\scripts

.\CanonMerge-v0.7b.ps1
#>