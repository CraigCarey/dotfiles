# Aliasing sudo to nothing allows this script to run in docker without sudo installed
if [[ $EUID -eq 0 ]]; then
  shopt -s expand_aliases
  alias sudo=""
fi
