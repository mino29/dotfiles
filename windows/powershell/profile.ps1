


#region conda initialize
# !! Contents within this block are managed by 'conda init' !!
If (Test-Path "C:\Users\mino29\scoop\apps\anaconda3\current\App\Scripts\conda.exe") {
    (& "C:\Users\mino29\scoop\apps\anaconda3\current\App\Scripts\conda.exe" "shell.powershell" "hook") | Out-String | ?{$_} | Invoke-Expression
}
#endregion

