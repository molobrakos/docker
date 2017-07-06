#!/bin/bash

DIR=$HOME/.docker-lms

CONFIG_DIR=$DIR/config
CACHE_DIR=$DIR/cache
LOG_DIR=$DIR/logs
MUSIC_DIR=$DIR/music

mkdir -p $CONFIG_DIR
mkdir -p $CACHE_DIR
mkdir -p $LOG_DIR
mkdir -p $MUSIC_DIR

docker run -d --name lms \
       --restart=always \
       -p 9000:9000 \
       -p 3483:3483 \
       -p 3483:3483/udp \
       -v /etc/localtime:/etc/localtime:ro \
       -v $CONFIG_DIR:/config \
       -v $CACHE_DIR:/cache \
       -v $LOG_DIR:/logs \
       -v $MUSIC_DIR:/music \
       molobrakos/lms:latest

