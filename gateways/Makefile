IMAGE=molobrakos/gateways

build:
	docker build -t $(IMAGE) .

run-tsn:
	docker run \
		-ti --rm \
		--net=host \
		-v $(HOME)/.config/mosquitto_pub:/root/.config/mosquitto_pub:ro \
		-v $(HOME)/.tellsticknet.conf:/root/tellsticknet.conf:ro \
		$(IMAGE) ./tellsticknet/script/tellsticknet mqtt -vv

run-voc:
	docker run \
		-ti --rm \
		--net=bridge \
		-v $(HOME)/.voc.conf:/root/voc.conf:ro \
		-v $(HOME)/.config/mosquitto_pub:/root/.config/mosquitto_pub:ro \
		$(IMAGE) ./volvooncall/voc mqtt -vv
