#!/usr/bin/env bash

set -eux

# Aliasing sudo to nothing allows this script to run in docker without sudo installed
if [[ $EUID -eq 0 ]]; then
  shopt -s expand_aliases
  alias sudo=""
fi

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

axel https://github.com/sharkdp/bat/releases/tag/v0.17.1
sudo dpkg -i bat_0.17.1_amd64.deb

git clone https://github.com/jimeh/tmux-themepack.git /home/craig/.tmux-themepack

# Zsh
apt-get install -y \
    zsh \
    fzf \
    fonts-powerline
git clone https://github.com/robbyrussell/oh-my-zsh.git /home/craig/.oh-my-zsh; \
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git /home/craig/.zsh-syntax-highlightingb --depth 1; \
wget https://raw.githubusercontent.com/junegunn/fzf/master/shell/key-bindings.zsh \
-O /usr/share/doc/fzf/examples/key-bindings.zsh; \

