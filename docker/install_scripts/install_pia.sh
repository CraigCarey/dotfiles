#!/usr/bin/env bash

set -eu

readonly SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"

pushd "$SCRIPT_DIR" > /dev/null

readonly PIA_DL="pia-linux-2.6-05820.run"
axel "https://installers.privateinternetaccess.com/download/$PIA_DL"
bash "$PIA_DL"
sudo ln -sf /opt/piavpn/bin/pia-client /usr/local/bin/pia-client

popd
