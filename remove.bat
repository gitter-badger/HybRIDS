RD /S /Q "%HOME%\HybRIDS"
RD /S /Q "%APPDATA%\Microsoft\Windows\Start Menu\Programs\HybRIDS
set SCRIPT="%TEMP%\%RANDOM%-%RANDOM%-%RANDOM%-%RANDOM%.vbs"
echo MsgBox "Uninstalled Windows HybRIDS Launcher." >> %SCRIPT%
C:\Windows\System32\cscript /nologo %SCRIPT%
del %SCRIPT%