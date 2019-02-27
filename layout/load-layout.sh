#!/bin/bash

# Building this layout
#
# workspace 9: firefox
# workspace 10: telegram-desktop
#
# LAYOUT
# ==========

# Prevent multiple dropbox instances
pkill dropbox
i3-msg "exec dropbox"

start_app()
{
    if ! pgrep ${1:0:15}; then
        i3-msg "exec $1"
        sh $HOME/.config/i3/bin/wait-and-move.sh $1 1 $2
    fi
}

i3-msg "rename workspace 1 to 1: Terminal"
start_app firefox 9
i3-msg "rename workspace 9 to 9: Firefox"
start_app telegram-desktop 10
i3-msg "rename workspace 10 to 10: Telegram"

# i3-msg workspace "2"

# i3-msg "append_layout $HOME/scripts/layout/workspace_2.json"
# termite --exec "bash -c 'ssh-add; clear; echo; neofetch; bash'" --title "Terminal2" &
# termite --exec "sh $HOME/scripts/kpcli.sh" --title "KeePass" &

# sleep 1

