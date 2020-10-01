#!/bin/sh

readonly DISPLAY="DP2-2"

if xrandr | grep -q "$disp connected "; then
    xrandr --output "$disp" --primary
	xrandr --output eDP1 --mode 1920x1080 --pos 0x0 --rotate normal
	xrandr --output DP1 --off
	xrandr --output DP2 --off
	xrandr --output DP2-1 --mode 1920x1080 --pos 4480x0 --rotate normal
	xrandr --output DP2-2 --primary --mode 2560x1440 --pos 1920x0 --rotate normal
	xrandr --output DP2-3 --off
	xrandr --output HDMI1 --off
	xrandr --output HDMI2 --off
	xrandr --output VIRTUAL1 --off
fi