CONTAINER=home-assistant
IMAGE=molobrakos/$(CONTAINER)
CONFIG=$(HOME)/.docker/$(CONTAINER)
DEFAULT_TAG=debian
DEFAULT_IMAGE=$(IMAGE):$(DEFAULT_TAG)

PACKAGE=homeassistant
PACKAGE_DEV=https://github.com/home-assistant/home-assistant/archive/dev.zip

# FIXME: Files could be auto generated, with vars base_image and hass_dist

build:
	@echo "----- Building debian"
	docker build -t "$(IMAGE)" -f Dockerfile .
	@echo "----- Building debian-dev"
	docker build -t "$(IMAGE):dev" -f Dockerfile-dev .

run:
	mkdir -p $(CONFIG)
#	docker pull $(IMAGE)
	-docker stop $(CONTAINER)
	-docker rm $(CONTAINER)
	docker run \
	--detach=true \
	--restart=always \
	--net=host \
	--hostname=$(CONTAINER) \
	--name=$(CONTAINER) \
	-p 8123:8123/tcp \
	-v /etc/localtime:/etc/localtime:ro \
	-v $(CONFIG):/config \
	$(DEFAULT_IMAGE)
