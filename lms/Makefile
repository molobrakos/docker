CONTAINER=lms
IMAGE=molobrakos/$(CONTAINER):latest

DIR=$(HOME)/.docker/$(CONTAINER)

CONFIG_DIR=$(DIR)/config
CACHE_DIR=$(DIR)/cache
LOG_DIR=$(DIR)/logs
MUSIC_DIR=$(DIR)/music
MUSIC_DIR=/mnt/media/Music

build:
	docker build -t $(IMAGE) .

run:
	mkdir -p "$(CONFIG_DIR)"
	mkdir -p "$(CACHE_DIR)"
	mkdir -p "$(LOG_DIR)"
#	mkdir -p "$(MUSIC_DIR)"
#       docker pull "$(IMAGE)"
	-docker stop "$(CONTAINER)"
	-docker rm "$(CONTAINER)"
	docker run \
                --detach \
                --name=$(CONTAINER) \
		--restart=always \
		-p 9000:9000 \
		-p 3483:3483 \
		-p 3483:3483/udp \
		-v /etc/localtime:/etc/localtime:ro \
		-v $(CONFIG_DIR):/config \
		-v $(CACHE_DIR):/cache \
		-v $(LOG_DIR):/logs \
		-v $(MUSIC_DIR):/music \
		$(IMAGE) \
#      --nobrowsecache
#      -v $HOME/src/lms-mobileskin/m:/usr/share/squeezeboxserver/HTML/m:ro \
