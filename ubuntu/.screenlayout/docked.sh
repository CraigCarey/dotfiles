#!/bin/sh

if xrandr | grep -iq "DP-1-3 connected"; then
    xrandr --output DP-1-3 --mode 1920x1080 --pos 0x0 --rotate normal
    xrandr --output eDP-1-1 --primary --mode 1920x1080 --pos 1920x0 --rotate normal
fi

feh --bg-fill ~/Pictures/wallpaper.jpg
