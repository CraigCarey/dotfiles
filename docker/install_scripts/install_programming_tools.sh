#!/usr/bin/env bash

set -eu

readonly SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"

pushd "$SCRIPT_DIR" > /dev/null

source sudo_alias.sh

sudo apt-get update -y && sudo apt-get upgrade -y
sudo apt-get install -y \
  git \
  build-essential \
  pkg-config \
  cmake \
  meson \
  gdb \
  gdbserver \
  valgrind

popd
