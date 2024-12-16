@echo off

set "pythonVersion=3.10.11"
echo python version %pythonVersion%

set "currentPath=%cd%"
echo current path : %cd%

set "pythonInstallDir=%currentPath%\Python%pythonVersion%"
echo python installation directory %pythonInstallDir%

echo Telechargement Python Installer...
curl "https://www.python.org/ftp/python/%pythonVersion%/python-%pythonVersion%-amd64.exe" -o python-installer.exe

echo Installation python...
python-installer.exe /quiet InstallAllUsers=1 PrependPath=1 TargetDir=%pythonInstallDir%

echo Creation repertoire pour les webdrivers...
md webdriver

pause
