#!/usr/bin/bash
SH=$(cd `dirname "$BASH_SOURCE"` && pwd)  # SH aka SCRIPT_HOME

source "$SH/.config.sh"
    docker stop -t1 $CONTAINER_NAME && docker rm -f $CONTAINER_NAME
    #      .        .                  .      .     .
