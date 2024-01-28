#!/bin/sh
touch "${HOME}/.Xauthority"
# merge X11 cookie to Xauthority
echo "$XAUTH0"|xauth nmerge -
exec "$@"
