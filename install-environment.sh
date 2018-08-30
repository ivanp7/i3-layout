#!/bin/bash

if [[ $EUID == 0 ]]; then
    echo This script must be run under non-priviledged user. Terminating...
    exit 1
fi

USERNAME=$(whoami)
cd ~

####################################################################

echo "Installing symbolic links..."
ln -sf /home/$USERNAME/HostShared/Workspace/Data/Personal
ln -sf /home/$USERNAME/HostShared/Workspace/Downloads

ln -sf /home/$USERNAME/Personal/Code/bash/home-scripts scripts

ln -sf /home/$USERNAME/Personal/Code/c_cpp
ln -sf /home/$USERNAME/Personal/Code/common-lisp

ln -sf /home/$USERNAME/Personal/Text/Config/known_ssh_hosts .known_ssh_hosts

ln -sf /home/$USERNAME/Personal/Text/Notes/Org/calendar .when/
ln -sf /home/$USERNAME/Personal/Text/Notes/Org/todo/todo.txt .todo/
ln -sf /home/$USERNAME/Personal/Text/Notes/Org/todo/todo.txt.bak .todo/
ln -sf /home/$USERNAME/Personal/Text/Notes/Org/todo/done.txt .todo/
ln -sf /home/$USERNAME/Personal/Text/Notes/Org/todo/report.txt .todo/

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

echo "Installing dropbox, keepassxc, telegram-desktop..."
yay -S dropbox keepassxc telegram-desktop

