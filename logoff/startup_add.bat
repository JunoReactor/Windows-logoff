@echo off
set "programPath=%~dp0logoff-win.exe"
set "registryKey=HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run"

reg add "%registryKey%" /v "LogoffWin" /t REG_SZ /d "%programPath%" /f
