:
# prereq: run setup.remote from an esatablished machine first.
#
#!       init.done_for_this_host
#
# if finished, then send this line
if [ ! -d "$HOME" ]; then
        unset HOME
fi
if [ -z "$HOME" ]; then
        export HOME=/cygdrive/c/Users/nelsons
fi
mkdir -p  /cygdrive/c/tmp $HOME/work/bu $HOME/tmp
chmod 777 /cygdrive/c/tmp
echo $DROP
cp -pr $DROP/home/.??* $HOME
DP_BASE=`basename $dp`
echo . $dp/home/.profile > $HOME/.profile
. $HOME/.profile

cd $DROP/init/
pwd
bash -x $dp/init/scripts/init_home.sh
hosts.update_from_drop
powercfg /hibernate off # this stops big hiberfil.sys file

install_thunderbird()
{
        pause 'thunderbird installed?'
        thunderbird_init_from_Drop
        if [ -n "thunderbird_wanted" ]; then
                thunderbird_init_from_Drop
        fi
}

# I think  browser syncing eliminates the need for this step
# browser.init
mkdir -p $DOWNLOADS
net share downloads=`cygpath --dos $DOWNLOADS`

$dp/init/scripts/init_reg.sh
# for orcl, proxy settings as follows:
#   check "Automatically detect settings"
#   uncheck "Use automatic..."
#   check "Use a proxy server..."
#   "Address" www-proxy.us.oracle.com
#   check "Bypass proxy server"
case $USER in
        nsproul|x)
                rm -rf /home/$USER/.ssh
                mkdir -p /home/$USER
                cp -r $HOME/.ssh /home/$USER/.ssh
        ;;
esac
$dp/init/downloads/win/xming.rel_x64_Xming-7-7-0-10-setup.exe &
# http://support.microsoft.com/kb/192806, http://pcsupport.about.com/od/tipstricks/a/control-panel-command-line.htm
#control /name Microsoft.AutoPlay
control /name Microsoft.Display
#control /name Microsoft.RemoteAppAndDesktopConnections
control /name Microsoft.PowerOptions
control /name Microsoft.Personalization
# screen resolution

control Desk.cpl
control /name Microsoft.WindowsUpdate
#control firewall.cpl # gets turned on below using powersh
#control /name Microsoft.FolderOptions
control /name Microsoft.Sound
#control /name Microsoft.IndexingOptions
#control main.cpl keyboard
case "$USERNAME" in
        aime)
        ;;
        *)
                mkdir /cygdrive/c/ts_logs
                e $dp/init/downloads
                pidgin.init
                control printers
                # from http://sourceforge.net/projects/aoo-extensions/files/874/34/oracle-pdfimport.oxt/download?use_mirror=hivelocity&r=http%3A%2F%2Fextensions.openoffice.org%2Fen%2Fproject%2Foracle-pdf-import-extension&use_mirror=hivelocity
                cd $DROP/init/downloads/win
                cmd /c open_office_pdf_edit.oxt
                #install_thunderbird
        ;;
esac

if orcl.on_vpn; then
        case `hostname` in
                slc*)
                        # ucf VMs automatically are ok in this dept.
                ;;
                *)
                        control /name Microsoft.InternetOptions
                ;;
        esac
fi

if ! NetSh Advfirewall set allprofiles state on; then
        echo "$0: NetSh Advfirewall set allprofiles state on failed, could not turn on firewall, I believe the firewall service is not running..." 1>&2
else
        # http://support.microsoft.com/kb/947709, http://technet.microsoft.com/en-us/library/dd734783(v=ws.10).aspx
        #netsh firewall            add allowedprogram C:\\cygwin\\bin\\ruby.exe ruby ENABLE
        netsh advfirewall firewall add rule name=ruby dir=in action=allow protocol=TCP localport=1209
        netsh advfirewall firewall add rule name=ruby dir=in action=allow protocol=TCP localport=81
        netsh advfirewall firewall add rule name=ruby dir=in action=allow protocol=TCP localport=82
        netsh advfirewall firewall add rule name=ruby dir=in action=allow protocol=TCP localport=8933
fi
bash -x start_menu.propagate initializing_system
bash -x start_menu.rejig.sh

if orcl.on_vpn; then
        if [ -f /cygdrive/c/Windows/ssh.exe ]; then
                echo moving away old putty
                aloud mv /cygdrive/c/Windows/ssh.exe /cygdrive/c/Windows/putty_WAS_SSH.exe
        fi
        #e orcl
        reg_set_proxy_orcl init
        #browser.install_extensions  # so far just for orcl
        b http://printers.oraclecorp.com
        echo 127.0.0.1 mydesktop.oraclecorp.com >> $SYSTEMROOT/SYSTEM32/DRIVERS/ETC/HOSTS
        #mkdir /cygdrive/c/data
        #scp -i /home/x/.ssh/id_rsa wonkaha.us.oracle.com:/home/nsproul/data/*.pst /cygdrive/c/data
else
        case "$COMPUTERNAME" in
                vms*)
                        net share b2=c:\\Users\\nelsons\\work\\monr\\b2
                        autologin.sh nelson 'PasswordZ123!' MONROESECURITIE
                ;;
                *)
                        if ! monr.on_vpn; then
                                touch $HOME/.aws_available

                                echo set up
                                cmd /c control printers
                                (
                                cd /cygdrive/c/
                                cp -p $DROP/init/data/win/Jts.tar.gz .
                                unwrap Jts.tar.gz   # get my preferred IB behavior
                                rm Jts.tar
                                )
                                #b https://secure.logmein.com/logmein.msi

                                #(
                                #cd '/cygdrive/c/Program Files (x86)/Xming'
                                ## should be nohup.me, but not doing that just yet since I want to see if it actually works...  -nas 12/4/2013:
                                #./Xming.exe :0 -clipboard -multiwindow `dosify $DROP/init/data/win/config.xlaunch`
                                # error on o45:
                                #        Fatal server error:
                                #        Unrecognized option: c:\Users\nelsons\dp\init\data\win\config.xlaunch
                                $DOWNLOADS/usb/natspeak/win64__DragonPreferred10.1ENX_078.exe
                                # disable windows hot keys: gpedit.msc -> User Configuration/administrative templates/windows components/windows explorer: double click on turn off windows + x hotkeys
                                gpedit.msc
                                if [ ! -d $HOME/work.monthly.0 ]; then
                                        date ; cp -pr $DROP $HOME/work.monthly.0 ; date
                                fi
                        fi
                ;;
        esac
        e $DROP/init/downloads/win
        cp.usb
        ruby.init
fi

emacs.init.lisp
case `hostname` in
        vms*|VMS*)
        ;;
        *)
                monr.init
        ;;
esac
Set-ExecutionPolicy RemoteSigned
powercli.init # assumes powercli installed,but enables ps1 scripts
$dp/init/downloads/win/agent_flexconnect_rm.exe
exit
export HOME=/cygdrive/c/users/nelsons; sh -x $dp/init/setup
