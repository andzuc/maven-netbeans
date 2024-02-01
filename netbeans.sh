#!/bin/bash

export XAUTH0="$(xauth nlist ${DISPLAY})"

docker run --rm -d \
       --name netbeans \
       --env="DISPLAY" \
       --env="XAUTH0" \
       -v "/tmp/.X11-unix/X0:/tmp/.X11-unix/X0" \
       -v maven_config:/home/netbeans/.m2 \
       -v netbeans_config:/home/netbeans/.netbeans \
       -v "${HOME}/dev:/home/netbeans/dev" \
       "${MVN_IMAGE}"
