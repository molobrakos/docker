FROM python:3-alpine

MAINTAINER molobrakos

VOLUME /config

WORKDIR /usr/src/app

RUN apk add --no-cache --update \
    gcc \
    musl-dev \
    linux-headers \
    nmap \
    libsodium \
    && rm -rf /var/cache/apk/* \
    ;

RUN pip3 install --no-cache-dir --upgrade homeassistant netdisco pychromecast

EXPOSE 8123

HEALTHCHECK CMD curl -f http://localhost:8123/ || exit 1

CMD [ "python", "-m", "homeassistant", "--config", "/config" ]
