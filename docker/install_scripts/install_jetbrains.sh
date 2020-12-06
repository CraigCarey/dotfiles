#!/usr/bin/env bash

set -eu

readonly SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"

pushd "$SCRIPT_DIR" > /dev/null

source sudo_alias.sh

readonly PYCHARM_DIR="/opt/pycharm/"
if [[ ! -d "$PYCHARM_DIR" ]]; then
  readonly PYCHARM_DL="pycharm-professional-2020.2.3.tar.gz"
  axel "https://download-cf.jetbrains.com/python/${PYCHARM_DL}"
  sudo mkdir "$PYCHARM_DIR"
  sudo tar -xzf "$PYCHARM_DL" -C "$PYCHARM_DIR" --strip-components=1
  sudo ln -s "${PYCHARM_DIR}bin/pycharm.sh" "/usr/bin/pycharm"
fi

readonly CLION_DIR="/opt/clion/"
if [[ ! -d "$CLION_DIR" ]]; then
  readonly CLION_DL="CLion-2020.2.5.tar.gz"
  axel "https://download-cf.jetbrains.com/cpp/${CLION_DL}"
  sudo mkdir "$CLION_DIR"
  sudo tar -xzf "$CLION_DL" -C "$CLION_DIR" --strip-components=1
  sudo ln -s "${CLION_DIR}bin/clion.sh" "/usr/bin/clion"
fi

popd
