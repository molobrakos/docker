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
    ; \
    pip3 install --no-cache-dir --upgrade homeassistant; \
    ; \
    rm -r /root/.cache; \
    rm -rf /var/cache/apk/*;

EXPOSE 8123

HEALTHCHECK CMD curl -f http://localhost:8123/ || exit 1

CMD [ "hass", "--config", "/config" ]
