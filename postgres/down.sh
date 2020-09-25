#!/usr/bin/env bash
SH=$(cd `dirname $BASH_SOURCE` && pwd)
source "$SH/.config.sh"
    if [ -z $CONTAINER_NAME ]; then echo 'Variable CONTAINER_NAME is required'; exit 1; fi
        # delete container
        docker stop -t1 $CONTAINER_NAME
        docker rm   -f  $CONTAINER_NAME

        # delete volume
        docker volume rm "v_$CONTAINER_NAME"
