#!/bin/bash

set -eux

readonly WORKING_DIR=$(dirname $(readlink -f "$0"))

pushd $WORKING_DIR > /dev/null

./xmrig -c aeon_config.json

popd > /dev/null
