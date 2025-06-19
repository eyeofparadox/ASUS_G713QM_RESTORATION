# Fix-ScriptPrefixes.ps1
param (
    [string]$RootPath = ".",
    [switch]$DryRun,
    [string]$LogFile = "script_prefix_cleanup.log"
)

# Prefix map
$prefixMap = @{
    '!!-' = '---'
    '!!_' = '___'
    '!-'  = '--'
    '!_'  = '__'
}

# Target file extensions
$targetExts = '.ps1', '.bat', '.cmd', '.txt', '.log', '.md', '.html', '.mhtml'

# Init log
$LogPath = Join-Path $RootPath $LogFile
"== Prefix Cleanup Log | $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss') ==" | Out-File $LogPath -Encoding UTF8 -Append

$renamed = 0; $skipped = 0

# Rename logic
Get-ChildItem -Path $RootPath -Recurse -File | Where-Object {
    $targetExts -contains $_.Extension.ToLower()
} | ForEach-Object {
    $name = $_.Name
    $match = $prefixMap.Keys | Where-Object { $name.StartsWith($_) }
    if ($match.Count -gt 0) {
        $newPrefix = $prefixMap[$match[0]]
        $newName = $name -replace "^\Q$match[0]\E", $newPrefix
        $newPath = Join-Path $_.Directory.FullName $newName

        if ($newName -ne $name -and -not (Test-Path $newPath)) {
            if (-not $DryRun) {
                Rename-Item -Path $_.FullName -NewName $newName
            }
            "RENAME: '$name' → '$newName'" | Out-File $LogPath -Append
            $renamed++
        } else {
            "SKIPPED: '$name' → '$newName' (Already exists)" | Out-File $LogPath -Append
            $skipped++
        }
    }
}

"`n--- Summary: $renamed renamed, $skipped skipped ---" | Out-File $LogPath -Append
if ($DryRun) {
    "`nNOTE: Dry run mode ON. No files were renamed." | Out-File $LogPath -Append
}
<#
	Usage Examples:
	Dry run from current folder:

	powershell
	.\Fix-ScriptPrefixes.ps1 -DryRun
	Run from specific directory and save custom log:

	powershell
	.\Fix-ScriptPrefixes.ps1 -RootPath "D:\Repos\Archive" -LogFile "prefix_renames_2025-06-16.log"
#>