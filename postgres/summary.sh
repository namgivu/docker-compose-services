#!/usr/bin/env bash
SH=$(cd `dirname $BASH_SOURCE` && pwd)
source "$SH/.config.sh"
    if [ -z $CONTAINER_NAME ]; then echo 'Variable CONTAINER_NAME is required'; exit 1; fi
    if [ -z $PORT ];  then echo 'Variable PORT is required'; exit 1; fi

echo "
--- ---
aftermath note

---
first step 1/2, open bash prompt first
docker exec -it $CONTAINER_NAME bash #ref. https://askubuntu.com/a/507009/22308
    then step 2/2, run psql
    psql -Upostgres

or after container run, we can use 'psql' via
docker exec -it $CONTAINER_NAME  psql -Upostgres
"
echo '---'
docker ps        | grep -E "$CONTAINER_NAME|IMAGE|NAMES"          --color=always
echo
docker volume ls | grep -E "v_djangostart_postgres|VOLUME|NAME"   --color=always
