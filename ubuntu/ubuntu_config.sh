#!/bin/bash

# Insert Guest additions CD
# sudo ./VBoxLinuxAdditions.run
# restart

sudo apt update
sudo apt -y dist-upgrade

sudo apt --yes --force-yes install \
                           git \
                           build-essential \
                           python3.5 \
                           python3-venv \
                           python-pip \
                           i3 \
                           i3lock \
                           scrot \
                           imagemagick \
                           tree \
                           meld \
                           bless \
                           feh \
                           sshfs \
                           openssh-server \
                           net-tools \
                           tmux

if [[ $(sudo dmidecode -s system-product-name) =~ "VirtualBox" ]]; then
	sudo apt --yes --force-yes install virtualbox-guest-additions-iso
	sudo adduser "$USER" vboxusers
	sudo adduser "$USER" vboxsf
	mkdir "/home/${USER}/share/"
	sudo mount -t vboxsf -o uid=1000,gid=1000 vmshare "/home/${USER}/share/"
fi

readonly SUBL_DIR="/opt/sublime_text_3/"
if [[ ! -d "$SUBL_DIR" ]]; then
	wget "https://download.sublimetext.com/sublime_text_3_build_3143_x64.tar.bz2"
	tar vxjf "sublime_text_3_build_3143_x64.tar.bz2"
	sudo mv "sublime_text_3" "/opt/"
	sudo ln -s "${SUBL_DIR}sublime_text" "/usr/bin/sb"
fi

readonly PYCHARM_DIR="/opt/pycharm/"
if [[ ! -d "$PYCHARM_DIR" ]]; then
	readonly PYCHARM_DL="pycharm-professional-2017.2.4.tar.gz"
	wget "https://download.jetbrains.com/python/${PYCHARM_DL}"
	sudo mkdir "$PYCHARM_DIR"
	sudo tar -xzf "$PYCHARM_DL" -C "$PYCHARM_DIR" --strip-components=1
	sudo ln -s "${PYCHARM_DIR}bin/pycharm.sh" "/usr/bin/pycharm"
fi

readonly WEBSTORM_DIR="/opt/webstorm/"
if [[ ! -d "$WEBSTORM_DIR" ]]; then
	readonly WEBSTORM_DL="WebStorm-2017.2.5.tar.gz"
	wget "https://download.jetbrains.com/webstorm/${WEBSTORM_DL}"
	sudo mkdir "$WEBSTORM_DIR"
	sudo tar -xzf "$WEBSTORM_DL" -C "$WEBSTORM_DIR" --strip-components=1
	sudo ln -s "${WEBSTORM_DIR}bin/webstorm.sh" "/usr/bin/webstorm"
fi

readonly CLION_DIR="/opt/clion/"
if [[ ! -d "$CLION_DIR" ]]; then
	readonly CLION_DL="CLion-2017.3.1.tar.gz"
	wget "https://download.jetbrains.com/cpp/${CLION_DL}"
	sudo mkdir "$CLION_DIR"
	sudo tar -xzf "$CLION_DL" -C "$CLION_DIR" --strip-components=1
	sudo ln -s "${CLION_DIR}bin/clion.sh" "/usr/bin/clion"
fi

if [[ $(sudo dmidecode -s system-product-name) != *"VirtualBox"* ]]; then
	sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0DF731E45CE24F27EEEB1450EFDC8610341D9410
	echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
	sudo apt-get update
	sudo apt-get install spotify-client
fi

cp "bashrc" "${HOME}/.bashrc"
sudo cp "../hosts" "/etc/hosts"
cp "../bash_aliases" "${HOME}/.bash_aliases"
cp "../gitconfig" "${HOME}/.gitconfig"
cp "../tmux.conf" "${HOME}/.tmux.conf"
cp -r "../i3/" "${HOME}/.config/"
cp "../elcapitan2hr.jpg" "${HOME}/.config/i3/"
sudo ln -s "${HOME}/.config/i3/lockscreen.sh" "/usr/bin/lockscreen"

mkdir -p "${HOME}/.ssh/"
cp "../ssh/authorized_keys" "${HOME}/.ssh/" 

rm -rf "${HOME}/Documents" "${HOME}/Music" "${HOME}/examples.desktop" "${HOME}/Pictures" \
       "${HOME}/Public" "${HOME}/Templates" "${HOME}/Videos" "${HOME}/Firefox_wallpaper.png"

# remap § key to #
xmodmap -e "keycode 49 = numbersign"
