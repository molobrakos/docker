FROM alpine:latest

VOLUME /config
WORKDIR /app

RUN apk add --no-cache --update \
      mosquitto mosquitto-clients dumb-init \
        && \
    rm -rf /root/.cache && \
    rm -rf /var/cache/apk/* \
        && \
    adduser -H -D -s /bin/false mqtt \
    ;

EXPOSE 1883

USER mqtt

ENTRYPOINT [ "dumb-init", "mosquitto", "-c", "/config/mosquitto.conf" ]

HEALTHCHECK CMD nc -z localhost 1883 || exit 1
