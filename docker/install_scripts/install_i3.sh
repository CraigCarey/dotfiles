#!/usr/bin/env bash

set -eu

readonly SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"

pushd "$SCRIPT_DIR" > /dev/null

source sudo_alias.sh

sudo apt-get update -y && sudo apt-get upgrade -y
sudo apt-get install -y \
  i3 \
  i3blocks \
  arandr \
  feh \
  rofi \
  pavucontrol \
  pasystray \
  blueman \
  powerline \
  fonts-powerline

if [[ ! -d playerctl-2.1.1_amd64.deb ]]; then
  axel https://github.com/altdesktop/playerctl/releases/download/v2.1.1/playerctl-2.1.1_amd64.deb
  sudo dpkg -i playerctl-2.1.1_amd64.deb
fi
