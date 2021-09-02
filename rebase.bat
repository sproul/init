c:\cygwin\bin\ash -c rebaseall

rem another possibliity:
rem 
rem Microsoft Security Essentials was set to default which 
rem allows it to real time scan all files/directories/real-time processes.  If you 
rem are also running this, I guarantee it is your problem (or at least one of 
rem them).
rem 
rem To resolve, open Security Essentials and navigate to the settings tab.  Under 
rem the "Excluded files & locations" menu, add the cygwin root directory 
rem (C:\cygwin\ if you used the default install config).  Under excluded 
rem processes, add startx.exe, startxwin.exe, xterm.exe, and Cygwin.bat.  These 
rem files will all be in the C:\cygwin\ and C:\cygwin\bin\ directories.
rem 
rem Save the changes to the firewall and give it a shot.

rem yet another cause:
> If Windows DEP is set to "Turn on DEP for all programs and services
> except those I select" certain cygwin-dependent exe files (in my
> case, ssh.exe)  will hang or return errors. The solution is to
> either select those programs as DEP-safe or disable DEP.