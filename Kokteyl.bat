@echo off
call :Admin >NUL 2>&1
@setlocal DisableDelayedExpansion
chcp 1254
mode con: cols=55 lines=9
color a
SET liveincolor=0
SET "c_underline="
SET "c_reset="
SET "c_Red_Blak="
SET "c_Gre_Blak="
SET "c_Yel_Blak="
SET "c_Blu_Blak="
SET "c_Mag_Blak="
SET "c_Cya_Blak="
SET "c_Whi_Blak="
SET liveincolor=1
SET "c_underline=[4m"
SET "c_reset=[0m"
SET "c_Red_Blak=[91;40m"
SET "c_Gre_Blak=[92;40m"
SET "c_Yel_Blak=[93;40m"
SET "c_Blu_Blak=[94;40m"
SET "c_Mag_Blak=[95;40m"
SET "c_Cya_Blak=[96;40m"
SET "c_Whi_Blak=[97;40m"
title Kokteyl

:: -

:: Remove And Disable Widgets
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v TaskbarDa /t REG_DWORD /d 0 /f >NUL 2>&1
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Dsh" /v AllowNewsAndInterests /t REG_DWORD /d 0 /f >NUL 2>&1
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Feeds" /v EnableFeeds /t REG_DWORD /d 0 /f >NUL 2>&1
>nul powershell -noprofile -executionpolicy bypass -command "Get-AppxPackage -Name *WebExperience* | Foreach {Remove-AppxPackage $_.PackageFullName}"
>nul powershell -noprofile -executionpolicy bypass -command "Get-ProvisionedAppxPackage -Online | Where-Object { $_.PackageName -match 'WebExperience' } | ForEach-Object { Remove-ProvisionedAppxPackage -Online -PackageName $_.PackageName }"

:: -

:: Remove And Disable Chat
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v TaskbarMn /t REG_DWORD /d 0 /f >NUL 2>&1
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Chat" /v ChatIcon /t REG_DWORD /d 3 /f >NUL 2>&1

:: -

:: Remove And Disable Windows Security
reg add "HKLM\SOFTWARE\Microsoft\Windows Defender Security Center\Systray" /v HideSystray /t REG_DWORD /d 1 /f >NUL 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableAntiSpyware /t REG_DWORD /d 1 /f >NUL 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\UX Configuration" /v Notification_Suppress /t REG_DWORD /d 1 /f >NUL 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v DisableRealtimeMonitoring /t REG_DWORD /d 1 /f >NUL 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Schedule\Maintenance" /v MaintenanceDisabled /t REG_DWORD /d 1 /f >NUL 2>&1
reg delete HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /v WindowsDefender /f >NUL 2>&1
reg delete HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /v SecurityHealth /f >NUL 2>&1

set "_schtasks=SCHTASKS /Change /DISABLE /TN" >NUL 2>&1
set "_schedule=Microsoft\Windows" >NUL 2>&1
%_schtasks% "%_schedule%\Windows Defender\Windows Defender Cache Maintenance" >NUL 2>&1
%_schtasks% "%_schedule%\Windows Defender\Windows Defender Cleanup" >NUL 2>&1
%_schtasks% "%_schedule%\Windows Defender\Windows Defender Scheduled Scan" >NUL 2>&1
%_schtasks% "%_schedule%\Windows Defender\Windows Defender Verification" >NUL 2>&1
%_schtasks% "%_schedule%\PI\Secure-Boot-Update" >NUL 2>&1
%_schtasks% "%_schedule%\TPM\Tpm-HASCertRetr" >NUL 2>&1
%_schtasks% "%_schedule%\TPM\Tpm-Maintenance" >NUL 2>&1

net stop WinDefend /y >NUL 2>&1
sc stop WinDefend >NUL 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows Defender\Features" /v TamperProtection /t REG_DWORD /d 0 /f >NUL 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows Defender\Spynet" /v SpyNetReporting /t REG_DWORD /d 0 /f >NUL 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows Defender\Spynet" /v SubmitSamplesConsent /t REG_DWORD /d 2 /f >NUL 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows Defender Security Center\Notifications" /v DisableNotifications /t REG_DWORD /d 1 /f >NUL 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows Defender Security Center\Notifications" /v DisableEnhancedNotifications /t REG_DWORD /d 1 /f >NUL 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableAntiSpyware /t REG_DWORD /d 1 /f >NUL 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableAntiVirus /t REG_DWORD /d 1 /f >NUL 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Features" /v TamperProtection /t REG_DWORD /d 0 /f >NUL 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v DisableRealtimeMonitoring /t REG_DWORD /d 1 /f >NUL 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v DisableOnAccessProtection /t REG_DWORD /d 1 /f >NUL 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v DisableScanOnRealtimeEnable /t REG_DWORD /d 1 /f >NUL 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\SmartScreen" /v ConfigureAppInstallControlEnabled /t REG_DWORD /d 1 /f >NUL 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\SmartScreen" /v ConfigureAppInstallControl /t REG_SZ /d Anywhere /f >NUL 2>&1

"%ProgramFiles%\Windows Defender\MpCmdRun.exe" -DisableService >NUL 2>&1
regsvr32 /u /s "%ProgramFiles%\Windows Defender\shellext.dll" >NUL 2>&1

for %%G in (WinDefend) do (sc config %%G start= disabled) >NUL 2>&1

set "key=HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\InboxApplications" >NUL 2>&1
for %%i in (SecHealthUI) do (for /f %%a in ('reg query "%key%" /f %%i /k 2^>nul ^| find /i "AppxAllUserStore"') do if not errorlevel 1 (reg delete %%a /f 2>nul))

:: -

:: Uninstall Microsoft Edge Browser
taskkill /F /IM "MicrosoftEdgeUpdate.exe" >NUL 2>&1
taskkill /F /IM "MicrosoftEdgeUpdateCore.exe" >NUL 2>&1
taskkill /F /IM "MicrosoftEdgeUpdateOnDemand.exe" >NUL 2>&1
taskkill /F /IM "MicrosoftEdgeUpdateBroker.exe" >NUL 2>&1
taskkill /F /IM "msedge_pwa_launcher.exe" >NUL 2>&1
taskkill /F /IM "pwahelper.exe" >NUL 2>&1
taskkill /F /IM "msedgewebview2.exe" >NUL 2>&1
taskkill /F /IM "msedge.exe" >NUL 2>&1

set "u_path=%LocalAppData%\Microsoft"
set "s_path=%ProgramFiles(x86)%\Microsoft"
if /i %PROCESSOR_ARCHITECTURE%==x86 (if not defined PROCESSOR_ARCHITEW6432 (
  set "s_path=%ProgramFiles%\Microsoft"
  )
)

for /D %%i in ("%u_path%\Edge SxS\Application\*") do if exist "%%i\installer\setup.exe" (
start "" /w "%%i\installer\setup.exe" --uninstall --msedge-sxs --verbose-logging --force-uninstall --delete-profile
)
for /D %%i in ("%u_path%\Edge Internal\Application\*") do if exist "%%i\installer\setup.exe" (
start "" /w "%%i\installer\setup.exe" --uninstall --msedge-internal --verbose-logging --force-uninstall --delete-profile
)
for /D %%i in ("%u_path%\Edge Dev\Application\*") do if exist "%%i\installer\setup.exe" (
start "" /w "%%i\installer\setup.exe" --uninstall --msedge-dev --verbose-logging --force-uninstall --delete-profile
)
for /D %%i in ("%u_path%\Edge Beta\Application\*") do if exist "%%i\installer\setup.exe" (
start "" /w "%%i\installer\setup.exe" --uninstall --msedge-beta --verbose-logging --force-uninstall --delete-profile
)
for /D %%i in ("%u_path%\Edge\Application\*") do if exist "%%i\installer\setup.exe" (
start "" /w "%%i\installer\setup.exe" --uninstall --verbose-logging --force-uninstall --delete-profile
)
for /D %%i in ("%s_path%\Edge\Application\*") do if exist "%%i\installer\setup.exe" (
start "" /w "%%i\installer\setup.exe" --uninstall --system-level --verbose-logging --force-uninstall --delete-profile
)
for /D %%i in ("%s_path%\Edge Beta\Application\*") do if exist "%%i\installer\setup.exe" (
start "" /w "%%i\installer\setup.exe" --uninstall --msedge-beta --system-level --verbose-logging --force-uninstall --delete-profile
)
for /D %%i in ("%s_path%\Edge Dev\Application\*") do if exist "%%i\installer\setup.exe" (
start "" /w "%%i\installer\setup.exe" --uninstall --msedge-dev --system-level --verbose-logging --force-uninstall --delete-profile
)
for /D %%i in ("%s_path%\Edge Internal\Application\*") do if exist "%%i\installer\setup.exe" (
start "" /w "%%i\installer\setup.exe" --uninstall --msedge-internal --system-level --verbose-logging --force-uninstall --delete-profile
)

del /f /q "%AppData%\Microsoft\Internet Explorer\Quick Launch\Microsoft Edge*.lnk" >NUL 2>&1
del /f /q "%SystemRoot%\System32\config\systemprofile\AppData\Roaming\Microsoft\Internet Explorer\Quick Launch\Microsoft Edge*.lnk" >NUL 2>&1

:: -

:: Uninstall OneDrive
taskkill /im OneDriveSetup.exe >Nul 2>&1
tskill /a OneDriveSetup >Nul 2>&1
Reg Delete "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "OneDriveSetup" /f >Nul 2>&1

:: -

:: UnRegister Apps
set key=HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\InboxApplications
FOR %%i IN (
SecHealthUI
Cortana
Microsoft.549981C3F5F10
WindowsFeedbackHub
GetHelp
Getstarted
MicrosoftEdge
MicrosoftEdgeDevToolsClient
MicrosoftEdge.Stable
MicrosoftTeams
BingNews
BingWeather
ZuneMusic
ZuneVideo
Print3D
3DBuilder
Microsoft3DViewer
MicrosoftOfficeHub
Office.OneNote
OneConnect
OneDriveSync
People
PeopleExperienceHost
Windows.ParentalControls
SkypeApp
SpotifyMusic
SpotifyAB.SpotifyMusic
AmazonVideo.PrimeVideo
MicrosoftSolitareCollection
MicrosoftStickyNotes
Todos
YourPhone
PowerAutomateDesktop
MixedReality.Portal
Windows.MSPaint
Windows.Paint
Windows.ScreenSketch
WindowsNotepad
Windows.Photos
WindowsAlarms
WindowsCalculator
WindowsCamera
WindowsMaps
WindowsSoundRecorder
Messaging
Wallet
) DO (FOR /F %%a IN ('reg query "%key%" /f %%i /k 2^>nul ^| find /i "InboxApplications"') DO IF NOT ERRORLEVEL 1 (reg delete %%a /f 2>nul))

:: -

:: Google Chrome
taskkill /f /im software_reporter_tool.exe >NUL 2>&1
icacls "%localappdata%\Google\Software Reporter Tool" /inheritance:e >NUL 2>&1
icacls "%localappdata%\Google\Chrome\User Data\SwReporter" /inheritance:e >NUL 2>&1
@RD /S /Q "%localappdata%\Google\Software Reporter Tool\*" >NUL 2>&1
del /f /q "%localappdata%\Google\Software Reporter Tool\*" >NUL 2>&1
@RD /S /Q "%localappdata%\Google\Chrome\User Data\SwReporter\*" >NUL 2>&1
del /f /q "%localappdata%\Google\Chrome\User Data\SwReporter\*" >NUL 2>&1
mkdir "%localappdata%\Google\Software Reporter Tool" >NUL 2>&1
mkdir "%localappdata%\Google\Chrome\User Data\SwReporter" >NUL 2>&1
icacls "%localappdata%\Google\Software Reporter Tool" /inheritance:r >NUL 2>&1
icacls "%localappdata%\Google\Chrome\User Data\SwReporter" /inheritance:r >NUL 2>&1

:: -

exit

:: -

:Admin
reg query "HKU\S-1-5-19\Environment" ||  (
    cls
    powershell.exe -windowstyle hidden -noprofile "Start-Process '%~dpnx0' -Verb RunAs"
    exit
)
exit /B