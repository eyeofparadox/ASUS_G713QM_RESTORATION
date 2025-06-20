# vmware-usb-injection-shell-folder-split.ps1
<# 
====================================================================
  [Admin Note: VMware Guest Tool Harvest Script — OS Router + Renamer]
  Author: David Bryan Roberson [EyeOfParadox]
  Purpose: Detects version-tagged filenames (e.g., _Win10.GUID),
           routes them to drivers\Win10\ and renames to base form.
  Source Context: Anhdv Guest Integration Toolkit
  Created: 2025-06-20
====================================================================
#>

param (
    [string]$TargetPath = "G:\Lab\.github\ASUS_G713QM_RESTORATION\.transfer\VMware"
)

$logFile = "G:\Lab\.github\ASUS_G713QM_RESTORATION\_scripts\vmware-usb-injection-harvest-foldered-rename.log"
$logHeader = "== VMware Foldered Rename Log - $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss') =="
Set-Content -Path $logFile -Value $logHeader -Encoding UTF8

Write-Host "`n[INFO] Routing versioned files from:`n$TargetPath`n"

Get-ChildItem -Path $TargetPath -Recurse -File | ForEach-Object {
    $originalName = $_.Name
    $originalPath = $_.FullName

    # Detect filenames with "_WinX.<GUID>" pattern
    if ($originalName -match '^(.+?)_Win(\d{1,2})\.[A-F0-9_]{8,}$') {
        $baseName = $matches[1]
        $osVersion = "Win$($matches[2])"
        $extension = [System.IO.Path]::GetExtension($baseName)
        $fileBase  = [System.IO.Path]::GetFileNameWithoutExtension($baseName)
        $destDir   = Join-Path -Path $TargetPath -ChildPath "drivers\$osVersion"
        $destPath  = Join-Path -Path $destDir -ChildPath "$fileBase$extension"

        if (-not (Test-Path $destDir)) {
            New-Item -Path $destDir -ItemType Directory | Out-Null
        }

        if (-not (Test-Path $destPath)) {
            Move-Item -Path $originalPath -Destination $destPath
            $logLine = "$originalPath -> $destPath"
            Add-Content -Path $logFile -Value $logLine
            Write-Host "[OK]  Routed $originalName → drivers\$osVersion\$fileBase$extension"
        }
        else {
            $warn = "[SKIP] Conflict: $fileBase$extension exists in drivers\$osVersion"
            Add-Content -Path $logFile -Value $warn
            Write-Warning $warn
        }
    }
}
Write-Host "`n[DONE] Routing and renaming complete. Log saved to:`n$logFile`n"
