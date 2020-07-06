#!/usr/bin/env bash

set -eu

readonly SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"

pushd "$SCRIPT_DIR" > /dev/null

cp "../ubuntu/.bashrc" "${HOME}"
cp "../ubuntu/.zshrc" "${HOME}"
cp "../ubuntu/.bash_aliases" "${HOME}"
cp "../.gitconfig" "${HOME}"
cp "../.tmux.conf" "${HOME}"
cp -r "../cheatsheets/" "${HOME}"

mkdir -p "${HOME}/.ssh/"
cp "../ssh/authorized_keys" "${HOME}/.ssh/"
