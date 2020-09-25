#!/usr/bin/env bash
docstring='
$ (cd /path/to/this/folder; ./down.sh; ./up.sh )
'


SH=$(cd `dirname $BASH_SOURCE` && pwd)
source "$SH/.config.sh"
    if [ -z $CONTAINER_NAME ]; then echo 'Variable CONTAINER_NAME is required'; exit 1; fi
    if [ -z $PORT ];  then echo 'Variable PORT is required'; exit 1; fi

    set -e  # halt if error ON
        # run the container
        #TODO make variables in .config.sh effective in docker-compose
        docker-compose -f "$SH/docker-compose.yml"  --env-file "$SH/.config.sh"  up  -d  --force-recreate  # ref. https://forums.docker.com/t/named-volume-with-postgresql-doesnt-keep-databases-data/7434/2
        #              .                            .                                .    .   .

eval "$SH/summary.sh"
