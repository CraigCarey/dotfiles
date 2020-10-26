#!/usr/bin/env bash

set -eu

readonly SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"

pushd "$SCRIPT_DIR" > /dev/null

# Host no backup
cp "../elcapitan2hr.jpg" "${HOME}/Pictures/wallpaper.jpg"
mkdir -p "${HOME}/.ssh/"

# Home
cp ".bashrc" "${HOME}"
cp ".zshrc" "${HOME}"
cp ".bash_aliases" "${HOME}"
cp ".profile" "${HOME}"
cp -r ".screenlayout" "${HOME}"
cp "${HOME}/.screenlayout/${HOSTNAME}_docked.sh" "${HOME}/.screenlayout/docked.sh"
cp "../.gitconfig_${HOSTNAME}" "${HOME}/.gitconfig"
cp "../.tmux.conf" "${HOME}"
cp -r "i3/" "${HOME}/.config/"
cp "gtk/.gtkrc-2.0" "${HOME}/"
cp "gtk/settings.ini" "${HOME}/.config/gtk-3.0/"
cp -r "../cheatsheets/" "$HOME"
cp "../ssh/authorized_keys" "${HOME}/.ssh/"
cp "../ssh/ssh_config" "${HOME}/.ssh/"
mkdir -p "${HOME}/.config/rofi" && cp "/usr/share/rofi/themes/Pop-Dark.rasi" "${HOME}/.config/rofi/config.rasi"

# Host
sudo cp "../keyboard" "/etc/default/"
sudo cp "rc.local" "/etc/rc.local"
sudo cp "interfaces" "/etc/network/interfaces"
#sudo cp "20-intel.conf" "/usr/share/X11/xorg.conf.d/" # breaks CUDA drivers!
sudo cp rofi_scripts/* "/usr/local/bin/"


