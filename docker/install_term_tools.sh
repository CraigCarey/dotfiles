#!/usr/bin/env bash

set -eux

sudo apt-get update
sudo apt-get install -y \
    tmux \
    bash-completion \
    neofetch \
    htop \
    tree \
    tldr \
    xclip

tldr git

axel https://github.com/sharkdp/bat/releases/download/v0.17.1/bat_0.17.1_amd64.deb
sudo dpkg -i bat_0.17.1_amd64.deb

git clone https://github.com/jimeh/tmux-themepack.git /home/craig/.tmux-themepack

# Zsh
apt-get install -y \
    zsh \
    fzf \
    fonts-powerline
git clone https://github.com/robbyrussell/oh-my-zsh.git /home/craig/.oh-my-zsh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git /home/craig/.zsh-syntax-highlighting --depth 1
wget https://raw.githubusercontent.com/junegunn/fzf/master/shell/key-bindings.zsh -O /usr/share/doc/fzf/examples/key-bindings.zsh
sudo sed -i '/en_GB.UTF-8/s/^# //g' /etc/locale.gen && sudo locale-gen
