#!/bin/bash

sudo apt update
sudo apt -y dist-upgrade

sudo apt --yes --force-yes install \
                           git \
                           build-essential \
                           tree \
                           sshfs \
                           tmux

readonly HOME_DIR="/home/${USER}/"

cp "bashrc" "${HOME_DIR}.bashrc"
cp "../bash_aliases" "${HOME_DIR}.bash_aliases"
cp "../gitconfig" "${HOME_DIR}.gitconfig"
cp "../tmux.conf" "${HOME_DIR}.tmux.conf"

mkdir -p "${HOME_DIR}.ssh/"
cp "../ssh/authorized_keys" "${HOME_DIR}.ssh/" 

sudo touch "/boot/ssh"
