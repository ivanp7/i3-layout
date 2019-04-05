#!/bin/sh

# dependency: shantz-xwinwrap-bzr from AUR
[ -n $1 ] && [ -f $1 ] && xwinwrap -ov -fs -- mpv --osc=no --osd-level=0 --no-input-default-bindings --vo=vdpau --hwdec=vdpau -wid WID --loop=inf $1

