#!/bin/bash

# Building this layout
# ____________________________________
# |                     |             |
# |                     |             |
# |                     |  tty-clock  |
# |                     |             |
# |                     |_____________|
# |                     |             |
# |       termite       |             |
# |                     |             |
# |                     |     vim     |
# |                     |             |
# |                     |             |
# |                     |             |
# |_____________________|_____________|
#
# It may be usefull to disable mouse pointer and/or touchpad while
# layouting.
#
# Disable mouse:
# mouseID=`xinput list | grep -Eo 'Mouse\s.*id\=[0-9]{1,2}' | grep -Eo '[0-9]{1,2}'`
# xinput set-prop $mouseID "Device Enabled" 0
#
# Enable mouse:
# xinput set-prop $mouseID "Device Enabled" 1
#
# Disable the touchpad:
# touchID=`xinput list | grep -Eo 'TouchPad\s*id\=[0-9]{1,2}' | grep -Eo '[0-9]{1,2}'`
# xinput set-prop $touchID "Device Enabled" 0
#
# Enable the touchpad
# xinput set-prop $touchID "Device Enabled" 1

# CODE
# ==========

i3-msg workspace "2"

i3-msg "append_layout ~/scripts/layout/workspace_2.json"
termite --exec "/bin/bash -c 'echo; neofetch; bash'" --title "Terminal" &
termite --exec "$HOME/scripts/kpcli.sh" --title "KeePass" &

i3-msg workspace "1"

i3-msg "append_layout ~/scripts/layout/workspace_1.json"
termite --exec "/bin/bash -c 'echo; neofetch; bash'" --title "Terminal" &
termite --exec "tty-clock -c -b -n" --title "Clock" &
termite --exec "/bin/bash -c 'when ci; bash'" --title "Calendar" &
termite --exec "/bin/bash -c 'todo.sh ls; bash'" --title "To-Do List" &

~/scripts/layout/wallpaper.sh &

sleep 1.0
i3-msg '[con_mark="primary_terminal"] focus'
sleep 3.0
i3-msg '[con_mark="primary_terminal"] focus'

