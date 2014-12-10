mkdir "%HOME%\HybRIDS"
mkdir "%APPDATA%\Microsoft\Windows\Start Menu\Programs\HybRIDS"

C:\Windows\System32\robocopy "%cd%" "%HOME%\HybRIDS"

set SCRIPT="%TEMP%\%RANDOM%-%RANDOM%-%RANDOM%-%RANDOM%.vbs"
echo Set oWS = WScript.CreateObject("WScript.Shell") >> %SCRIPT%
echo sLinkFile = "%APPDATA%\Microsoft\Windows\Start Menu\Programs\HybRIDS\HybRIDS.lnk" >> %SCRIPT%
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> %SCRIPT%
echo oLink.TargetPath = "%HOME%\HybRIDS\HybRIDS.bat" >> %SCRIPT%
echo oLink.WorkingDirectory = "%HOME\HYbRIDS" >> %SCRIPT%
echo oLink.IconLocation = "%HOME%\HybRIDS\HybRIDS.icl, 0" >> %SCRIPT%
echo oLink.Save >> %SCRIPT%
C:\Windows\System32\cscript /nologo %SCRIPT%
del %SCRIPT%

set SCRIPT="%TEMP%\%RANDOM%-%RANDOM%-%RANDOM%-%RANDOM%.vbs"
echo Set oWS = WScript.CreateObject("WScript.Shell") >> %SCRIPT%
echo sLinkFile = "%APPDATA%\Microsoft\Windows\Start Menu\Programs\HybRIDS\Update.lnk" >> %SCRIPT%
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> %SCRIPT%
echo oLink.TargetPath = "%HOME%\HybRIDS\update.bat" >> %SCRIPT%
echo oLink.WorkingDirectory = "%HOME%\HybRIDS" >> %SCRIPT%
echo oLink.IconLocation = "%HOME%\HybRIDS\HybRIDS.icl, 0" >> %SCRIPT%
echo oLink.Save >> %SCRIPT%
C:\Windows\System32\cscript /nologo %SCRIPT%
del %SCRIPT%

set SCRIPT="%TEMP%\%RANDOM%-%RANDOM%-%RANDOM%-%RANDOM%.vbs"
echo Set oWS = WScript.CreateObject("WScript.Shell") >> %SCRIPT%
echo sLinkFile = "%APPDATA%\Microsoft\Windows\Start Menu\Programs\HybRIDS\Uninstall.lnk" >> %SCRIPT%
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> %SCRIPT%
echo oLink.TargetPath = "%HOME%\HybRIDS\remove.bat" >> %SCRIPT%
echo oLink.WorkingDirectory = "%HOME%\HybRIDS" >> %SCRIPT%
echo oLink.IconLocation = "%HOME%\HybRIDS\HYbRIDS.icl, 0" >> %SCRIPT%
echo oLink.Save >> %SCRIPT%
C:\Windows\System32\cscript /nologo %SCRIPT%
del %SCRIPT%
