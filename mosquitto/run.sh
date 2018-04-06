#!/bin/bash

CONTAINER=mqtt
IMAGE=molobrakos/$CONTAINER:latest
CONFIG=$HOME/.docker-$CONTAINER
mkdir -p $CONFIG

#docker pull $IMAGE
docker stop $CONTAINER
docker rm $CONTAINER

docker run \
-d \
--restart=always \
--name $CONTAINER \
-p 8883:8883/tcp \
-v /etc/localtime:/etc/localtime:ro \
-v $CONFIG:/config \
-e XDG_CONFIG_HOME=/config \
$IMAGE
