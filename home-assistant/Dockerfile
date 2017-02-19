FROM python:3-alpine

MAINTAINER molobrakos

VOLUME /config
WORKDIR /app

RUN apk add --no-cache --update \
    gcc \
    musl-dev \
    linux-headers \
    nmap \
    libsodium \
    curl \
    ; \
    pip3 install --no-cache-dir --upgrade homeassistant \
    ; \
    rm -rf /root/.cache && \
    rm -rf /var/cache/apk/* \
    ; \
    adduser -H -D -s /bin/false hass \
    ;

USER hass

EXPOSE 8123

HEALTHCHECK CMD curl -f http://localhost:8123/api/ || exit 1

CMD [ "hass", "--config", "/config" ]
