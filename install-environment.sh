#!/bin/bash

if [[ $EUID == 0 ]]; then
    echo This script must be run under non-priviledged user. Terminating...
    exit 1
fi

USERNAME=$(whoami)
cd ~

####################################################################

echo "Installing symbolic links..."
ln -sf /mnt/vmhgfs/shared HostShared

ln -sf /home/$USERNAME/HostShared/Workspace/Data/Personal
ln -sf /home/$USERNAME/HostShared/Workspace/Downloads

ln -sf /home/$USERNAME/Personal/Code/bash/home-scripts scripts

ln -sf /home/$USERNAME/Personal/Code/c_cpp
ln -sf /home/$USERNAME/Personal/Code/common-lisp

ln -sf /home/$USERNAME/Personal/Code/bash/remote-sh/remote.sh bin/
ln -sf /home/$USERNAME/Personal/Text/Config/ssh_known_hosts .ssh_known_hosts

rm -rf /home/$USERNAME/Org
ln -sf /home/$USERNAME/Personal/Text/Notes/Org

ln -sf /home/$USERNAME/Personal/Pictures/Wallpapers/Used wallpapers

ln -sf /home/$USERNAME/scripts/bin/octave-gui bin/

echo "Setting issue picture..."
cat Personal/Pictures/ASCII/Used/issue_picture | bash bin/issue-picture.sh

echo "Copying SSH keys..."
cp -f Personal/Keys/SSH/id_rsa .ssh/
cp -f Personal/Keys/SSH/id_rsa.pub .ssh/
chmod 600 .ssh/id_rsa
chmod 644 .ssh/id_rsa.pub

####################################################################

echo "Setting default graphics mode: 1920x1080, 60 Hz, 24 bits depth..."
echo $'
Section "Monitor"
Identifier "Virtual1"
ModeLine "1920x1080_60.00" 173.00  1920 2048 2248 2576  1080 1083 1088 1120 -hsync +vsync
Option "PreferredMode" "1920x1080_60.00"
EndSection

Section "Screen"
Identifier "Screen0"
Monitor "Virtual1"
DefaultDepth 24
SubSection "Display"
Modes "1920x1080_60.00"
EndSubSection
EndSection

Section "Device"
Identifier "Device0"
Driver "vmware"
EndSection
' | sudo tee /etc/X11/xorg.conf.d/90-resolution.conf

####################################################################

echo "Installing keepassxc, telegram-desktop, qbittorrent, dropbox..."
yay -S keepassxc telegram-desktop qbittorrent dropbox

