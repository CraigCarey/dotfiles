#!/usr/bin/env bash

set -eux

# Aliasing sudo to nothing allows this script to run in docker without sudo installed
if [[ $EUID -eq 0 ]]; then
  shopt -s expand_aliases
  alias sudo=""
fi

sudo apt-get update
sudo apt-get install -y \
    git \
    build-essential \
    pkg-config \
    cmake \
    meson \
    gdb \
    gdbserver \
    valgrind
