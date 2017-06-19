#!/bin/bash

CONFIG=$HOME/.docker-home-assistant/config

mkdir -p $CONFIG

docker run \
-d \
--name home-assistant \
--restart=always \
-p 8123:8123/tcp \
-v /etc/localtime:/etc/localtime:ro \
-v $CONFIG:/config \
molobrakos/home-assistant:latest
