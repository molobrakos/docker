MEDIA=$HOME/media

CONFIG=$HOME/.docker-motion
mkdir -p $CONFIG

docker rm -f motioneye ; docker run -it --name=motioneye \
-p 8080:8080 \
-p 8081:8081 \
-p 8765:8765 \
-v /etc/localtime:/etc/localtime:ro \
-v $CONFIG:/config \
-v $MEDIA:/media \
--restart=always \
molobrakos/motion
