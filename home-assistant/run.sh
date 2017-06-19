#!/bin/bash

IMAGE=molobrakos/home-assistant:latest
CONTAINER=home-assistant
CONFIG=$HOME/.docker-home-assistant/config
mkdir -p $CONFIG

docker stop $CONTAINER
docker rm $CONTAINER
docker pull $IMAGE

docker run \
-d \
--name $CONTAINER \
-p 8123:8123/tcp \
-v /etc/localtime:/etc/localtime:ro \
-v $CONFIG:/config \
$IMAGE

docker logs -f $CONTAINER

