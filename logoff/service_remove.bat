@echo off
set SERVICENAME=LogoffService

echo Остановка службы...
sc stop %SERVICENAME%

echo Удаление службы...
sc delete %SERVICENAME%

echo Служба удалена успешно.