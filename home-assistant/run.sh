#!/bin/bash

CONFIG=$HOME/.docker-home-assistant

mkdir -p $CONFIG

docker run \
-d \
--name home-assistant \
-p 8123:8123/tcp \
-v /etc/localtime:/etc/localtime:ro \
-v $CONFIG \
molobrakos/home-assistant:latest
