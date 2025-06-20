

# $braceCount = 0
# Get-Content .\CanonMerge-v0.8-dev.ps1 | ForEach-Object {
#     $braceCount += ($_ -split '{').Count - 1
#     $braceCount -= ($_ -split '}').Count - 1
#     "$braceCount`t$_"
# } | Set-Content .\_brace_tracker.txt

param (
    [string]$SourceRoot
    [string]$TargetRoot
    [switch]$SimulateOnly
    [string]$LogTail
    [switch]$EnableHashFallback
)

if (-not $SourceRoot)     { $SourceRoot     = "G:\Lab\_In" }
if (-not $TargetRoot)     { $TargetRoot     = "G:\Lab\_Open" }
if (-not $LogTail)        { $LogTail        = "delta-run" }
Write-Host "[21] $SourceRoot, $TargetRoot, $LogTail"

$logBuffer = @()
$sampleIndex = 0
$hashCache = @{}

function Get-RelativePath {
    param ($file, $root)
    return $file.FullName.Substring($root.Length).TrimStart('\')
}
Write-Host "[31] Get-RelativePath() cleared."

function Get-FileHashID {
    param ($file)
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
Write-Host "[61] Get-FileHashID() cleared."

Write-Host "`n[CanonMerge v0.8-dev — Clean Delta Run]"

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
Write-Host ("[65:I - " + $sampleIndex + "] Checking: " + $src.FullName)


# Step 2: Analyze differences
foreach ($rel in $sourceMap.Keys) {
    $sampleIndex++
    $src = $sourceMap[$rel]
    $status = ""
    $reason = ""
    $confidence = ""

    $srcPath = $src.FullName
    $srcSize = [math]::Round($src.Length / 1KB, 2)
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
Write-Host "[111] Step 2: Analyze differences cleared."


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
Write-Host "125: Reached closing brace for source map loop"
}
Write-Host "127: Cleared closing brace for source map loop"

# Step 3: Output log
$logFile = "delta-log-$LogTail.md"
$logBuffer | Out-File $logFile -Encoding UTF8 -Force
Write-Host "[132] `n[Delta log written to: $logFile]"
