#!/bin/sh -x
cd $HOME
if [ ! -d "$dp" ]; then
        echo "$0: error: could not find directory dp: \"$dp\"" 1>&2
        exit 1
fi
if [ -d /cygdrive/c ]; then
        unix=''
        if [ -d Dropbox ]; then
                dp=$HOME/Dropbox
        fi
else
        unix='yes'
fi

Aloud()
{
        echo "$*"
        eval "$*"
}


for f in `ls -a $dp/home`; do
        case "$f" in
                .|..|.unison|*.gz|*.win)
                ;;
                .ssh)
                        if [ -d $HOME/.ssh ]; then
                                if [ ! -d $HOME/.ssh.old ]; then
                                        mv $HOME/.ssh $HOME/.ssh.old
                                fi
                        fi
                        if [ ! -d $HOME/.ssh ]; then
                                cp -pr $dp/home/.ssh $HOME/.ssh
                                ssh.ck
                        fi 
                ;;
                *)
                        if [ -f "$HOME/$f" ]; then
                                if [ ! -f "$HOME/$f.old" ]; then
                                        Aloud mv $HOME/$f $HOME/$f.old
                                fi
                        fi
                        if [ -n "$unix" ]; then
                                Aloud ln -s $dp/home/$f $HOME/$f
                        else
                                case `basename "$f"` in
                                        .bash*|.profile)
                                                echo sourcing $f
                                                (
                                                echo "export PATH=/bin:/usr/bin"        # defend against mks
                                                echo ". $dp/home/$f"
                                                ) > "$f"
                                        ;;
                                        s.tar.gzXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX)  # for now relying on just copying
                                                case $USER in
                                                        ec2-user)
                                                        ;;
                                                        *)
                                                                ssh.refresh
                                                        ;;
                                                esac
                                        ;;
                                        *)
                                                Aloud cp -rp $dp/home/$f $HOME/$f
                                        ;;
                                esac
                        fi
                ;;
        esac
done
exit
sh -x $DROP/init/scripts/init_home.sh 