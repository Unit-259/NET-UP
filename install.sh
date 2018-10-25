#!/usr/bin/env bash
root_check_init(){
    echo "Checking for Root.."
    if [[ $EUID -ne 0 ]]; then
        echo "This script must be ran with sudo or root privileges, or this isn't going to work."
            exit 1
    else
        echo "Root Access Granted!"
    fi
}
cd $HOME
root_check_init;
HOMEDIR=$HOME/netup
if [[ -d "$HOMEDIR" ]] ; then
    echo "Directory already exists..";
    echo "Removing old copy..";
    rm -rf $HOMEDIR
else
    echo "$HOMEDIR already exists.."
fi
cd $HOME
echo "Cloning from GitHub..";
git clone https://github.com/private-locker/Net-UP.git netup
cd $HOMEDIR
chmod +x $HOMEDIR/netup
chmod +x $HOMEDIR/modules/enablemod
chmod +x $HOMEDIR/modules/disablemod
./$HOMEDIR/modules/enablemod -f listmods
./$HOMEDIR/netup
rm -rf "$0";
exit

