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
                           fonts-powerline

if [[ ! -d ~/.oh-my-zsh ]]; then
  git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$HOME/.zsh-syntax-highlighting" --depth 1
  chsh -s $(which zsh)
fi

if [[ ! -d ~/.tmux-themepack ]]; then
  git clone https://github.com/jimeh/tmux-themepack.git ~/.tmux-themepack
fi

if [[ ! -d /opt/piavpn/ ]]; then
  readonly PIA_DL="pia-linux-1.7-03949.run"
  axel "https://installers.privateinternetaccess.com/download/$PIA_DL"
  bash "$PIA_DL"
  sudo ln -s  /opt/piavpn/bin/pia-client /usr/local/bin/pia-client
fi

if [[ ! -f fontawesome-free-5.0.13.zip ]]; then
  mkdir -p ~/.fonts
  axel https://github.com/FortAwesome/Font-Awesome/releases/download/5.0.13/fontawesome-free-5.0.13.zip
  unzip -o fontawesome-free-5.0.13.zip
  cp fontawesome-free-5.0.13/use-on-desktop/*.otf ~/.fonts/
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
	readonly PYCHARM_DL="pycharm-community-2019.3.1.tar.gz"
	axel "https://download-cf.jetbrains.com/python/${PYCHARM_DL}"
	sudo mkdir "$PYCHARM_DIR"
	sudo tar -xzf "$PYCHARM_DL" -C "$PYCHARM_DIR" --strip-components=1
	sudo ln -s "${PYCHARM_DIR}bin/pycharm.sh" "/usr/bin/pycharm"
fi

readonly CLION_DIR="/opt/clion/"
if [[ ! -d "$CLION_DIR" ]]; then
	readonly CLION_DL="CLion-2019.3.2.tar.gz"
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

cp ".bashrc" "${HOME}"
cp ".zshrc" "${HOME}"
sudo cp "../keyboard" "/etc/default/"
cp ".bash_aliases" "${HOME}"
cp "../.gitconfig" "${HOME}"
cp "../.tmux.conf" "${HOME}"
cp -r "i3/" "${HOME}/.config/"
cp "gtk/.gtkrc-2.0" "${HOME}/"
cp "gtk/settings.ini" "${HOME}/.config/gtk-3.0/"
mkdir -p "${HOME}/.config/rofi" && cp "/usr/share/rofi/themes/Pop-Dark.rasi" "${HOME}/.config/rofi/config.rasi"
cp "../elcapitan2hr.jpg" "${HOME}/Pictures/wallpaper.jpg"
cp -r "../cheatsheets/" "$HOME"

mkdir -p "${HOME}/.ssh/"
cp "../ssh/authorized_keys" "${HOME}/.ssh/"

rm -rf "${HOME}/Documents" "${HOME}/Music" "${HOME}/examples.desktop" \
       "${HOME}/Public" "${HOME}/Templates" "${HOME}/Videos" "${HOME}/Firefox_wallpaper.png"

sudo apt autoremove -y
