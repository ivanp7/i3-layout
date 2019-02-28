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

echo "Copying SSH keys..."
install -Dm 600 Personal/Keys/SSH/id_rsa .ssh/
install -Dm 644 Personal/Keys/SSH/id_rsa.pub .ssh/

####################################################################

echo "Setting default graphics mode: 1920x1080, 60 Hz, 24 bits depth..."
sudo install -Dm 644 $SCRIPT_DIR/90-resolution.conf /etc/X11/xorg.conf.d/

####################################################################

echo "Installing keepassxc, telegram-desktop, qbittorrent, dropbox, libreoffice, mtpaint..."
yay -S telegram-desktop qbittorrent libreoffice-still mtpaint aspell-ru
yay -S termplay pixterm-git browsh

