NAME=motioneye
IMAGE=molobrakos/$NAME
CONTAINER=$NAME

MEDIA=/mnt/motion
CONFIG=$HOME/.docker-$NAME
mkdir -p $CONFIG

docker rm -f $CONTAINER
docker run -d \
       -it --name=$CONTAINER \
       -p 8080:8080 \
       -p 8081:8081 \
       -p 8082:8082 \
       -p 8765:8765 \
       -v /etc/localtime:/etc/localtime:ro \
       -v $CONFIG:/config \
       -v $MEDIA:/media \
       --restart=always \
$IMAGE
