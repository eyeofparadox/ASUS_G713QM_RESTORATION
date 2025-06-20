<#
.SYNOPSIS
  CanonMerge v0.9a — Dry-run aware delta analyzer

.DESCRIPTION
  Performs a delta comparison of source and target files using basic metadata
  (size + modified time). Can fall back to content hash if needed. Supports
  structured dry-run mode that outputs Markdown-formatted logs without affecting data.

.NOTES
  Author       : David B. Roberson [EyeOfParadox]
  Version      : 0.9a
  License      : Private | Attribution Preserved
  PowerShell   : 5.1.0.0
  Encoding     : UTF-8 (no BOM)
  Compatible   : Windows, StandardHost, ConsoleHost
  Intended Use : Local analysis and recovery scripting
#>

param(
    [string]$SourceRoot,
    [string]$TargetRoot,
    [switch]$SimulateOnly,
    [string]$LogTail,
    [switch]$EnableHashFallback
)

# Defaults
if (-not $SourceRoot)     { $SourceRoot     = "G:\Lab\_In" }
if (-not $TargetRoot)     { $TargetRoot     = "G:\Lab\_Open" }
if (-not $LogTail)        { $LogTail        = "delta-run" }

Write-Host -Object "[21] $SourceRoot, $TargetRoot, $LogTail"

$logBuffer = @()
$sampleIndex = 0
$hashCache = @{}

function Get-RelativePath {
    param($file, $root)
    return $file.FullName.Substring($root.Length).TrimStart('\')
}

function Get-FileHashID {
    param($file)
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

Write-Host -Object "[61] Hash module initialized"

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

Write-Host -Object ("[65:I - $sampleIndex] Comparing index of $($sourceFiles.Count) sources to $($targetFiles.Count) targets`n")

# Step 2: Analyze differences
foreach ($rel in $sourceMap.Keys) {
    $sampleIndex++
    $src = $sourceMap[$rel]
    $status = ""
    $reason = ""
    $confidence = ""

    if (-not $src) {
        Write-Host -Object "[ERR] No source file resolved for key: $rel"
        continue
    }

    $srcPath = $src.FullName
    $lengthKB = $src.Length / 1024
    $srcSize = [math]::Round($lengthKB, 2)
    $srcTime = $src.LastWriteTime

    if ($targetMap.ContainsKey($rel)) {
        $tgt = $targetMap[$rel]
        if ($src.Length -eq $tgt.Length -and $src.LastWriteTime -eq $tgt.LastWriteTime) {
            $status = "[Identical]"
            $reason = "Size and timestamp match"
        } elseif ($src.Length -ne $tgt.Length -or $src.LastWriteTime -gt $tgt.LastWriteTime) {
            $status = "[Updated]"
            $reason = "Size or timestamp differs"
        }
    } else {
        $matchFound = $false
        if ($EnableHashFallback) {
            $srcHash = Get-FileHashID -file $src
            foreach ($tfile in $targetFiles) {
                if ($tfile.Length -eq $src.Length) {
                    $tHash = Get-FileHashID -file $tfile
                    if ($tHash -eq $srcHash) {
                        $status = "[Candidate:MovedOrRenamed]"
                        $reason = "Hash match but different path"
                        $confidence = "High"
                        $matchFound = $true
                        break
                    }
                }
            }
        }
        if (-not $matchFound) {
            $status = "[New]"
            $reason = "No match found in target"
        }
    }

    # Logging block — dry-run safe
    $logEntry = ""
    $logEntry += "## Sample #$sampleIndex`r`n"
    $logEntry += "Status: $status`r`n"
    $logEntry += "Source Path: $srcPath`r`n"
    $logEntry += "Size: $srcSize KB`r`n"
    $logEntry += "Modified: $srcTime`r`n"
    $logEntry += "`r`nReason: $reason`r`n"
    if ($confidence -ne "") {
        $logEntry += "Confidence: $confidence`r`n"
    }
    $logBuffer += $logEntry
}

# Final Output (dry-run safe)
$logFile = "merge-dryrun-$LogTail.md"
$logBuffer | Out-File -FilePath $logFile -Encoding UTF8

Write-Host -Object "[132] `n[Delta log written to: $logFile]"

<#
CanonMerge-v0.9a.ps1
#>