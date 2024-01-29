#!/bin/bash

export XAUTH0="$(xauth nlist :0)"

docker run --rm -it --net=host \
       --env="DISPLAY" \
       --env="XAUTH0" \
       andzuc/maven-netbeans \
       /bin/bash
