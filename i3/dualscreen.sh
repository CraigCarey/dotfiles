#!/bin/sh

# Mode obtained using `gtf 2560 1440 60`
xrandr --newmode  "2560x1440_60.00"  311.83  2560 2744 3024 3488  1440 1441 1444 1490  -HSync +Vsync
xrandr --addmode DP2-1 2560x1440_60.00
xrandr --output VIRTUAL1 --off --output eDP1 --primary --mode 1920x1080 --pos 0x608 --rotate normal --output DP1 --off --output DP2-1 --mode 2560x1440_60.00 --pos 1920x0 --rotate normal --output DP2-2 --off --output DP2-3 --off --output HDMI2 --off --output HDMI1 --off --output DP2 --off
feh --bg-fill ~/Pictures/wallpaper.jpg
