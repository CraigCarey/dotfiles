#!/usr/bin/env bash

set -u

readonly SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"

pushd "$SCRIPT_DIR" > /dev/null





# Home
cp "${HOME}/.bashrc" .
cp "${HOME}/.zshrc" .
cp "${HOME}/.bash_aliases" .
cp "${HOME}/.profile" .
cp -r "${HOME}/.screenlayout" .
cp "${HOME}/.screenlayout/docked.sh" "${HOME}/.screenlayout/${HOSTNAME}_docked.sh"
cp "${HOME}/.gitconfig" "../.gitconfig_${HOSTNAME}"
cp "${HOME}/.tmux.conf" ..
cp -r "${HOME}/.config/i3/" .
cp "${HOME}/.gtkrc-2.0" "gtk/"
cp "${HOME}/.config/gtk-3.0/settings.ini" "gtk/"
cp -r "$HOME/cheatsheets/" .. 
cp "${HOME}/.ssh/authorized_keys" "../ssh/"
cp "${HOME}/.ssh/ssh_config" "../ssh/"


# Host
cp "/etc/default/keyboard" ..
cp "/etc/rc.local" .
cp "/etc/network/interfaces" .
#cp "/usr/share/X11/xorg.conf.d/20-intel.conf" .

