#!/bin/bash

DIR=$HOME/.lms
CONFIG_DIR=$DIR/config
CACHE_DIR=$DIR/cache
LOG_DIR=$DIR/logs

mkdir -p $CONFIG_DIR
mkdir -p $CACHE_DIR
mkdir -p $LOG_DIR

docker run -d --name lms \
       -p 9000:9000 \
       -p 3483:3483 \
       -p 3483:3483/udp \
       -v /etc/localtime:/etc/localtime:ro \
       -v /config:$CONFIG_DIR \
       -v /cache:$CACHE_DIR \
       -v /logs:$LOG_DIR \
       molobrakos/lms:latest

