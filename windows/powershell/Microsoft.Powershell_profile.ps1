
# ---------------------------    minimal prompt    ----------------------------

# custom prompt

 # function prompt {
    # $currentFolder = (Get-Location).Path | Split-Path -Leaf
    # $homeDirectory = [Environment]::GetFolderPath("UserProfile") | Split-Path -Leaf
#
    # if ($currentFolder -eq $homeDirectory) {
        # " ~ "
    # }
    # else {
        # " $currentFolder "
    # }
 # }

# ----------------------------    starship    ---------------------------------

# starship ($HOME\.config\starship.toml)
Invoke-Expression (&starship init powershell)

# ----------------------------    terminal icons    ---------------------------------
Import-Module Terminal-Icons

# ----------------------------    scoop    ------------------------------------

Invoke-Expression (&scoop-search-multisource --hook)

# -----------------------------------------------------------------------------
# Aliases

# neovim -> vim
Set-Alias -Name v -Value nvim
Set-Alias -Name vi -Value nvim
Set-Alias -Name vim -Value nvim

# python
Set-Alias -Name py -Value python

# fastfetch
Set-Alias -Name ne -Value fastfetch
Set-Alias -Name neofetch -Value fastfetch

# notepad
Set-Alias -Name notepad -Value notepad++


# ----------------------------    zoxide    -----------------------------------
# zoxide
Invoke-Expression (& { (zoxide init powershell | Out-String) })

# ----------------------------    ls-interactive    ---------------------------

# scoop install ls-interactive

# -------------------------------    fzf    -----------------------------------
#
# fzf fuzzy finder
Import-Module PSFzf
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' -PSReadlineChordReverseHistory 'Ctrl+r'
#$env:export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
#$env: export FZF_DEFAULT_OPTS="--layout=reverse --inline-info --ansi --bind ctrl-a:select-all,ctrl-d:deselect-all,ctrl-t:toggle"


# Override default tab completion
#Set-PSReadLineKeyHandler -Key Tab -ScriptBlock { Invoke-FzfTabCompletion }

#$env:FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'

# ----------------------------    sqlite3    ----------------------------------

function Start-SQLite3 {
    param (
        [string]$DatabasePath
    )

    & "$ENV:USERPROFILE\.config\.sqlite3\wrapper.ps1" $DatabasePath
}

# sqlite3 table with headers
Set-Alias -Name sqlite3 -Value start-sqlite3
Set-Alias -Name sqlite -Value start-sqlite3

# ----------------------------    phpmyadmin    ----------------------------------

function phpmyadmin {
    param(
        [string]$action
    )

    if ($action -eq "start") {
        # Run the start-php-server.ps1 script
        & "$ENV:USERPROFILE\.config\.phpmyadmin\start-php-server.ps1"
    } elseif ($action -eq "stop") {
        # Run the stop-php-server.ps1 script
        & "$ENV:USERPROFILE\.config\.phpmyadmin\stop-php-server.ps1"
    } else {
        Write-Host "Invalid action. Please use 'start' or 'stop'."
    }
}

# ------------------------    custom functions    -----------------------------
# explorer
# 打开当前工作目录
function OpenCurrentFolder {
    param
    (
        # 输入要打开的路径
        # 用法示例：open C:\
        # 默认路径：当前工作文件夹
        $Path = '.'
    )
    $wins = New-Object -ComObject  Shell.Application
    $wins.MinimizeAll()
    Invoke-Item $Path
}
Set-Alias -Name open -Value OpenCurrentFolder

# potplayer
function potplayer {
    param
    (
        # 输入要打开的路径
        # 用法示例：potplayer C:\
        # 默认路径：当前工作文件夹
        $Path = (Get-Location).Path
    )
    # Minimize all windows
    $wins = New-Object -ComObject  Shell.Application
    $wins.MinimizeAll()
    # Open video files using potplayer
    & "$HOME\scoop\apps\potplayer\current\PotPlayer64.exe" $Path
}
Set-Alias -Name pot -Value potplayer
Set-Alias -Name play -Value potplayer

# jpegview
function jpegview {
    param
    (
        # 输入要打开的路径
        # 用法示例：jpegview C:\
        # 默认路径：当前工作文件夹
        $Path = (Get-Location).Path
    )
    $wins = New-Object -ComObject  Shell.Application
    $wins.MinimizeAll()
    & "$HOME\scoop\apps\jpegview\current\JPEGView.exe" $Path
}
Set-Alias -Name feh -Value jpegview

function rmrf {
     <#
        .DESCRIPTION
        Deletes the specified file or directory.
        .PARAMETER target
        Target file or directory to be deleted.
        .NOTES
        This is an equivalent command of "rm -rf" in Unix-like systems.
        #>
    Param(
        [Parameter(Mandatory=$true)]
        [string]$Target
    )
    Remove-Item -Recurse -Force $Target
}

# advancedrenamer
function rename {
    param
    (
        # 输入要打开的路径
        # 用法示例：rename C:\
        # 默认路径：当前工作文件夹
        $Path = (Get-Location).Path
    )
    $wins = New-Object -ComObject  Shell.Application
    $wins.MinimizeAll()
    & "$HOME\scoop\apps\advancedrenamer\current\ARen.exe" $Path
}
Set-Alias -Name rn -Value rename

# sumatrapdf
# Get-ChildItem "$PROFILE\..\Completions\" | ForEach-Object {
#     . $_.FullName
# }
