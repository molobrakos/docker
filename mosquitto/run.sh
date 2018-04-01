#!/bin/bash

CONTAINER=mqtt
IMAGE=molobrakos/$CONTAINER:latest
CONFIG=$HOME/.docker-$CONTAINER/config
mkdir -p $CONFIG

docker stop $CONTAINER
docker rm $CONTAINER
#docker pull $IMAGE

docker run \
-d \
--restart=always \
--name $CONTAINER \
--net=bridge \
-p 8883:8883/tcp \
-v /etc/localtime:/etc/localtime:ro \
-v $CONFIG:/config \
-e XDG_CONFIG_HOME=/config \
$IMAGE
