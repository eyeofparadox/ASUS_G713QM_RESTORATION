# vmware-usb-injection-harvest-strip-down-renaming.ps1
<# 
====================================================================
  [Admin Note: VMware Guest Tool Harvest Script — Suffix Trimmer]
  Author: David Bryan Roberson [EyeOfParadox]
  Purpose: Strips suffixes (GUIDs, version tags) from harvested filenames.
           Handles `.GUID`, `_Win*.GUID`, and logs clean rename results.
  Source Context: Anhdv Guest Integration Toolkit
  Created: 2025-06-20
====================================================================
#>

param (
    [string]$TargetPath = "G:\Lab\.github\ASUS_G713QM_RESTORATION\.transfer\VMware"
)

$logFile = "G:\Lab\.github\ASUS_G713QM_RESTORATION\_scripts\vmware-usb-injection-harvest-rename.log"
$logHeader = "== VMware Filename Strip-Down Log - $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss') =="
Set-Content -Path $logFile -Value $logHeader -Encoding UTF8

Write-Host "`n[INFO] Scanning for GUID/OS-tagged filenames in:`n$TargetPath`n"

Get-ChildItem -Path $TargetPath -Recurse -File | ForEach-Object {
    $originalName = $_.Name

    # Match and strip patterns like:
    # - file.ext.XXXXXXXX_YYYY...
    # - file.ext_Win10.XXXXXXXX_YYYY...
    $cleanName = $null

    if ($originalName -match '^(.+?)_(Win\d+)\.[A-F0-9_]{8,}$') {
        $cleanName = $matches[1]
    }
    elseif ($originalName -match '^(.+?)\.[A-F0-9_]{8,}$') {
        $cleanName = $matches[1]
    }

    if ($cleanName) {
        $newPath = Join-Path -Path $_.Directory.FullName -ChildPath $cleanName

        if (-not (Test-Path $newPath)) {
            Rename-Item -Path $_.FullName -NewName $cleanName
            $logEntry = "$($_.FullName) -> $newPath"
            Add-Content -Path $logFile -Value $logEntry
            Write-Host "[OK]  $originalName → $cleanName"
        }
        else {
            $warn = "[SKIP] Conflict: $cleanName already exists in $($_.Directory.Name)"
            Add-Content -Path $logFile -Value $warn
            Write-Warning $warn
        }
    }
}

Write-Host "`n[DONE] Rename pass complete. Log saved to:`n$logFile`n"
