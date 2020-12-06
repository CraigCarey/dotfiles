#!/usr/bin/env bash

set -eu

sudo add-apt-repository ppa:regolith-linux/release -y
sudo apt-get update -y && sudo apt-get upgrade -y
sudo apt-get install -y \
  regolith-desktop-complete \
  i3xrocks \
  regolith-look-ayu \
  regolith-look-ayu-dark \
  regolith-look-ayu-mirage \
  regolith-look-cahuella \
  regolith-look-dracula \
  regolith-look-gruvbox \
  regolith-look-lascaille \
  regolith-look-nord \
  regolith-look-pop-os \
  regolith-look-solarized-dark \
  regolith-look-ubuntu


#regolith-look set solarized-dark
#regolith-look refresh
