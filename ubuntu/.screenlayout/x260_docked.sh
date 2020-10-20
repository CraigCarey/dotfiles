#!/bin/sh

# t470s

readonly DISPLAY="DP2-2"

if xrandr | grep -q "$disp connected "; then
    xrandr --output "$disp" --primary
	xrandr --output eDP1 --mode 1920x1080 --pos 0x0 --rotate normal
	xrandr --output DP2-1 --mode 1920x1080 --pos 4480x0 --rotate normal
	xrandr --output DP2-2 --primary --mode 2560x1440 --pos 1920x0 --rotate normal
fi