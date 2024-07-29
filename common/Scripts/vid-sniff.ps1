param (
    [string]$targetDirectory
)

# Move files larger than 1KB to the target directory
Get-ChildItem -File -Recurse $targetDirectory |
    Where-Object { $_.Length -gt 0 } |
    Move-Item -Destination $targetDirectory -Force

# Remove empty directories
Get-ChildItem -Directory -Recurse $targetDirectory |
    Remove-Item -Recurse -Force
