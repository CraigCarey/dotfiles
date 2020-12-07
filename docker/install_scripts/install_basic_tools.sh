#!/usr/bin/env bash

set -eu

readonly SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"

pushd "$SCRIPT_DIR" > /dev/null

source sudo_alias.sh

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

popd
