#!/bin/bash

export XAUTH0="$(xauth nlist ${DISPLAY})"

docker run --rm -it --net=host \
       --name runcmd.sh \
       --env="DISPLAY" \
       --env="XAUTH0" \
       --entrypoint /bin/bash \
       -v maven_config:/home/netbeans/.m2 \
       -v netbeans_config:/home/netbeans/.netbeans \
       -v "${HOME}/dev:/home/netbeans/dev" \
       "${MVN_IMAGE}" \
       -c "$*"
