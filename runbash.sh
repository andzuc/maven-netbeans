#!/bin/bash

docker run --rm -it --net=host\
       --env="DISPLAY" \
       --mount "type=bind,src=/tmp/.X11-unix/X0,dst=/tmp/.X11-unix/X0" \
       --entrypoint /bin/bash \
       andzuc/alpine-netbeans
