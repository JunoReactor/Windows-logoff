@echo off
set SERVICENAME=LogoffService
set SERVICEDESC=Logoff Service
set SERVICEBINPATH=%~dp0logoff-win.exe

echo Установка службы...
echo Введите пароль для пользователя %USERNAME%:
runas /user:%COMPUTERNAME%\%USERNAME% "sc create %SERVICENAME% binPath= \"%SERVICEBINPATH%\" start= auto obj= \"%COMPUTERNAME%\%USERNAME%\" password= *"
sc start %SERVICENAME%

echo Настройка службы...
sc description %SERVICENAME% "%SERVICEDESC%"
sc config %SERVICENAME% obj= "%COMPUTERNAME%\%USERNAME%" password= ""
sc failure %SERVICENAME% reset= 0 actions= restart/60000/restart/60000/restart/60000
sc qc %SERVICENAME%

echo Служба установлена успешно.
