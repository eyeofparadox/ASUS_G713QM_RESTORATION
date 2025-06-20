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
    [string]$SourceRoot = "G:\Lab\Git-G",
    [string]$TargetRoot = "G:\Lab\Git-X",
    [int]$SampleParents = 3,
    [int]$SampleDepth = 2,
    [int]$SampleLimit = 50,
    [switch]$SimulateOnly,
    [switch]$EnableOverflow,
    [string]$OverflowRoot = "..\Lab\Overflow",
    [string]$LogTail = "sample-dryrun-001"
)

# Canon-aware prelude
function Parse-CanonName($filePath) {
    # $base = Split-Path $filePath -LeafBase
	$base = [System.IO.Path]::GetFileNameWithoutExtension($filePath)
    $ext = [System.IO.Path]::GetExtension($filePath)
    return "$($base)-canonicalized$ext"
}

# Sampling logic
$parents = Get-ChildItem -Path $SourceRoot -Directory | Select-Object -First $SampleParents

$files = foreach ($parent in $parents) {
    Get-ChildItem -Path $parent.FullName -Recurse -Depth $SampleDepth -File |
        Select-Object -First ($SampleLimit / $SampleParents)
}

# Create logs
$logSample = @()
$counter = 0

foreach ($file in $files) {
    $counter++
    $relativePath = $file.FullName.Substring($SourceRoot.Length).TrimStart('\')
    $canonName = Parse-CanonName $file.FullName
    $dest = Join-Path $TargetRoot $relativePath
    $overflow = $file.Length -gt 2GB -and $EnableOverflow
    $newPath = if ($overflow) { Join-Path $OverflowRoot $relativePath } else { $dest }

    $logSample += @"
## Sample #$counter
Source: $($file.FullName)
Size: $([math]::Round($file.Length / 1MB, 2)) MB
Canonical Name: $canonName
Target: $newPath
Status: WOULD REDIRECT TO OVERFLOW
"@
}

# Export sample log
$logFile = "merge-$LogTail.md"
$logSample | Out-File $logFile -Encoding UTF8 -Force

Write-Host "`n[CanonMerge Sample Pass Complete]"
Write-Host "➤ Sample log written to: $logFile"

<#
-scriptLaunchAt	G:\Lab\_In\GitHub\_admin\scripts

I can guess this much:
`.\CanonMerge-v0.7.ps1 G:\Lab\_In G:\Lab\_Open `

How do I complete, with these variables?:
-SampleParents	3	(we don't start branching right away, I realized. might need to define -StartAtDepth)
-SampleDepth	5
-SampleLimit	250
-SimulateOnly	true

.\CanonMerge-v0.7.ps1 `
  -SourceRoot "G:\Lab\_In" `
  -TargetRoot "G:\Lab\_Open" `
  -SampleParents 3 `
  -SampleDepth 5 `
  -SampleLimit 250 `
  -SimulateOnly `
  -EnableOverflow `
  -LogTail "dryrun-001"

#>