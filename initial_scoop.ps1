# Install everything you need for scoop








# This make sure you run as Administrator
if (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))
{
  $arguments = "& '" +$myinvocation.mycommand.definition + "'"
  Start-Process powershell -Verb runAs -ArgumentList $arguments
  Break
}

# Make sure this can install PS modules
Set-ExecutionPolicy RemoteSigned
#Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process

# Command to create a PowerShell profile
New-Item -path $profile -type file -force

# Install windows terminal preview
winget install microsoft.windowsterminal.preview
winget uninstall microsoft.windowsterminal

# 执行安装命令 (admin)
iex "& {$(iwr -useb scoop.201704.xyz)} -RunAsAdmin"

# 执行安装命令 (non admin)
# iwr -useb scoop.201704.xyz | iex
# iwr -useb https://raw.githubusercontent.com/ScoopInstaller/Install/master/install.ps1 | iex

# 更换scoop的repo地址

# official repo
scoop config SCOOP_REPO 'https://github.com/ScoopInstaller/Scoop'

# backup repos
# scoop config SCOOP_REPO 'https://github.com/Ash258/Scoop-Core'

# 拉取新库地址
scoop update

# must-have apps
scoop install git aria2 dark

# aria2
scoop config aria2--enabled true
scoop config aria2-warning-enabled false

# must-have buckets
scoop bucket add main
scoop bucket add apps "https://github.com/kkzzhizhou/scoop-apps"
scoop bucket add im-select "https://github.com/daipeihust/im-select"

<#
scoop bucket add extras
scoop bucket add versions
scoop bucket add nightlies
scoop bucket add nirsoft
scoop bucket add php
scoop bucket add nerd-fonts
scoop bucket add nonportable
scoop bucket add java
scoop bucket add games
scoop bucket add jetbrains

scoop bucket add scoopet "https://github.com/ivaquero/scoopet.git"
scoop bucket add portablesoft 'https://github.com/shenbo/portablesoft'
#>

# improve scoop usability
scoop install scoop-search scoop-completion komorebi hack-nf
# install preloaded list
# scoop import importable_packages.json
