#!/bin/sh

# t470s
if xrandr | grep -q "DP2-2 connected"; then
	xrandr --output DP2-2 --primary
	xrandr --output eDP1 --mode 1920x1080 --pos 0x0 --rotate normal
	xrandr --output DP2-1 --mode 1920x1080 --pos 4480x0 --rotate normal
	xrandr --output DP2-2 --mode 2560x1440 --pos 1920x0 --rotate normal
fi

readonly wp="file:///home/craig/Pictures/wallpaper.jpg"
gsettings set org.gnome.desktop.background picture-uri $wp
gsettings set org.gnome.desktop.screensaver picture-uri $wp
