#!/usr/bin/env bash

set -eux

readonly SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"

pushd "$SCRIPT_DIR" > /dev/null

source sudo_alias.sh

sudo apt-get remove docker docker-engine docker.io containerd runc

set -e

sudo apt-get update -y && sudo apt-get upgrade -y
sudo apt-get install  -y \
  apt-transport-https \
  ca-certificates \
  curl \
  gnupg-agent \
  software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

apt_fingerprint=$(sudo apt-key fingerprint 0EBFCD88)
echo "$apt_fingerprint"

if [[ -z "$apt_fingerprint" ]]; then
  printf "ERROR: Fingerprint not recognised\n"
  exit 1;
fi

sudo add-apt-repository \
  "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) \
  stable"

sudo apt-get update -y
sudo apt-get install -y \
  docker-ce \
  docker-ce-cli \
  containerd.io

sudo usermod -aG docker "$USER"

# TODO: terminates script
# newgrp docker
# docker run hello-world

popd
