. custom-modules\SymbolicLinkFunctions.ps1

# ----------------------------------- cmd -----------------------------------
# sqlite
Set-SymbolicLink -sourceFile "$env:USERPROFILE\.dotfiles\windows\.sqlite3" -targetFile "$env:USERPROFILE\.config\.sqlite3"

