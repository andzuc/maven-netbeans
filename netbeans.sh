#!/bin/bash

export XAUTH0="$(xauth nlist ${DISPLAY})"

docker run --rm -d --net=host \
       --env="DISPLAY" \
       --env="XAUTH0" \
       --name netbeans \
       andzuc/maven-netbeans
