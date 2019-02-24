#!/bin/bash

# For VM installs:
#    Install git, build-essential
#    Insert Guest additions CD
#    sudo ./VBoxLinuxAdditions.run
#    restart

sudo apt update && apt -y upgrade

sudo apt --yes --force-yes install \
                           git \
                           build-essential \
                           cmake \
                           meld \
                           valgrind \
                           python3.5 \
                           python3-venv \
                           python-pip \
                           tree \
                           bless \
                           openssh-server \
                           sshfs \
                           net-tools \
                           tmux \
                           arandr \
                           lxappearance \
                           arc-theme \
                           breeze-icon-theme \
                           i3 \
                           i3blocks \
                           feh \
                           rofi \
                           compton \
                           pavucontrol \
                           pasystray \
                           blueman

mkdir -p ~/.fonts

wget https://github.com/FortAwesome/Font-Awesome/releases/download/5.0.13/fontawesome-free-5.0.13.zip
unzip fontawesome-free-5.0.13.zip
cp fontawesome-free-5.0.13/use-on-desktop/*.otf ~/.fonts/

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
	sudo tar -xzf "$PYCHARM_DL" -C "$PYCHARM_DIR" --strip-components=1
	sudo ln -s "${PYCHARM_DIR}bin/pycharm.sh" "/usr/bin/pycharm"
fi

readonly CLION_DIR="/opt/clion/"
if [[ ! -d "$CLION_DIR" ]]; then
	readonly CLION_DL="CLion-2018.3.4.tar.gz"
	wget "https://download.jetbrains.com/cpp/${CLION_DL}"
	sudo mkdir "$CLION_DIR"
	sudo tar -xzf "$CLION_DL" -C "$CLION_DIR" --strip-components=1
	sudo ln -s "${CLION_DIR}bin/clion.sh" "/usr/bin/clion"
fi

if [[ $(sudo dmidecode -s system-product-name) != *"VirtualBox"* ]]; then
	sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 931FF8E79F0876134EDDBDCCA87FF9DF48BF1C90
	echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
	sudo apt-get update
	sudo apt-get install spotify-client
fi

cp "bashrc" "${HOME}/.bashrc"
sudo cp "../keyboard" "/etc/default/keyboard"
cp "bash_aliases" "${HOME}/.bash_aliases"
cp "../gitconfig" "${HOME}/.gitconfig"
cp "../tmux.conf" "${HOME}/.tmux.conf"
cp -r "i3/" "${HOME}/.config/"
cp "gtk/gtkrc-2.0" "${HOME}/.gtkrc-2.0"
cp "gtk/settings.ini" "${HOME}/.config/gtk-3.0/"
mkdir -p "${HOME}/.config/rofi" && cp "/usr/share/rofi/themes/Pop-Dark.rasi" "${HOME}/.config/rofi/config.rasi"
cp "../elcapitan2hr.jpg" "${HOME}/Pictures/wallpaper.jpg"
cp -r "../cheatsheets/" "$HOME"

mkdir -p "${HOME}/.ssh/"
cp "../ssh/authorized_keys" "${HOME}/.ssh/" 

rm -rf "${HOME}/Documents" "${HOME}/Music" "${HOME}/examples.desktop" \
       "${HOME}/Public" "${HOME}/Templates" "${HOME}/Videos" "${HOME}/Firefox_wallpaper.png"
