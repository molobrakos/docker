NAME="lighttpd"
CONTAINER="$(NAME)"
IMAGE="molobrakos/$(NAME):latest"

CONFIG_DIR="$(HOME)/.docker-lighttpd/"
CONFIG="$(CONFIG_DIR)/lighttpd.conf"

build:
	docker build -t $(IMAGE) .

config:
	mkdir -p $(CONFIG_DIR)

run: config
	docker run \
       --detach \
       --restart=always \
       --name=$(CONTAINER) \
       --hostname=$(CONTAINER) \
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
       -v $(CONFIG):/etc/lighttpd/lighttpd.conf:ro \
       -v /etc/mime.types:/etc/mime.types:ro \
        $(IMAGE)
