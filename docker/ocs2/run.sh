#!/bin/bash
xhost +

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PARENT_DIR="$(dirname "$SCRIPT_DIR")"
docker run -it --rm --net host \
    --privileged \
    -v /dev:/dev \
    -v "$PARENT_DIR:/root/kuavo_ws" \
    -v "${HOME}/.config/lejuconfig:/root/.config/lejuconfig" \
    --group-add=dialout \
    --ulimit rtprio=99 \
    --cap-add=sys_nice \
    -e DISPLAY=$DISPLAY \
    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    kuavo_mpc_wbc_img:0.2 \
    zsh
