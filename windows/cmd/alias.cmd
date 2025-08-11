@echo off

:: After each edit, save this file and enter "cmd",
:: to reload cmd.exe for these configs to be effective


DOSKEY alias=nvim "%USERPROFILE%\alias.cmd"
DOSKEY theme=nvim "%USERPROFILE%\scoop\apps\clink\current\oh-my-posh.lua"


:: At startup, cd to this path as default
:: set PATH=%PATH%;"C:\Program Files\Sublime Text 2\"

:: Add to path by command

:: DOSKEY add_python26=set PATH=%PATH%;"C:\Python26\"
:: DOSKEY add_python33=set PATH=%PATH%;"C:\Python33\"

:: Commands
:: These aliases behave more like my powershell configurations


:: attempts to make cmd act more bash/zsh/powershell like

DOSKEY pwd=cd
DOSKEY rm=del $*
:: DOSKEY mv=rename $*
DOSKEY mv=move $*
DOSKEY cp=copy $*

:: DOSKEY ll=dir
:: DOSKEY ls=dir /B
DOSKEY ll=lsd -la
DOSKEY ls=lsd -a
DOSKEY clear=cls
DOSKEY cc=cls
DOSKEY cs=cowsay $*
DOSKEY ne=fastfetch
DOSKEY neofetch=fastfetch
DOSKEY open=explorer
DOSKEY :q=exit


:: These are for my lazy ass

DOSKEY v=nvim $*
DOSKEY vi=nvim $*
DOSKEY vim=nvim $*

DOSKEY py=python $*

:: Common directories

DOSKEY cd~=cd "%USERPROFILE%\$*"
DOSKEY ~=cd "%USERPROFILE%\"
DOSKEY ~="%USERPROFILE%\"
:: DOSKEY dropbox=cd "%USERPROFILE%\Dropbox\$*"


:: autojump related
:: set PATH=%PATH%;%USERPROFILE%\AppData\Local\autojump\bin
:: DOSKEY cd=cd $*$Tautojump -i $Gnul

:: z.lua related
set PATH=%PATH%;%USERPROFILE%\scoop\apps\clink\current

:: fastreload
DOSKEY reload=cmd

:: the correct path of this file
:: C:\Users\Public\alias.cmd
:: %USERPROFILE%\alias.cmd
:: inspiration from stackoverflow-->
:: https://stackoverflow.com/questions/20530996/aliases-in-windows-command-prompt

