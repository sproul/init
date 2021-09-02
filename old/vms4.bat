net use s: \\plato\software nelsov,1 /user:na\nelsons /persistent:no
pause
set IE=c:\PROGRA~1\INTERN~1\iexplore.exe
dir 
dir \\socrates\build\thirdparty\jdk
md c:\jdk
echo 'which 1.5 are we using, release 6?'
pause
echo installing sun-1.5.0_06/win32 c:\jdk
xcopy /i /s /e \\socrates\build\thirdparty\jdk\sun-1.5.0_06\win32 c:\jdk
echo add c:\jdk\bin to PATH, set JAVA_HOME
pause
echo installing tomcat-5.5.17.exe
\\plato\Software\Tomcat\5.5.17\apache-tomcat-5.5.17.exe
pause
echo installing firefox+venkman
%IE%  http://www.mozilla.com/firefox/
echo get venkman too
pause
echo installing fiddler
\\plato\Software\fiddler\FiddlerSetup.exe /S
pause
rem dir e:
rem pause
rem e:\setup
rem pause
echo installing BEA/workshop
\\plato\Software\BEA\workshop\3.2.0\WorkshopInstaller.exe
pause
echo snapshotting dev
