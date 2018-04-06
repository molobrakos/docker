#!/bin/bash

CONTAINER=mqtt
IMAGE=molobrakos/$CONTAINER:latest
CONFIG=$HOME/.docker-$CONTAINER
mkdir -p $CONFIG

docker stop $CONTAINER
docker rm $CONTAINER
#docker pull $IMAGE

docker run \
-d \
--restart=always \

--name $CONTAINER \
-p 1883:1883/tcp \
-v /etc/localtime:/etc/localtime:ro \
-v $CONFIG:/config \
$IMAGE
