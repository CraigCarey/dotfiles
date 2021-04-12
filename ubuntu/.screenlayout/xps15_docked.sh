#!/bin/sh

xrandr --output eDP-1-1 --primary --mode 1920x1080 --pos 2560x360 --rotate normal

if xrandr | grep -iq "DP-1-1-3 connected"; then
    xrandr --output eDP-1-1 --primary --mode 1920x1080 --pos 2560x360 --rotate normal
    xrandr --output DP-1-1-3 --mode 2560x1440 --pos 0x0 --rotate normal
else
	printf "DP-1-1-3 not found, not configuring displays\n"
fi

readonly wp="file:///home/craig/Pictures/wallpaper.jpg"
gsettings set org.gnome.desktop.background picture-uri $wp
gsettings set org.gnome.desktop.screensaver picture-uri $wp
