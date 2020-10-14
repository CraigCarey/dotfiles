#!/bin/sh

if xrandr | grep -iq "DP-1-1 connected"; then
    xrandr --output eDP-1 --primary --mode 1920x1080 --pos 1920x0 --rotate normal
    xrandr --output DP-1-1 --mode 1920x1080 --pos 0x0 --rotate normal
fi
