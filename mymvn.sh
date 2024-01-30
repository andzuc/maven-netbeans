#!/bin/bash

docker run --rm -it \
       --name mymvn \
       --entrypoint /bin/bash \
       -v maven_config:/home/netbeans/.m2 \
       -v "$(pwd)":/usr/src/mymaven \
       -w /usr/src/mymaven \
       "${MVN_IMAGE}" \
       -c "mvn $@"
