@echo off
title CMD-Alias Safe Setup
reg delete "HKCU\Software\Microsoft\Command Processor" /v AutoRun /f >nul 2>&1
timeout /t 1 /nobreak >nul
setup.cmd
