# Window-Terminal-preview
New-Item -Path "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminalPreview_8wekyb3d8bbwe\LocalState\settings.json" -ItemType SymbolicLink -Target "$env:USERPROFILE\.dotfiles\windows\windows-terminal\settings.json" -Force
Write-host "windows terminal settings has been linked to .dotfiles\windows\windows-terminal\settings.json"
