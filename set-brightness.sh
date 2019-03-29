#!/bin/bash

BACKLIGHT=intel_backlight

echo Max brightness: $(cat /sys/class/backlight/$BACKLIGHT/max_brightness)
echo Current brighness: $(cat /sys/class/backlight/$BACKLIGHT/actual_brightness)

if [[ -n $1 ]]; then echo $1 | sudo tee /sys/class/backlight/$BACKLIGHT/brightness > /dev/null; fi

