#!/usr/bin/bash
SH=$(cd `dirname "$BASH_SOURCE"` && pwd)  # SH aka SCRIPT_HOME

source "$SH/.config.sh"
    cd $SH
        set -e  # halt if error ON
            docker-compose -f "$SH/docker-compose.yml" up  -d  --force-recreate  # ref. https://forums.docker.com/t/named-volume-with-postgresql-doesnt-keep-databases-data/7434/2
            #              custom docker-compose location  .   .
        set +e  # halt if error OFF
            echo "
--- ---
AFTERMATH NOTE

# after container run, we can use 'psql' via
docker exec -it $CONTAINER_NAME mysql -u root -p$MARIADB_ROOT_PASSWORD

# or first step 1/2, open bash prompt first
docker exec -it $CONTAINER_NAME bash #ref. https://askubuntu.com/a/507009/22308
    # then step 2/2, run psql
    mysql -u root -p$MARIADB_ROOT_PASSWORD

# if you don't have local mysql command, then make this alias
echo \"
# create mysql command
alias mysql='docker exec -it $CONTAINER_NAME mysql -u root -p$MARIADB_ROOT_PASSWORD'
\" >> $HOME/.bashrc
mysql --version  # aftermath check
"
