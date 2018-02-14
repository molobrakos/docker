FROM alpine:latest

VOLUME /config
WORKDIR /app

RUN apk add --no-cache --update \
      mosquitto mosquitto-clients ca-certificates dumb-init \
        && \
    rm -rf /root/.cache && \
    rm -rf /var/cache/apk/* \
        && \
    adduser -H -D -s /bin/false mqtt \
    ;

EXPOSE 8883

USER mqtt

ENTRYPOINT [ "dumb-init", "mosquitto", "-c", "/config/mosquitto.conf" ]

HEALTHCHECK CMD mosquitto_pub -i healthcheck -t test -m ping || exit 1
