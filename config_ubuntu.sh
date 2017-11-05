#!/bin/bash

# Insert Guest additions CD
# sudo ./VBoxLinuxAdditions.run
# restart

sudo apt update
sudo apt -y dist-upgrade

sudo apt --yes --force-yes install \
                           git \
                           build-essential \
                           radare2 \
                           python3.6 \
                           python3-venv \
                           python-pip \
                           i3 \
                           tree \
                           chromium-browser \
                           meld \
                           bless \
                           feh \
                           sshfs \
                           ntpdate

readonly HOME_DIR="/home/${USER}/"

if [[ $(sudo dmidecode -s system-product-name) =~ "VirtualBox" ]]; then
	sudo apt --yes --force-yes install virtualbox-guest-additions-iso
	sudo adduser "$USER" vboxusers
	sudo adduser "$USER" vboxsf
	mkdir "/home/${USER}/share/"
	sudo mount -t vboxsf -o uid=1000,gid=1000 vmshare "/home/${USER}/share/"
fi

readonly SUBL_DIR="/opt/sublime_text_3/"
if [ ! -d "$SUBL_DIR" ]; then
	wget "https://download.sublimetext.com/sublime_text_3_build_3143_x64.tar.bz2"
	tar vxjf "sublime_text_3_build_3143_x64.tar.bz2"
	sudo mv "sublime_text_3" "/opt/"
	sudo ln -s "${SUBL_DIR}sublime_text" "/usr/bin/sb"
fi

readonly PYCHARM_DIR="/opt/pycharm/"
if [ ! -d "$PYCHARM_DIR" ]; then
	readonly PYCHARM_DL="pycharm-professional-2017.2.4.tar.gz"
	wget "https://download.jetbrains.com/python/${PYCHARM_DL}"
	sudo mkdir "$PYCHARM_DIR"
	sudo tar -xzf "$PYCHARM_DL" -C "$PYCHARM_DIR" --strip-components=1
	sudo ln -s "${PYCHARM_DIR}bin/pycharm.sh" "/usr/bin/pycharm"
fi

readonly WEBSTORM_DIR="/opt/webstorm/"
if [ ! -d "$WEBSTORM_DIR" ]; then
	readonly WEBSTORM_DL="WebStorm-2017.2.5.tar.gz"
	wget "https://download.jetbrains.com/webstorm/${WEBSTORM_DL}"
	sudo mkdir "$WEBSTORM_DIR"
	sudo tar -xzf "$WEBSTORM_DL" -C "$WEBSTORM_DIR" --strip-components=1
	sudo ln -s "${WEBSTORM_DIR}bin/webstorm.sh" "/usr/bin/webstorm"
fi

cp "ubuntu_bashrc" "${HOME_DIR}.bashrc"
cp "bash_aliases" "${HOME_DIR}.bash_aliases"
cp "gitconfig" "${HOME_DIR}.gitconfig"
cp "elcapitan2hr.jpg" "$HOME_DIR"

feh --bg-scale "${HOME_DIR}elcapitan2hr.jpg"

rm -rf "${HOME_DIR}Documents" "${HOME_DIR}Music" "${HOME_DIR}examples.desktop" "${HOME_DIR}Pictures" \
       "${HOME_DIR}Public" "${HOME_DIR}Templates" "${HOME_DIR}Videos" "${HOME_DIR}Firefox_wallpaper.png"

# remap § key to #
xmodmap -e "keycode 49 = numbersign"

# update time
sudo ntpdate time.nist.gov
