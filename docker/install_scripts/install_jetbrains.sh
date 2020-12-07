#!/usr/bin/env bash

set -eu

readonly SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"

pushd "$SCRIPT_DIR" > /dev/null

source sudo_alias.sh

readonly JB_VERSION="2020.3"

readonly PYCHARM_VERSION=$JB_VERSION
readonly PYCHARM_DIR="/opt/pycharm-${PYCHARM_VERSION}"
if [[ ! -d "$PYCHARM_DIR" ]]; then
  sudo rm -rf "/opt/pycharm*"
  readonly PYCHARM_DL="pycharm-professional-${PYCHARM_VERSION}.tar.gz"
  axel "https://download-cf.jetbrains.com/python/${PYCHARM_DL}"
  sudo mkdir "$PYCHARM_DIR"
  sudo tar -xzf "$PYCHARM_DL" -C "$PYCHARM_DIR" --strip-components=1
  sudo ln -sf "${PYCHARM_DIR}" "/opt/pycharm"
  sudo ln -sf "/opt/pycharm/bin/pycharm.sh" "/usr/local/bin/pycharm"
fi

readonly CLION_VERSION=$JB_VERSION
readonly CLION_DIR="/opt/clion-${CLION_VERSION}"
if [[ ! -d "$CLION_DIR" ]]; then
  sudo rm -rf "/opt/clion*"
  readonly CLION_DL="CLion-${CLION_VERSION}.tar.gz"
  axel "https://download-cf.jetbrains.com/cpp/${CLION_DL}"
  sudo mkdir "$CLION_DIR"
  sudo tar -xzf "$CLION_DL" -C "$CLION_DIR" --strip-components=1
  sudo ln -sf "${CLION_DIR}" "/opt/clion"
  sudo ln -sf "/opt/clion/bin/clion.sh" "/usr/local/bin/clion"
fi

popd
