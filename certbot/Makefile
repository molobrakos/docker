CONTAINER=certbot
IMAGE=molobrakos/$(CONTAINER)

build:
	docker build -t $(IMAGE) .

run-gen:
	docker run \
	--rm \
	--name=$(CONTAINER) \
	-v /etc/letsencrypt/:/app \
	-v /var/www/html/:/web \
	$(IMAGE) \
	--noninteractive \
	--webroot \
	-w /web \
	--domain home.e2.io

run-renew:
	docker run \
	--rm \
	--name=$(CONTAINER) \
	-v /etc/letsencrypt:/app \
	-v /var/www/html:/web \
	$IMAGE \
	--noninteractive
	renew \
	--cert-name e2.io \
