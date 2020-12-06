#!/usr/bin/env bash

set -eu

readonly SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"
pushd "$SCRIPT_DIR" > /dev/null

sudo apt-get update -y && sudo apt-get -y upgrade

sudo apt-get install -y \
  openssh-server \
  sshpass \
  sshfs \
  xbacklight \
  lxappearance \
  chromium-browser

bash install_scripts/install_basic_tools.sh
bash install_scripts/install_term_tools.sh
bash install_scripts/install_programming_tools.sh
bash install_scripts/install_docker.sh
bash install_scripts/install_pia.sh
bash install_scripts/install_sublime.sh
bash install_scripts/install_jetbrains.sh
bash install_scripts/install_regolith.sh

ln -sf "${HOME}/Downloads" "${HOME}/dl"
mkdir -p "${HOME}/workspace"
rm -rf "${HOME}/Documents" "${HOME}/Music" "${HOME}/examples.desktop" \
  "${HOME}/Public" "${HOME}/Templates" "${HOME}/Videos" \
  "${HOME}/Firefox_wallpaper.png"

sudo bash -c "cat hosts.append >> /etc/hosts"

./restore_configs.sh

setxkbmap -option ctrl:nocaps

# Appears to break CUDA driver installation?
sudo apt autoremove -y

popd
