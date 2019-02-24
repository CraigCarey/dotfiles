#!/bin/bash

# For VM installs:
#    Install git, build-essential
#    Insert Guest additions CD
#    sudo ./VBoxLinuxAdditions.run
#    restart

set -eu

sudo pacman -Syu

sudo pacman -Sy \
            git \
            unzip \
            cmake \
            meld \
            valgrind \
            tree \
            bless \
            sshfs \
            net-tools \
            tmux \
            arandr \
            lxappearance \
            i3-wm \
            i3blocks \
            feh \
            rofi \
            compton \
            pavucontrol \
            pasystray \
            blueman \
            network-manager-applet \
            ttf-font-awesome \
            tldr

wget https://github.com/supermarin/YosemiteSanFranciscoFont/archive/master.zip
unzip master.zip
mv YosemiteSanFranciscoFont-master/*.ttf ~/.fonts/

if [[ $(sudo dmidecode -s system-product-name) =~ "VirtualBox" ]]; then
	sudo apt --yes --force-yes install virtualbox-guest-additions-iso
	sudo adduser "$USER" vboxusers
	sudo adduser "$USER" vboxsf
	mkdir "/home/${USER}/share/"
	sudo mount -t vboxsf -o uid=1000,gid=1000 vmshare "/home/${USER}/share/"
fi

readonly SUBL_DIR="/opt/sublime_text_3/"
if [[ ! -d "$SUBL_DIR" ]]; then
	wget "https://download.sublimetext.com/sublime_text_3_build_3176_x64.tar.bz2"
	tar vxjf "sublime_text_3_build_3176_x64.tar.bz2"
	sudo mv "sublime_text_3" "/opt/"
	sudo ln -s "${SUBL_DIR}sublime_text" "/usr/bin/sb"
fi

readonly PYCHARM_DIR="/opt/pycharm/"
if [[ ! -d "$PYCHARM_DIR" ]]; then
	readonly PYCHARM_DL="pycharm-community-2018.3.4.tar.gz"
	wget "https://download.jetbrains.com/python/${PYCHARM_DL}"
	sudo mkdir "$PYCHARM_DIR"
	sudo tar xzf "$PYCHARM_DL" -C "$PYCHARM_DIR" --strip-components=1
	sudo ln -s "${PYCHARM_DIR}bin/pycharm.sh" "/usr/bin/pycharm"
fi

readonly CLION_DIR="/opt/clion/"
if [[ ! -d "$CLION_DIR" ]]; then
	readonly CLION_DL="CLion-2018.3.4.tar.gz"
	wget "https://download.jetbrains.com/cpp/${CLION_DL}"
	sudo mkdir "$CLION_DIR"
	sudo tar xzf "$CLION_DL" -C "$CLION_DIR" --strip-components=1
	sudo ln -s "${CLION_DIR}bin/clion.sh" "/usr/bin/clion"
fi

if [[ $(sudo dmidecode -s system-product-name) != *"VirtualBox"* ]]; then
    git clone https://aur.archlinux.org/spotify.git
    pushd spotify > /dev/null
    gpg --recv-keys A87FF9DF48BF1C90
    makepkg -s
    sudo pacman -U --noconfirm spotify-*.tar.xz
fi

cp "bashrc" "${HOME}/.bashrc"
cp "bash_aliases" "${HOME}/.bash_aliases"
cp "../gitconfig" "${HOME}/.gitconfig"
cp "../tmux.conf" "${HOME}/.tmux.conf"
cp -r "../i3/" "${HOME}/.config/"
mkdir -p "${HOME}/.config/rofi" && cp "/usr/share/rofi/themes/Pop-Dark.rasi" "${HOME}/.config/rofi/config.rasi"
cp -r "../cheatsheets/" "$HOME"
