#!/bin/bash

CONFIG=$HOME/.home-assistant.docker

mkdir -p $CONFIG

docker run -d --name home-assistant --net=host \
       -v /etc/localtime:/etc/localtime:ro \
       -v $CONFIG \
       molobrakos/home-assistant:latest
