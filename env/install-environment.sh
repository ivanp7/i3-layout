#!/bin/bash

if [[ $EUID == 0 ]]; then
    echo This script must be run under non-priviledged user. Terminating...
    exit 1
fi

cd `dirname $0`
SCRIPT_DIR=$PWD

USERNAME=$(whoami)
cd $HOME

####################################################################

echo "Installing symbolic links..."
ln -sf /mnt/vmhgfs/shared HostShared

ln -sf /home/$USERNAME/HostShared/Workspace/Data/Personal
ln -sf /home/$USERNAME/HostShared/Workspace/Downloads

ln -sf /home/$USERNAME/Personal/Text/Config/ssh_known_hosts .ssh_known_hosts

rm -rf /home/$USERNAME/org
ln -sf /home/$USERNAME/Personal/Text/Notes/org

echo "Copying SSH keys..."
install -Dm 600 Personal/Keys/SSH/id_rsa .ssh/
install -Dm 644 Personal/Keys/SSH/id_rsa.pub .ssh/

