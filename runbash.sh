#!/bin/bash

export XAUTH0="$(xauth nlist :0)"

docker run --rm -it --net=host \
       --env="DISPLAY" \
       --env="XAUTH0" \
       --entrypoint /bin/bash \
       andzuc/maven-netbeans \
       -c "$*"
