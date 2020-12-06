#!/usr/bin/env bash

set -eu

readonly SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"

pushd "$SCRIPT_DIR" > /dev/null

source sudo_alias.sh

# TODO: enable in docker only
#TZ="Europe/Belfast"
#ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

sudo apt-get update -y
sudo apt-get install -y \
    sudo \
    lsb-release \
    openssh-server \
    sshpass \
    sshfs \
    axel \
    curl \
    wget \
    rsync \
    nano \
    libssl-dev \
    net-tools \
    iputils-ping \
    ca-certificates \
    x11-xserver-utils \
    locales

# TODO: enable in docker only
#sed -i '/en_GB.UTF-8/s/^# //g' /etc/locale.gen && locale-gen

popd
