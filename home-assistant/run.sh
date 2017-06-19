#!/bin/bash

IMAGE=molobrakos/home-assistant:latest
NAME=home-assistant
CONFIG=$HOME/.docker-home-assistant/config
mkdir -p $CONFIG

docker stop $NAME
docker rm $NAME
docker pull $IMAGE

docker run \
-d \
--name $NAME \
-p 8123:8123/tcp \
-v /etc/localtime:/etc/localtime:ro \
-v $CONFIG:/config \
$IMAGE

docker logs -f $NAME

