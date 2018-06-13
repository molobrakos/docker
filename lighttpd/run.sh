#!/bin/bash

CONTAINER=lighttpd
IMAGE=molobrakos/$CONTAINER:latest

docker pull $IMAGE
docker stop $CONTAINER
docker rm $CONTAINER

docker run \
       --detach \
       --restart always \
       --name $CONTAINER \
       --hostname $CONTAINER \
       --net bridge \
       -p 80:80/tcp \
       -p 443:443/tcp \
       -v /etc/localtime:/etc/localtime:ro \
       -v /etc/lighttpd:/etc/lighttpd:ro \
       -v /var/run/lighttpd.pid:/var/run/lighttpd.pid \
       -v /var/cache/lighttpd:/var/cache/lighttpd \
       -v /usr/share/lighttpd:/usr/share/lighttpd:ro \
       -v /var/www:/var/www:ro \
       -v /var/log/lighttpd:/var/log/lighttpd \
       -v $HOME/.docker-lighttpd/lighttpd.conf:/etc/lighttpd/lighttpd.conf:ro \
       -v /etc/mime.types:/etc/mime.types:ro \
        $IMAGE
