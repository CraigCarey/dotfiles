#!/usr/bin/env bash

set -eu

readonly SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"
pushd "$SCRIPT_DIR" > /dev/null

source sudo_alias.sh

sudo apt-get update -y && sudo apt-get upgrade -y
sudo apt-get install -y \
  tmux \
  bash-completion \
  neofetch \
  htop \
  tree \
  tldr \
  xclip \
  cmus

tldr git

axel https://github.com/sharkdp/bat/releases/download/v0.17.1/bat_0.17.1_amd64.deb
sudo dpkg -i bat_0.17.1_amd64.deb

if [[ ! -d /home/craig/.tmux-themepack ]]; then
  git clone https://github.com/jimeh/tmux-themepack.git /home/craig/.tmux-themepack
fi

# Zsh
sudo apt-get install -y \
  zsh \
  fzf \
  fonts-powerline

if [[ ! -d /home/craig/.oh-my-zsh ]]; then
  git clone https://github.com/robbyrussell/oh-my-zsh.git /home/craig/.oh-my-zsh
fi

if [[ ! -d /home/craig/.zsh-syntax-highlighting ]]; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git /home/craig/.zsh-syntax-highlighting --depth 1
fi

sudo wget https://raw.githubusercontent.com/junegunn/fzf/master/shell/key-bindings.zsh -O /usr/share/doc/fzf/examples/key-bindings.zsh

chsh -s $(which zsh) craig

popd
