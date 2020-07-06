#!/usr/bin/env bash

set -u

readonly SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"

pushd "$SCRIPT_DIR" > /dev/null

cp "${HOME}/.bashrc" .
cp "${HOME}/.zshrc" .
cp "${HOME}/.bash_aliases" ../ubuntu/
cp "${HOME}/bashrc" ../ubuntu/
cp "${HOME}/zshrc" ../ubuntu/
cp "${HOME}/bash_aliases" ../ubuntu/
cp -r "${HOME}/cheatsheets/" ..
cp "/etc/default/keyboard" ..
cp "${HOME}/.gitconfig" ..
cp "${HOME}/.tmux.conf" ..
cp "${HOME}/.ssh/authorized_keys" "../ssh/"
cp "${HOME}/.ssh/ssh_config" "../ssh/"
cp "/etc/network/interfaces" .
