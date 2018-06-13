CONTAINER="home-assistant"
IMAGE="molobrakos/$(CONTAINER)"
CONFIG="$(HOME)/.docker-$(CONTAINER)"

build:
	docker build -t "$(IMAGE):base" -f Dockerfile.base .
	docker build -t "$(IMAGE)" .
	docker build -t "$(IMAGE):dev" -f Dockerfile.dev .

run:
	mkdir -p "$(CONFIG)"
	docker pull "$(IMAGE)"
	-docker stop "$(CONTAINER)"
	-docker rm "$(CONTAINER)"
	docker run \
	-d \
	--restart=always \
	--net=host \
	--name "$(CONTAINER)" \
	-p 8123:8123/tcp \
	-v /etc/localtime:/etc/localtime:ro \
	-v "$(CONFIG):/config" \
	"$(IMAGE)"
