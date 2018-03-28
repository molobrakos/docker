#!/bin/bash

CONTAINER=lighttpd
IMAGE=molobrakos/$CONTAINER:latest

docker stop $CONTAINER
docker rm $CONTAINER
docker pull $IMAGE

docker run \
       --name $CONTAINER \
       -v /etc/localtime:/etc/localtime:ro \
       -v /etc/lighttpd:/etc/lighttpd:ro \
       -v /var/www:/var/www:ro \
       -v /usr/share/lighttpd:/usr/share/lighttpd:ro \
        $IMAGE
