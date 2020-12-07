#!/usr/bin/env bash

set -eu

sudo add-apt-repository ppa:regolith-linux/release -y
sudo apt-get update -y && sudo apt-get upgrade -y
sudo apt-get install -y \
  regolith-desktop-standard \
  i3xrocks \
  i3xrocks-battery \
  i3xrocks-bluetooth \
  i3xrocks-cpu \
  i3xrocks-focused \
  i3xrocks-memory \
  i3xrocks-temp \
  i3xrocks-time \
  i3xrocks-volume \
  i3xrocks-wifi \
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
