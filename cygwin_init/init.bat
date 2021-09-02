downloads\drop.url
rem src_cygwin=%~dp0
src_cygwin=\\%1\c$\cygwin
echo copying cygwin from %src_cygwin%...
xcopy /s /e /h /i %src_cygwin% c:\cygwin
echo the following will fail if drop sync has not completed...
cmd /k c:\cygwin\bin\bash c:\users\nelsons\Dropbox\i
