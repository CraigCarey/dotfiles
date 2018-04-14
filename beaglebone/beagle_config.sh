#!/bin/bash

sudo apt update
sudo apt -y upgrade

sudo apt --yes --force-yes install \
                           git \
                           build-essential \
                           tree \
                           sshfs \
                           tmux \
                           arp-scan \
                           nmap \
                           net-tools

set -x

cp bashrc ${HOME}/.bashrc
cp ../bash_aliases ${HOME}/.bash_aliases
cp ../gitconfig ${HOME}/.gitconfig
cp ../tmux.conf ${HOME}/.tmux.conf
sudo cp dhcpcd.conf /etc/
sudo cp interfaces /etc/network/
sudo cp wpa_supplicant.conf /etc/wpa_supplicant/

mkdir -p ${HOME}/.ssh/
cp ../ssh/authorized_keys ${HOME}/.ssh/
