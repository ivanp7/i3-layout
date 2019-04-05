#!/bin/sh

# MPV_OPTIONS="--osc=no --osd-level=0 --no-input-default-bindings --vo=vdpau --hwdec=vdpau"
MPV_OPTIONS="--no-input-default-bindings --vo=vdpau --hwdec=vdpau"

# dependency: shantz-xwinwrap-bzr from AUR
[ -n $1 ] && [ -f $1 ] && xwinwrap -ov -fs -- mpv $MPV_OPTIONS -wid WID --loop=inf $1

