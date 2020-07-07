#!/usr/bin/env bash

set -eu

readonly SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"

pushd "$SCRIPT_DIR" > /dev/null

# For VM installs:
#    Install git, build-essential
#    Insert Guest additions CD
#    sudo ./VBoxLinuxAdditions.run
#    restart

sudo apt update && sudo apt -y upgrade

sudo apt --yes --force-yes install \
                           git \
                           build-essential \
                           cmake \
                           meld \
                           valgrind \
                           tree \
                           bless \
                           openssh-server \
                           sshfs \
                           net-tools \
                           tmux \
                           arandr \
                           xbacklight \
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
                           blueman \
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

if [[ ! -d /opt/piavpn/ ]]; then
  readonly PIA_DL="pia-linux-2.1-04977.run"
  axel "https://installers.privateinternetaccess.com/download/$PIA_DL"
  bash "$PIA_DL"
  sudo ln -s  /opt/piavpn/bin/pia-client /usr/local/bin/pia-client
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

if [[ $(sudo dmidecode -s system-product-name) =~ "VirtualBox" ]]; then
	sudo apt --yes --force-yes install virtualbox-guest-additions-iso
	sudo adduser "$USER" vboxusers
	sudo adduser "$USER" vboxsf
	mkdir "/home/${USER}/share/"
	sudo mount -t vboxsf -o uid=1000,gid=1000 vmshare "/home/${USER}/share/"
fi

readonly SUBL_DIR="/opt/sublime_text_3/"
if [[ ! -d "$SUBL_DIR" ]]; then
	axel "https://download.sublimetext.com/sublime_text_3_build_3211_x64.tar.bz2"
	tar vxjf sublime_text_3*.tar.bz2
	sudo mv "sublime_text_3" "/opt/"
	sudo ln -s "${SUBL_DIR}sublime_text" "/usr/bin/sb"
fi

readonly PYCHARM_DIR="/opt/pycharm/"
if [[ ! -d "$PYCHARM_DIR" ]]; then
	readonly PYCHARM_DL="pycharm-community-2020.1.2.tar.gz"
	axel "https://download-cf.jetbrains.com/python/${PYCHARM_DL}"
	sudo mkdir "$PYCHARM_DIR"
	sudo tar -xzf "$PYCHARM_DL" -C "$PYCHARM_DIR" --strip-components=1
	sudo ln -s "${PYCHARM_DIR}bin/pycharm.sh" "/usr/bin/pycharm"
fi

readonly CLION_DIR="/opt/clion/"
if [[ ! -d "$CLION_DIR" ]]; then
	readonly CLION_DL="CLion-2020.1.2.tar.gz"
	axel "https://download-cf.jetbrains.com/cpp/${CLION_DL}"
	sudo mkdir "$CLION_DIR"
	sudo tar -xzf "$CLION_DL" -C "$CLION_DIR" --strip-components=1
	sudo ln -s "${CLION_DIR}bin/clion.sh" "/usr/bin/clion"
fi

if [[ $(sudo dmidecode -s system-product-name) != *"VirtualBox"* ]]; then
	curl -sS https://download.spotify.com/debian/pubkey.gpg | sudo apt-key add -
	echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
	sudo apt-get update && sudo apt-get install spotify-client
fi

if [[ ! -d playerctl-2.1.1_amd64.deb ]]; then
  axel https://github.com/altdesktop/playerctl/releases/download/v2.1.1/playerctl-2.1.1_amd64.deb
  sudo dpkg -i playerctl-2.1.1_amd64.deb
fi

pushd "$SCRIPT_DIR" > /dev/null

ln -sf "${HOME}/Downloads" "${HOME}/dl"
mkdir -p "${HOME}/workspace"
rm -rf "${HOME}/Documents" "${HOME}/Music" "${HOME}/examples.desktop" \
       "${HOME}/Public" "${HOME}/Templates" "${HOME}/Videos" "${HOME}/Firefox_wallpaper.png"

./restore_configs.sh

#sudo apt autoremove -y # appears to break CUDA driver installation?
