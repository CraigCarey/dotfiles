#!/bin/bash

# in /etc/rc.local:
# sudo -u pi /home/pi/mining/mine_on_boot.sh > /tmp/mineboot.log 2>&1

set -x

readonly SESSION_NAME="mining"
readonly BFG_SCRIPT="/home/pi/mining/bfgminer_5.4.2/start_moonlander2.sh"

tmux has-session -t "$SESSION_NAME" &> /dev/null

if [ $? != 0 ]; then
	tmux new-session -d -s "$SESSION_NAME"
	tmux set-option -t "$SESSION_NAME" set-remain-on-exit on
fi

tmux send-keys "sleep 10; $BFG_SCRIPT" C-m
