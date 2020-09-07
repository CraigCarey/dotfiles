#!/bin/sh

if xrandr | grep -q "DP-1-1-1 connected"; then
    xrandr --output eDP-1-1 --mode 1920x1080 --pos 1920x117 --rotate normal
    xrandr --output DP-1-1 --off
    xrandr --output DP-1-2 --off
    xrandr --output DP-1-3 --off
    xrandr --output DP-1-1-1 --primary --mode 1920x1080 --pos 0x0 --rotate normal
    xrandr --output DP-1-1-2 --off
    xrandr --output DP-1-1-3 --off
fi
