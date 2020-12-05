#!/usr/bin/env bash

set -eux

# Aliasing sudo to nothing allows this script to run in docker without sudo installed
if [[ $EUID -eq 0 ]]; then
  shopt -s expand_aliases
  alias sudo=""
fi

TZ="Europe/Belfast"
ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

sudo apt-get update
sudo apt-get install -y \
    sudo \
    lsb-release \
    openssh-server \
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

sed -i '/en_GB.UTF-8/s/^# //g' /etc/locale.gen && locale-gen
