#!/bin/sh

if xrandr | grep -iq "DP-1-3 connected"; then
    xrandr --output DP-1-3 --mode 1920x1080 --pos 0x0 --rotate normal
    xrandr --output eDP-1-1 --primary --mode 1920x1080 --pos 1920x0 --rotate normal
else
	printf "DP-1-3 not found, not configuring displays\n"
fi

readonly wp="file:///home/craig/Pictures/wallpaper.jpg"
gsettings set org.gnome.desktop.background picture-uri $wp
gsettings set org.gnome.desktop.screensaver picture-uri $wp
