@echo off

title CMD-Alias Setup
setlocal EnableDelayedExpansion

:: 0. Check admin rights
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] Please run as administrator!
    pause & exit /b 1
)

:: 1. Copy init.cmd to C:\Users\Public
echo [1/3] Copy init.cmd ...
copy /y "%~dp0init.cmd" "C:\Users\Public\init.cmd" >nul
if errorlevel 1 (
    echo [ERROR] Failed to copy init.cmd
    pause & exit /b 1
)

:: 2. Copy alias.cmd to %USERPROFILE%
echo [2/3] Copy alias.cmd ...
copy /y "%~dp0alias.cmd" "%USERPROFILE%\alias.cmd" >nul
if errorlevel 1 (
    echo [ERROR] Failed to copy alias.cmd
    pause & exit /b 1
)

:: 3. Import registry
echo [3/3] Writing AutoRun registry ...
reg import "%~dp0fix_autorun.reg" >nul 2>&1
if errorlevel 1 (
    echo [ERROR] Failed to import registry
    pause & exit /b 1
)

echo.
echo ===== Setup Complete =====
echo Open a new cmd window to use aliases.
pause
