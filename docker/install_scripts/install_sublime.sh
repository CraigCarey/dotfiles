#!/usr/bin/env bash

set -eu

readonly SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"
pushd "$SCRIPT_DIR" > /dev/null

source sudo_alias.sh

readonly SUBL_DIR="/opt/sublime_text_3/"
if [[ ! -d "$SUBL_DIR" ]]; then
  axel "https://download.sublimetext.com/sublime_text_3_build_3211_x64.tar.bz2"
  tar vxjf sublime_text_3*.tar.bz2
  sudo mv "sublime_text_3" "/opt/"
  sudo ln -s "${SUBL_DIR}sublime_text" "/usr/bin/sb"
fi

popd
