#!/bin/bash

# in /etc/rc.local:
#sudo -u craig /home/craig/mining/mine_on_boot.sh > /tmp/mineboot.log 2>&1

set -ux

readonly SESSION_NAME="mining"
readonly MINE_SCRIPT="/home/craig/mining/xmrig/build/start.sh"

tmux has-session -t "$SESSION_NAME" &> /dev/null

if [ $? != 0 ]; then
	tmux new-session -d -s "$SESSION_NAME"
	tmux set-option -t "$SESSION_NAME" set-remain-on-exit on
else
	tmux a -t "$SESSION_NAME"
fi

tmux send-keys "sleep 10; bash $MINE_SCRIPT" C-m
