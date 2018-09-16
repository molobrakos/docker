NAME=motioneye
CONTAINER=$(NAME)
IMAGE=molobrakos/$(NAME):latest
CONFIG=$(HOME)/.docker-$(CONTAINER)
MEDIA=/mnt/motion

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
	--detach \
	--restart=always \
	--name=$(CONTAINER) \
	--hostname=$(CONTAINER) \
	--net=bridge \
        -p 8080:8080 \
        -p 8081:8081 \
        -p 8082:8082 \
        -p 8765:8765 \
        -v /etc/localtime:/etc/localtime:ro \
        -v $(CONFIG):/config \
        -v $(MEDIA):/media \
	$(IMAGE)
