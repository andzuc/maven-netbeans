#!/bin/bash

export XAUTH0="$(xauth nlist :0)"

docker run --rm -d --net=host \
       --env="DISPLAY" \
       --env="XAUTH0" \
       --name netbeans \
       andzuc/maven-netbeans
