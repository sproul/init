net use s: \\plato\software nelsov,1 /user:na\nelsons /persistent:no
pause
echo installing sysinternals
xcopy /s /e /i \\plato\software\sysinternals c:\util
pause
rem decided this is really most useful as a client; since englab images already have vnc installed+running, skip it
echo installing UltraVNC client
rem \\plato\Software\VNC\UltraVNC-102-Setup.exe
rem pause
