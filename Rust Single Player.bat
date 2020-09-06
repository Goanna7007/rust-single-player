@ECHO OFF
ECHO Welcome to Rust single-player mode!
IF NOT EXIST "steamcmd\steamapps\common\rust_dedicated\RustDedicated.exe" goto setup
:start
steamcmd\steamcmd.exe +login anonymous +app_update 258550 +quit
cd steamcmd\steamapps\common\rust_dedicated
DEL server\275477\Log.EAC.txt
start "RustSinglePlayerServer" cmd /c RustDedicated.exe -batchmode +server.hostname "Rust Single Player" +server.port 28015 +server.maxplayers 8 +server.identity "275477" +halloween.enabled +halloween.murdererpopulation 5 +halloween.scarecrowpopulation 3 +ai.npc_junkpile_a_spawn_chance 0.9 +ai.npc_junkpile_g_spawn_chance 0.9
powershell "$s=(New-Object -COM WScript.Shell).CreateShortcut('Rust.url');$s.TargetPath='steam://rungameid/252490';$s.Save()"
Rust.url
ECHO waiting for RustSinglePlayerServer to load...
:waitForLoad
IF NOT EXIST "server\275477\Log.EAC.txt" goto waitForLoad
Rust.url
powershell "Sleep 3;$wshell = New-Object -ComObject wscript.shell;$wshell.AppActivate('Rust');$wshell.AppActivate('Rust');$wshell.AppActivate('Rust');$wshell.AppActivate('Rust');$wshell.AppActivate('Rust');Sleep 3;$wshell.AppActivate('Rust');$wshell.SendKeys('{F1}');Sleep 1;$wshell.SendKeys('client.connect localhost:28015');Sleep 1;$wshell.SendKeys('{ENTER}');Sleep 10;$wshell.SendKeys('{F1}');"
exit
:setup
ECHO Doing first time setup
powershell "$s=(New-Object -COM WScript.Shell).CreateShortcut('%userprofile%\Desktop\%~n0.lnk');$s.TargetPath='%~f0';$s.Save()"
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://steamcdn-a.akamaihd.net/client/installer/steamcmd.zip', 'steamcmd.zip')"
powershell -Command "Expand-Archive -Force steamcmd.zip"
DEL steamcmd.zip
goto start