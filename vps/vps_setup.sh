#!/bin/bash

sudo apt update && apt -y upgrade

sudo apt --yes --force-yes install \
                           git \
                           python3.5 \
                           python3-venv \
                           python-pip \
                           tree \
                           openssh-server \
                           sshfs \
                           net-tools \
                           tmux \
                           xclip \
                           axel


cp "../ubuntu/bashrc" "${HOME}/.bashrc"
sudo cp "../keyboard" "/etc/default/keyboard"
cp "../ubuntu/bash_aliases" "${HOME}/.bash_aliases"
cp "../gitconfig" "${HOME}/.gitconfig"
cp "../tmux.conf" "${HOME}/.tmux.conf"
cp -r "../cheatsheets/" "$HOME"

mkdir -p "${HOME}/.ssh/"
