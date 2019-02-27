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

ln -sf /home/$USERNAME/Personal/Code/bash/home-scripts bin/scripts

ln -sf /home/$USERNAME/Personal/Code/c_cpp
ln -sf /home/$USERNAME/Personal/Code/common-lisp

ln -sf /home/$USERNAME/Personal/Code/bash/remote-sh/remote.sh bin/
ln -sf /home/$USERNAME/Personal/Text/Config/ssh_known_hosts .ssh_known_hosts

rm -rf /home/$USERNAME/Org
ln -sf /home/$USERNAME/Personal/Text/Notes/Org

ln -sf /home/$USERNAME/Personal/Pictures/Wallpapers/Used wallpapers

echo "Setting issue picture..."
cat Personal/Pictures/ASCII/Used/issue_picture | bash bin/issue-picture.sh

echo "Copying SSH keys..."
cp -f Personal/Keys/SSH/id_rsa .ssh/
cp -f Personal/Keys/SSH/id_rsa.pub .ssh/
chmod 600 .ssh/id_rsa
chmod 644 .ssh/id_rsa.pub

####################################################################

echo "Setting default graphics mode: 1920x1080, 60 Hz, 24 bits depth..."
sudo cp $SCRIPT_DIR/90-resolution.conf /etc/X11/xorg.conf.d/

####################################################################

echo "Installing keepassxc, telegram-desktop, qbittorrent, dropbox, libreoffice, mtpaint..."
yay -S telegram-desktop qbittorrent libreoffice-still mtpaint aspell-ru

