# Read paths from a .txt file
$paths = Get-Content -Path "paths_D.txt"

# Create each directory
foreach ($path in $paths) {
    New-Item -ItemType Directory -Path $path -Force
}
# You can run the script by opening PowerShell and navigating to the directory where the script is saved. Then, execute the script by typing: .\!-path-to-folders-D.ps1