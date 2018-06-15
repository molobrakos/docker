NAME=lighttpd
CONTAINER=$(NAME)
IMAGE=molobrakos/$(NAME)

CONFIG_DIR="$(HOME)/.docker-lighttpd/"

build:
	docker build -f Dockerfile.debian -t $(IMAGE):debian .
	docker build -f Dockerfile.alpine -t $(IMAGE):alpine .

config:
	mkdir -p $(CONFIG_DIR)

run: config
	docker run \
          --detach \
	  --restart=always \
          --name=$(CONTAINER) \
          --hostname=$(CONTAINER) \
          --net=bridge \
          -p 80:80/tcp \
          -p 443:443/tcp \
          -v /etc/localtime:/etc/localtime:ro \
          -v /var/www:/var/www:ro \
          -v /etc/lighttpd:/etc/lighttpd:ro \
          -v /var/log/lighttpd:/var/log/lighttpd:rw \
          -v /var/cache/lighttpd:/var/cache/lighttpd:rw \
          -v $CONFIG_DIR/lighttpd.conf:/etc/lighttpd/lighttpd.conf:ro \
          -v $CONFIG_DIR/mime.types.conf:/etc/lighttpd/mime.types.conf:ro \
	  $(IMAGE):alpine
