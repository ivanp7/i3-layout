#!/bin/bash

xprop -spy -root _NET_CURRENT_DESKTOP | while read -r event; do
    num=$(i3-msg -t get_workspaces | jq '.[] | select(.focused==true) | .num')
    feh --bg-scale "$HOME/wallpapers/${num}.wallpaper"
done

