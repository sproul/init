echo installing visual studio 2005
net use s: \\plato\software nelsov,1 /user:na\nelsons /persistent:no
pause
xcopy /s /e /i \\plato\msdn\DEVELO~1\VISUAL~1\EN_VS_~1 c:\en_vs_2005_std_dvd
pause
c:\en_vs_2005_std_dvd\vs\autorun.exe
pause
c:\en_vs_2005_std_dvd\msdn\autorun.exe
echo snapshotting build
