#!/usr/bin/env bash

# For VM installs:
#    Install git, build-essential
#    Insert Guest additions CD
#    sudo ./VBoxLinuxAdditions.run
#    restart

set -eu

readonly SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"
pushd "$SCRIPT_DIR" > /dev/null

source sudo_alias.sh

sudo apt-get update -y && sudo apt-get upgrade -y
if [[ $(sudo dmidecode -s system-product-name) =~ "VirtualBox" ]]; then
  sudo apt-get install -y virtualbox-guest-additions-iso
  sudo adduser "$USER" vboxusers
  sudo adduser "$USER" vboxsf
  mkdir "/home/${USER}/share/"
  sudo mount -t vboxsf -o uid=1000,gid=1000 vmshare "/home/${USER}/share/"
fi
