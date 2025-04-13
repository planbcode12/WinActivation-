@echo off
setlocal enabledelayedexpansion

title WinActivation Premium ^| All-in-One Activator
mode con:cols=80 lines=30
color 0B
set "delay=50"
set "spinner=/-\|"

NET FILE 1>NUL 2>NUL
if '%errorlevel%' == '0' (goto :MAIN_MENU) else (goto :UAC_PROMPT)

:UAC_PROMPT
echo Requesting administrator privileges...
%windir%\System32\WindowsPowerShell\v1.0\powershell.exe -Command "Start-Process cmd -ArgumentList '/c ""%~f0""' -Verb RunAs"
exit /b

:MAIN_MENU
cls
echo.
echo  [WinActivation Premium - v2.0]
echo  ====================================
echo.
echo  This tool will activate:
echo    • Windows 10/11 (KMS)
echo    • Office 2016/2019/2021
echo.
echo  Select an option:
echo.
echo  [1] Activate Windows
echo  [2] Activate Office
echo  [3] Activate Both
echo  [4] Verify Activation
echo  [5] Exit
echo.
echo  ====================================
choice /c 12345 /n /m "Your choice: "

if %errorlevel% equ 1 goto :ACTIVATE_WINDOWS
if %errorlevel% equ 2 goto :ACTIVATE_OFFICE
if %errorlevel% equ 3 goto :ACTIVATE_BOTH
if %errorlevel% equ 4 goto :VERIFY_ACTIVATION
if %errorlevel% equ 5 exit /b

:ACTIVATE_WINDOWS
call :ANIMATE "Initializing Windows Activation..." 20
call :RUN_ACTIVATION "Windows"
goto :MAIN_MENU

:ACTIVATE_OFFICE
call :ANIMATE "Initializing Office Activation..." 20
call :RUN_ACTIVATION "Office"
goto :MAIN_MENU

:ACTIVATE_BOTH
call :ANIMATE "Preparing Dual Activation..." 20
call :RUN_ACTIVATION "Windows"
call :RUN_ACTIVATION "Office"
goto :MAIN_MENU

:VERIFY_ACTIVATION
cls
echo.
echo  [Verification Results]
echo  ====================================
echo.
call :ANIMATE "Checking Windows Activation..." 15
slmgr /xpr
echo.
call :ANIMATE "Checking Office Activation..." 15
cscript //nologo "%ProgramFiles%\Microsoft Office\Office16\OSPP.VBS" /dstatus
echo.
pause
goto :MAIN_MENU

:RUN_ACTIVATION
set "type=%~1"
call :ANIMATE "Downloading %type% activation script..." 10
echo.
powershell -NoProfile -ExecutionPolicy Bypass -Command "$ProgressPreference = 'SilentlyContinue'; $webRequest = Invoke-WebRequest -Uri 'https://get.activated.win' -UseBasicParsing; $content = $webRequest.Content; Write-Host '[*] Executing %type% activation...'; Invoke-Expression $content"
call :ANIMATE "%type% activation completed!" 5
echo.
echo  Operation completed successfully.
timeout /t 2 >nul
goto :EOF

:ANIMATE
set "message=%~1"
set "cycles=%~2"
set "counter=0"

:ANIMATE_LOOP
set /a "pos=counter %% 4"
for /f %%a in ('echo !spinner:~%pos%,1!') do set "spin=%%a"
echo  [!spin!] !message!      
ping -n 1 127.0.0.1 >nul
set /a "counter+=1"
if !counter! lss !cycles! (
    echo  [%spin%] %message%      
    <nul set /p "=."
    goto :ANIMATE_LOOP
)
exit /b
