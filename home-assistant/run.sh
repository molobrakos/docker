#!/bin/bash

TAG=latest
CONTAINER=home-assistant
IMAGE=molobrakos/$CONTAINER:$TAG
CONFIG=$HOME/.docker-$CONTAINER
mkdir -p $CONFIG

docker pull $IMAGE
docker stop $CONTAINER
docker rm $CONTAINER

docker run \
--detach \
--restart always \
--name $CONTAINER \
--hostname $CONTAINER \
--net host \
-p 8123:8123/tcp \
-v /etc/localtime:/etc/localtime:ro \
-v $CONFIG:/config \
$IMAGE
