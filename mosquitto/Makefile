CONTAINER="mqtt"
IMAGE="molobrakos/$(CONTAINER):latest"
CONFIG="$(HOME)/.docker/$(CONTAINER)"

build:
	docker build . -t $(IMAGE)

push: build
	docker push $(IMAGE)

pull:
	docker pull $(IMAGE)

config:
	mkdir -p $(CONFIG)

run: config
	-docker stop $(CONTAINER)
	-docker rm $(CONTAINER)
	docker run \
	-d \
	--restart=always \
	--name="$(CONTAINER)" \
	--hostname="$(CONTAINER)" \
	--net=bridge \
	-p 8883:8883/tcp \
	-v /etc/localtime:/etc/localtime:ro \
	-v "$(CONFIG):/config" \
	-e XDG_CONFIG_HOME=/config \
	$(IMAGE)
