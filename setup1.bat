@echo on
if exist c:\downloads\c goto local_c

if not exist c:\downloads md c:\downloads

xcopy \\@@SRC_HOST@@\downloads\c c:\downloads\c /s /e /h /y /z /i

:local_c
c:
cd c:\downloads\c

call setup__host.bat

echo hi > c:\Verify_privileges_elevated
if exist  c:\Verify_privileges_elevated goto disable_UAC else goto the_end

:disable_UAC
del       c:\Verify_privileges_elevated
reg.exe ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v EnableLUA /t REG_DWORD /D "0" /f
call reboot_and_run c:\downloads\c\setup2.bat

:the_end
pause
