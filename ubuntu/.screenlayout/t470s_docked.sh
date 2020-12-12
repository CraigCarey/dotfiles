#!/bin/sh

# t470s
if xrandr | grep -q "DP-2-2 connected"; then
	xrandr --output DP-2-2 --primary
	xrandr --output eDP-1 --mode 1920x1080 --pos 0x0 --rotate normal
	xrandr --output DP-2-1 --mode 1920x1080 --pos 4480x0 --rotate normal
	xrandr --output DP-2-2 --mode 2560x1440 --pos 1920x0 --rotate normal
else
	printf "DP-2-2 not found, not configuring displays\n"
fi

readonly wp="file:///home/craig/Pictures/wallpaper.jpg"
gsettings set org.gnome.desktop.background picture-uri $wp
gsettings set org.gnome.desktop.screensaver picture-uri $wp
