#!/bin/bash

CONFIG=$HOME/.home-assistant.docker

mkdir -p $CONFIG

docker run \
-d \
--name home-assistant \
-p 8123:8123/tcp \
-v /etc/localtime:/etc/localtime:ro \
-v $CONFIG \
molobrakos/home-assistant:latest
