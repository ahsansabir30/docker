#!/bin/bash

# CREATE A VOLUME
docker volume create db-volume

# CREATE SQL IMAGE
docker build -t database .

# CREATING A DB CONTAINER
docker run -d\
    --volume db-volume:/var/lib/mysql\
    --mount type=bind,source=$(pwd)/CreateTable.sql,target=/docker-entrypoint-initdb.d/file.sql\
    --name db\
    database

# DELETING DB CONTAINER (TO SEE IF DATA HAS PERSISITED)
docker stop db
docker rm db

# CREATING A NEW DB CONTAINER (AND SEEING IF DATA STILL EXISTS)
docker run -d\
    --volume db-volume:/var/lib/mysql\
    --name db2\
    database
# To see if our data has been saved - we can open up the interactive shell
# Execute following
# $docker exec -it [container_name] bash -l 
# $mysql -uroot -ppassword
# Then your able to run mysql commands
