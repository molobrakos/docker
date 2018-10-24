FROM ubuntu:18.04

VOLUME /config
WORKDIR /app

RUN set -x && \
    apt-get update && \
    apt-get -y --no-install-recommends install mosquitto mosquitto-clients ca-certificates dumb-init && \
    apt-get -y autoremove && \
    apt-get -y clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/* && \
    rm -rf /var/tmp/* && \
    useradd --user-group --home-dir /app --shell /bin/false mqtt

EXPOSE 8883

USER mqtt

ENTRYPOINT [ "dumb-init", "--", "mosquitto", "-c", "/config/mosquitto.conf" ]

HEALTHCHECK CMD mosquitto_pub -i healthcheck -t test -m ping || exit 1
