cd /d c:\downloads\c
call setup__host.bat

rem netsh firewall set opmode disable
netsh advfirewall firewall set rule group="remote desktop" new enable=Yes

@powershell -NoProfile -ExecutionPolicy unrestricted -Command "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))"
PATH c:\cygwin\bin;%PATH%;%systemdrive%\ProgramData\chocolatey\bin
choco feature enable -n allowGlobalConfirmation
if exist c:\Windows.old\Users\nelsons\@@DP_DOS@@ move  c:\Windows.old\Users\nelsons\@@DP_DOS@@  c:\Users\nelsons\@@DP_DOS@@
if not exist c:\cygwin start setup2__cp.bat

if @@DP_DOS@@==dp call cinst dropbox
if @@DP_DOS@@==dp call cinst spotify

echo ========================================================================================================================================
echo start full sync to drop now, but do not wait for that to finish, hit enter once it is started...
echo ========================================================================================================================================
pause
date /t
md c:\downloads

date /t
call cinst firefox
call cinst GoogleChrome
call cinst ultravnc
call cinst classic-shell
echo if we are happy w/ the new v4 class shell, then we could rm c:\Users\nelsons\@@DP_DOS@@\init\downloads\win\w2k7.ClassicShellSetup_3_3_0.exe
rem call cinst PowerShell
rem call cinst thunderbird
rem
rem we need v7 for Windows 10 compatibility -- I acquired it from http://www.straightrunning.com/candidate/PLEASE-READ, put it in $dp/init/downloads/win/xming.rel_x64_Xming-7-7-0-10-setup.exe
rem call cinst xming
rem 
call cinst adobereader
call cinst OpenOffice
call cinst PowerShell
call cinst 7zip
call cinst python

call cinst jdk7
echo setup2: where did jdk7 get installed
echo setup2: where did jdk7 get installed
echo setup2: where did jdk7 get installed


cd /d c:\Users\nelsons
if exist @@DP_DOS@@ goto after_dp

if @@DP_DOS@@==dp xcopy \\@@SRC_HOST@@\C$\Users\nelsons\dp c:\Users\nelsons\@@DP_DOS@@ /s /e /h /y /z /i /c
if exist \\@@SRC_HOST@@\C$\Java xcopy \\@@SRC_HOST@@\C$\Java c:\Java /s /e /h /y /z /i /c
if exist \\@@SRC_HOST@@\C$\scratch xcopy \\@@SRC_HOST@@\C$\scratch c:\Java /s /e /h /y /z /i /c
if exist \\@@SRC_HOST@@\C$\Users\aime        xcopy \\@@SRC_HOST@@\C$\Users\aime        c:\Users\aime        /s /e /h /y /z /i /c
if exist \\@@SRC_HOST@@\C$\Users\aime.ORADEV xcopy \\@@SRC_HOST@@\C$\Users\aime.ORADEV c:\Users\aime.ORADEV /s /e /h /y /z /i /c


:after_dp
echo ========================================================================================================================================
echo once cygwin is in place, hit enter...
echo ========================================================================================================================================
rem /cygdrive/c/downloads/c/setup3_windows.sh
copy c:\Users\nelsons\@@DP_DOS@@\bin\i.bat
bash -c ./i

rem restore uac -- or not:
rem reg.exe ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v EnableLUA /t REG_DWORD /defined "1" /f
rem netsh firewall set opmode enable
pause
