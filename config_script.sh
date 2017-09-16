#!/bin/bash

sudo apt update
sudo apt -y dist-upgrade

sudo apt --yes --force-yes install \
							git \
							build-essential \
							radare2 \
							python3.6 \
							i3 \
							tree \
							chromium-browser \
							meld \
							bless \
							feh

readonly HOME_DIR="/home/${USER}/"

if [[ $(sudo dmidecode -s system-product-name) =~ "VirtualBox" ]]; then
	sudo apt --yes --force-yes install virtualbox-guest-additions-iso
	sudo adduser "$USER" vboxusers
fi

readonly SUBL_DIR="/usr/bin/sublime_text_3/"
if [ ! -d "$SUBL_DIR" ]; then
	wget "https://download.sublimetext.com/sublime_text_3_build_3126_x64.tar.bz2"
	sudo tar -xf "sublime_text_3_build_3126_x64.tar.bz2" -C "/usr/bin/"
	sudo ln -s "${SUBL_DIR}sublime_text" "/usr/bin/sb"
fi

cp "bashrc" "${HOME_DIR}.bashrc"
cp "bash_aliases" "${HOME_DIR}.bash_aliases"
cp "gitconfig" "${HOME_DIR}.gitconfig"

feh --bg-scale "elcapitan2hr.jpg"

rm -rf "${HOME_DIR}Documents" "${HOME_DIR}Music" "${HOME_DIR}examples.desktop" "${HOME_DIR}Pictures" \
       "${HOME_DIR}Public" "${HOME_DIR}Templates" "${HOME_DIR}Videos" "${HOME_DIR}Firefox_wallpaper.png"
