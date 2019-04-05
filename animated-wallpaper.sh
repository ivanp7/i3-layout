#!/bin/sh

start_wallpaper ()
{
    # MPV_OPTIONS="--osc=no --osd-level=0 --no-input-default-bindings --vo=vdpau --hwdec=vdpau"
    MPV_OPTIONS="--no-input-default-bindings --vo=vdpau --hwdec=vdpau"

    # dependency: shantz-xwinwrap-bzr from AUR
    [ -n $1 ] && [ -f $1 ] && \
        i3-msg "exec --no-startup-id xwinwrap -ov -fs -- mpv $MPV_OPTIONS -wid WID --loop=inf $1"
}

start_wallpaper $HOME/wallpapers/animated.wallpaper

