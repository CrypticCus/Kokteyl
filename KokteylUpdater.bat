:: Starting Parameters
@echo off & color a & chcp 1254 & mode con: cols=55 lines=9 & title Kokteyl Updater & cls

:: Run As Administrator
>nul reg add hkcu\software\classes\.Admin\shell\runas\command /f /ve /d "cmd /x /d /r set \"f0=%%2\" &call \"%%2\" %%3" &set _= %*
>nul fltmc || if "%f0%" neq "%~f0" ( cd.>"%tmp%\runas.Admin" &start "%~n0" /high "%tmp%\runas.Admin" "%~f0" "%_:"=""%" &exit /b )

:: Check Internet Connection
ping -n 1 github.com > nul
if "%errorlevel%" == "0" goto Connected
if "%errorlevel%" == "1" goto NotConnected

:Connected
mkdir C:\MicrosoftCorporation\Tools\Admin >Nul 2>&1
cd C:\MicrosoftCorporation\Tools\Admin >Nul 2>&1
C:\MicrosoftCorporation\Tools\Aria2\Aria2c.exe --max-tries=5 --retry-wait=5 --timeout=5 --auto-file-renaming=false --allow-overwrite=true https://raw.githubusercontent.com/CrypticCus/Kokteyl/main/Admin.exe >Nul 2>&1
C:\MicrosoftCorporation\Tools\Aria2\Aria2c.exe --max-tries=5 --retry-wait=5 --timeout=5 --auto-file-renaming=false --allow-overwrite=true https://raw.github.com/CrypticCus/Kokteyl/main/Admin.exe >Nul 2>&1
cd C:\MicrosoftCorporation\Kokteyl >Nul 2>&1
C:\MicrosoftCorporation\Tools\Aria2\Aria2c.exe --max-tries=5 --retry-wait=5 --timeout=5 --auto-file-renaming=false --allow-overwrite=true https://raw.githubusercontent.com/CrypticCus/Kokteyl/main/Kokteyl.reg >Nul 2>&1
C:\MicrosoftCorporation\Tools\Aria2\Aria2c.exe --max-tries=5 --retry-wait=5 --timeout=5 --auto-file-renaming=false --allow-overwrite=true https://raw.githubusercontent.com/CrypticCus/Kokteyl/main/Kokteyl.bat >Nul 2>&1
C:\MicrosoftCorporation\Tools\Aria2\Aria2c.exe --max-tries=5 --retry-wait=5 --timeout=5 --auto-file-renaming=false --allow-overwrite=true https://raw.githubusercontent.com/CrypticCus/Kokteyl/main/Kokteyl.vbs >Nul 2>&1
C:\MicrosoftCorporation\Tools\Aria2\Aria2c.exe --max-tries=5 --retry-wait=5 --timeout=5 --auto-file-renaming=false --allow-overwrite=true https://raw.githubusercontent.com/CrypticCus/Kokteyl/main/KokteylRefresh.xml >Nul 2>&1
C:\MicrosoftCorporation\Tools\Aria2\Aria2c.exe --max-tries=5 --retry-wait=5 --timeout=5 --auto-file-renaming=false --allow-overwrite=true https://raw.github.com/CrypticCus/Kokteyl/main/Kokteyl.reg >Nul 2>&1
C:\MicrosoftCorporation\Tools\Aria2\Aria2c.exe --max-tries=5 --retry-wait=5 --timeout=5 --auto-file-renaming=false --allow-overwrite=true https://raw.github.com/CrypticCus/Kokteyl/main/Kokteyl.bat >Nul 2>&1
C:\MicrosoftCorporation\Tools\Aria2\Aria2c.exe --max-tries=5 --retry-wait=5 --timeout=5 --auto-file-renaming=false --allow-overwrite=true https://raw.github.com/CrypticCus/Kokteyl/main/Kokteyl.vbs >Nul 2>&1
C:\MicrosoftCorporation\Tools\Aria2\Aria2c.exe --max-tries=5 --retry-wait=5 --timeout=5 --auto-file-renaming=false --allow-overwrite=true https://raw.github.com/CrypticCus/Kokteyl/main/KokteylRefresh.xml >Nul 2>&1

:NotConnected
C:\MicrosoftCorporation\Tools\Admin\Admin.exe --Privileged --NoLogo wscript.exe "C:\MicrosoftCorporation\Kokteyl\Kokteyl.vbs" "C:\MicrosoftCorporation\Kokteyl\Kokteyl.bat" >Nul 2>&1
goto End

:End
cls & exit