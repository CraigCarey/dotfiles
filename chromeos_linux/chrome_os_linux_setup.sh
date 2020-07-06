#!/usr/bin/env bash

set -eu

readonly SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"

pushd "$SCRIPT_DIR" > /dev/null


sudo apt update && sudo apt -y upgrade

sudo apt --yes --force-yes install \
                           git \
                           build-essential \
                           cmake \
                           tree \
                           openssh-server \
                           sshfs \
                           net-tools \
                           tmux \
                           xclip \
                           axel \
                           curl \
                           zsh \
                           tldr \
                           htop \
                           powerline \
                           fonts-powerline \
                           neofetch

if [[ ! -d ~/.oh-my-zsh ]]; then
  git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$HOME/.zsh-syntax-highlighting" --depth 1
  chsh -s $(which zsh)
fi

if [[ ! -d ~/.tmux-themepack ]]; then
  git clone https://github.com/jimeh/tmux-themepack.git ~/.tmux-themepack
fi

readonly FA_VERSION="5.12.1"
if [[ ! -f fontawesome-free-${FA_VERSION}-desktop.zip ]]; then
  mkdir -p ~/.fonts
  axel https://github.com/FortAwesome/Font-Awesome/releases/download/${FA_VERSION}/fontawesome-free-${FA_VERSION}-desktop.zip
  unzip -o fontawesome-free-${FA_VERSION}-desktop.zip
  cp fontawesome-free-${FA_VERSION}-desktop/otfs/*.otf ~/.fonts/
  axel https://github.com/supermarin/YosemiteSanFranciscoFont/archive/master.zip
  unzip -o YosemiteSanFranciscoFont-master.zip
  mv YosemiteSanFranciscoFont-master/*.ttf ~/.fonts/
fi

ln -sf "${HOME}/Downloads" "${HOME}/dl"
mkdir -p "${HOME}/workspace"
rm -rf "${HOME}/Documents" "${HOME}/Music" "${HOME}/examples.desktop" \
       "${HOME}/Public" "${HOME}/Templates" "${HOME}/Videos" "${HOME}/Firefox_wallpaper.png"

./restore_configs.sh

sudo apt autoremove -y
