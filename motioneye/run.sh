NAME=motioneye
IMAGE=molobrakos/$NAME
CONTAINER=$NAME

MEDIA=/mnt/media
CONFIG=$HOME/.docker-$NAME
mkdir -p $CONFIG

docker rm -f $CONTAINER
docker run -it --name=$CONTAINER \
-d \
-p 8080:8080 \
-p 8081:8081 \
-p 8765:8765 \
-v /etc/localtime:/etc/localtime:ro \
-v $CONFIG:/config \
-v $MEDIA:/media \
--restart=always \
$IMAGE
