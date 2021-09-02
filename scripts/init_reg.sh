:
if [ -z "`which reg`" ]; then
        echo "uh-oh, $0 cannot find reg.exe.  Are we on w2k?  Giving up..."
        exit
fi

reg_setenv HOME `cygpath --dos $HOME`
reg_setenv PATH "$PATH;c:\\cygwin\\bin"
reg_setenv DROP `cygpath --dos $dp`

reg add HKEY_CURRENT_USER\\Software\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Advanced /t REG_DWORD /v IntelliMenus /d 0 /f
reg add "HKLM\\SYSTEM\\ControlSet001\\Control\\Terminal Server" /t REG_DWORD /v fSingleSessionPerUser /d 1 /f

# alternative settings shown at http://superuser.com/questions/388160/keyboard-repeat-rate-repeat-delay-values-in-win7
#reg add "HKEY_CURRENT_USER\\Control Panel\\Keyboard" /t REG_DWORD /v KeyboardSpeed /d 31 /f
reg add "HKEY_CURRENT_USER\\Control Panel\\Keyboard" /t REG_DWORD /v KeyboardSpeed /d 0x0000001f /f
reg add "HKEY_CURRENT_USER\\Control Panel\\Keyboard" /t REG_DWORD /v KeyboardDelay /d 0 /f

# http://computerstepbystep.com/windows_search_service.html
reg add "HKEY_LOCAL_MACHINE\\SYSTEM\\CurrentControlSet\\services\\WSearch" /f /t REG_DWORD /v Start /d 4

reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /t REG_DWORD /v Hidden /d 00000001 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /t REG_DWORD /v HideFileExt /d 00000000 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /t REG_DWORD /v HideDrivesWithNoMedia /d 00000000 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /t REG_DWORD /v ShowSuperHidden /d 00000001 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\CabinetState" /t REG_DWORD /v FullPath /d 00000001 /f
reg add "HKEY_CURRENT_USER\Control Panel\Keyboard" /t REG_SZ /v KeyboardDelay /d "0" /f
reg add "HKEY_CURRENT_USER\Control Panel\Keyboard" /t REG_SZ /v KeyboardSpeed /d "31" /f

reg add "HKEY_LOCAL_MACHINE\\System\\CurrentControlSet\\Services\\TCPIP\\ServiceProvider" /t REG_DWORD /v HostsPriority /d 400 /f
reg add "HKEY_CURRENT_USER\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\Explorer" /t REG_DWORD /v NoWinKeys /d 1 /f
reg add "HKEY_LOCAL_MACHINE\\SOFTWARE\\Microsoft\\Internet Explorer\\MAIN\\FeatureControl\\FEATURE_WEBOC_POPUPMANAGEMENT" /t REG_DWORD /v iexplore.exe /d 0 /f
# makes it less likely that tethering will be detected:
reg add "HKEY_LOCAL_MACHINE\\SYSTEM\\CurrentControlSet\\Services\\Tcpip\\Parameters" /t REG_DWORD /v DefaultTTL /d 65 /f

# never figured out reg setting(s?) for all the colors.  control panel->display->appearance, set color scheme to 'windows classic'.
reg add "HKEY_CURRENT_USER\\Control Panel\\Colors" /t REG_SZ /v ActiveTitle /d 255.0.0 /f
reg add "HKEY_CURRENT_USER\\Control Panel\\Colors" /t REG_SZ /v ActiveBorder /d 255.0.0 /f
reg add "HKEY_CURRENT_USER\\Control Panel\\Appearance" /t REG_SZ /v Current    /d "Windows Standard" /f
reg add "HKEY_CURRENT_USER\\Control Panel\\Appearance" /t REG_SZ /v NewCurrent /d "Windows Standard" /f
reg add "HKEY_LOCAL_MACHINE\\SYSTEM\\CurrentControlSet\\Services\\SharedAccess\\Parameters\\FirewallPolicy\\StandardProfile\\GloballyOpenPorts\\List" /t REG_SZ /v 3389:TCP /d "3389:TCP:*:Enabled:@xpsp2res.dll,-22009" /f
# disable popup blocker for IE: http://support.microsoft.com/kb/843016
reg add "HKEY_LOCAL_MACHINE\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Internet Settings\\Zones\\0" /t REG_DWORD /v 1809 /d 3 /f
reg add "HKEY_LOCAL_MACHINE\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Internet Settings\\Zones\\1" /t REG_DWORD /v 1809 /d 3 /f
reg add "HKEY_LOCAL_MACHINE\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Internet Settings\\Zones\\2" /t REG_DWORD /v 1809 /d 3 /f
reg add "HKEY_LOCAL_MACHINE\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Internet Settings\\Zones\\3" /t REG_DWORD /v 1809 /d 3 /f
reg add "HKEY_LOCAL_MACHINE\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Internet Settings\\Zones\\4" /t REG_DWORD /v 1809 /d 3 /f
reg add "HKEY_CURRENT_USER\\Software\\Microsoft\\Windows\\CurrentVersion\\Explorer" /t REG_DWORD /v EnableAutoTray /d 0 /f
reg add "HKEY_LOCAL_MACHINE\\SYSTEM\\CurrentControlSet\\Control\\Terminal Server" /t REG_DWORD /v fDenyTSConnections /d 0 /f

echo "if window border + title colors are not right, use reg_mon to figure out remaining sets, and update /cygdrive/c/users/nelsons/Dropbox/init/scripts/init_reg.sh"
echo "if window border + title colors are not right, use reg_mon to figure out remaining sets, and update /cygdrive/c/users/nelsons/Dropbox/init/scripts/init_reg.sh"
echo "if window border + title colors are not right, use reg_mon to figure out remaining sets, and update /cygdrive/c/users/nelsons/Dropbox/init/scripts/init_reg.sh"
echo "if window border + title colors are not right, use reg_mon to figure out remaining sets, and update /cygdrive/c/users/nelsons/Dropbox/init/scripts/init_reg.sh"
echo "if window border + title colors are not right, use reg_mon to figure out remaining sets, and update /cygdrive/c/users/nelsons/Dropbox/init/scripts/init_reg.sh"
echo "if window border + title colors are not right, use reg_mon to figure out remaining sets, and update /cygdrive/c/users/nelsons/Dropbox/init/scripts/init_reg.sh"
echo "if window border + title colors are not right, use reg_mon to figure out remaining sets, and update /cygdrive/c/users/nelsons/Dropbox/init/scripts/init_reg.sh"
echo "if window border + title colors are not right, use reg_mon to figure out remaining sets, and update /cygdrive/c/users/nelsons/Dropbox/init/scripts/init_reg.sh"


if [ -z "`reg_get HOME`" ]; then
        if [ -d /cygdrive/c/users/nelsons ]; then
                HOME=c:/users/nelsons
        elif [ -d /cygdrive/d/users/nelsons ]; then
                HOME=d:/users/nelsons
        elif [ -d /cygdrive/e/users/nelsons ]; then
                HOME=e:/users/nelsons
        fi
fi
reg_set HOME `cygpath --dos $HOME`
cd $HOME
. $HOME/.profile
if [ -n "$UNIX_HOME" ]; then
        if [ -z "`reg_get UNIX_HOME`" ]; then
                reg_set UNIX_HOME `cygpath --dos $UNIX_HOME`
        fi
fi

exit
bx $DROP/init/scripts/init_reg.sh