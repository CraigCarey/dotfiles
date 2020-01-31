#!/usr/bin/env bash

cp "/etc/rc.local" .
cp "${HOME}/.bashrc" .
cp "${HOME}/.zshrc" .
cp "/etc/default/keyboard" ..
cp "${HOME}/.bash_aliases" .
cp "${HOME}/.gitconfig" ..
cp "${HOME}/.tmux.conf" ..
cp -r "${HOME}/.config/i3/" .
cp "${HOME}/.gtkrc-2.0" "gtk/"
cp "${HOME}/.config/gtk-3.0/settings.ini" "gtk/"
cp -r "$HOME/cheatsheets/" .. 
cp "${HOME}/.ssh/authorized_keys" "../ssh/"
cp "${HOME}/.ssh/ssh_config" "../ssh/"
cp "/etc/network/interfaces" .
