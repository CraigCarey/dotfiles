#!/usr/bin/env bash

set -eu

readonly SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"

pushd "$SCRIPT_DIR" > /dev/null

cp ".bashrc" "${HOME}"
cp ".zshrc" "${HOME}"
cp ".bash_aliases" "${HOME}"
sudo cp "../keyboard" "/etc/default/"
#sudo cp "20-intel.conf" "/usr/share/X11/xorg.conf.d/" # breaks CUDA drivers!
cp "../.gitconfig" "${HOME}"
cp "../.tmux.conf" "${HOME}"
cp -r "i3/" "${HOME}/.config/"
cp "gtk/.gtkrc-2.0" "${HOME}/"
cp "gtk/settings.ini" "${HOME}/.config/gtk-3.0/"
mkdir -p "${HOME}/.config/rofi" && cp "/usr/share/rofi/themes/Pop-Dark.rasi" "${HOME}/.config/rofi/config.rasi"
cp "../elcapitan2hr.jpg" "${HOME}/Pictures/wallpaper.jpg"
cp -r "../cheatsheets/" "$HOME"
sudo cp rofi_scripts/* "/usr/local/bin/"

mkdir -p "${HOME}/.ssh/"
cp "../ssh/authorized_keys" "${HOME}/.ssh/"