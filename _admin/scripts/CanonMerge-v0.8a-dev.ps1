<#
.SYNOPSIS
    Canon-aware delta diffing tool with semantic logging, group inference, and intelligent orphan adoption.

.PARAMETER SourceRoot
    Primary repository root (e.g., G:\Lab\_In)

.PARAMETER TargetRoot
    Comparison repository root (e.g., G:\Lab\_Open)

.PARAMETER SimulateOnly
    If set, performs a dry run without any changes

.PARAMETER LogTail
    Custom suffix for the log file name

.PARAMETER EnableHashFallback
    Optional deep-matching for moved/renamed outliers

.PARAMETER EnableOverflow
    Enables overflow redirection (future use)

#>

param (
    [string]$SourceRoot = "G:\Lab\_In",
    [string]$TargetRoot = "G:\Lab\_Open",
    [switch]$SimulateOnly,
    [string]$LogTail = "delta-run-001",
    [switch]$EnableHashFallback,
    [switch]$EnableOverflow
)

$logBuffer = @()
$sampleIndex = 0
$hashCache = @{}

function Get-RelativePath ($file, $root) {
    return $file.FullName.Substring($root.Length).TrimStart('\')
}

function Get-FileHashID ($file) {
    if ($hashCache.ContainsKey($file.FullName)) {
        return $hashCache[$file.FullName]
    }
    try {
        $hash = Get-FileHash -Path $file.FullName -Algorithm SHA256
        $hashCache[$file.FullName] = $hash.Hash
        return $hash.Hash
    } catch {
        return "HASH_ERROR"
    }
}

Write-Host "`n[CanonMerge v0.8-dev — Delta Pass]"

# Step 1: Index source and target
$sourceFiles = Get-ChildItem -Path $SourceRoot -Recurse -File
$targetFiles = Get-ChildItem -Path $TargetRoot -Recurse -File

$sourceMap = @{}
$targetMap = @{}

foreach ($sf in $sourceFiles) {
    $rel = Get-RelativePath $sf $SourceRoot
    $sourceMap[$rel] = $sf
}
foreach ($tf in $targetFiles) {
    $rel = Get-RelativePath $tf $TargetRoot
    $targetMap[$rel] = $tf
}

# Step 2: Analyze differences
foreach ($rel in $sourceMap.Keys) {
    $sampleIndex++
    $src = $sourceMap[$rel]
    $status = ""
    $reason = ""
    $confidence = ""
    $hashMatch = ""

    if ($targetMap.ContainsKey($rel)) {
        $tgt = $targetMap[$rel]
        if ($src.Length -eq $tgt.Length -and $src.LastWriteTime -eq $tgt.LastWriteTime) {
            $status = "[Identical]"
            $reason = "Size and timestamp match"
        } elseif ($src.Length -ne $tgt.Length -or $src.LastWriteTime -gt $tgt.LastWriteTime) {
            $status = "[Updated]"
            $reason = "Source newer or larger than target"
        }
    } 
    else {
        # Target missing — try to resolve as moved or renamed
        $matchFound = $false

        if ($EnableHashFallback) {
            $srcHash = Get-FileHashID $src
            foreach ($tfile in $targetFiles) {
                if ($tfile.Length -eq $src.Length) {
                    $tHash = Get-FileHashID $tfile
                    if ($tHash -eq $srcHash) {
                        $status = "[Candidate:MovedOrRenamed]"
                        $reason = "Size + hash match, different path"
                        $confidence = "High"
                        $matchFound = $true
                        break
                    }
                }
            }
        }

        if (-not $matchFound) {
            $status = "[New]"
            $reason = "No path or fingerprint match in target"
        }
    }
    
$srcPath = if ($src -and $src.FullName) { $src.FullName } else { "<MISSING>" }
$srcSize = if ($src -and $src.Length) { [math]::Round($src.Length / 1KB, 2) } else { 0 }
$srcTime = if ($src -and $src.LastWriteTime) { $src.LastWriteTime } else { "Unknown" }

$logBlock = @"
Sample #$sampleIndex
Status: $status
Source Path: $srcPath
Size: $srcSize KB
Modified: $srcTime

Reason: $reason
Confidence: $confidence
"@

}

# Step 3: Write log
$logFile = "delta-log-$LogTail.md"
$logBuffer | Out-File $logFile -Encoding UTF8 -Force
Write-Host "`n[Delta log written to: $logFile]"

<#
To run a full dry-pass with diagnostics:

.\CanonMerge-v0.8-dev.ps1 `
  -SimulateOnly `
  -EnableHashFallback `
  -LogTail "delta-dryrun-001"

#>
