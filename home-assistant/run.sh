#!/bin/bash

TAG=latest
CONTAINER=home-assistant
IMAGE=molobrakos/$CONTAINER:$TAG
CONFIG=$HOME/.docker-$CONTAINER/config
mkdir -p $CONFIG

docker stop $CONTAINER
docker rm $CONTAINER
docker pull $IMAGE

docker run \
-d \
--restart=always \
--net=host \
--name $CONTAINER \
-p 8123:8123/tcp \
-v /etc/localtime:/etc/localtime:ro \
-v $CONFIG:/config \
$IMAGE

