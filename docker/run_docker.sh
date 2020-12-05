#!/usr/bin/env bash

docker run --rm -it \
    --privileged \
    --env DISPLAY=$DISPLAY \
    -v ~/.Xauthority:/root/.Xauthority \
    -e DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v $HOME/:/home/craig/ \
    --user craig \
    base \
    /usr/bin/zsh
