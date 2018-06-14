IMAGE=molobrakos/certbot

build:
	docker build -t $(IMAGE) .

run-gen:
	docker run \
	--rm \
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
	-v /etc/letsencrypt:/app \
	-v /var/www/html:/web \
	$IMAGE \
	--noninteractive
	renew \
	--cert-name e2.io \
