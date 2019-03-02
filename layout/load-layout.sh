#!/bin/bash

# Building this layout
#
# workspace 1: termite
# workspace 9: firefox
# workspace 10: telegram-desktop
#
# LAYOUT
# ==========

start_app()
{
    if ! pgrep ${1:0:15}; then
        i3-msg "exec $1"
        sh $HOME/.config/i3/bin/wait-and-move.sh $1 1 $2
    fi
}

start_app firefox 9
i3-msg "rename workspace 9 to 9: Firefox"
start_app telegram-desktop 10
i3-msg "rename workspace 10 to 10: Telegram"
start_app termite 1
i3-msg "rename workspace 1 to 1: Terminal"

