FROM python:3-alpine

VOLUME /config
WORKDIR /app

RUN apk add --no-cache --update \
    gcc \
    musl-dev \
    linux-headers \
    nmap \
    libsodium \
    curl \
	&& \
    pip3 install --no-cache-dir --upgrade colorlog \
	&& \
    rm -rf /root/.cache && \
    rm -rf /var/cache/apk/* \
	&& \
    adduser -H -D -s /bin/false home-assistant \
	&& \
    chmod u+s /bin/ping \
    ;

EXPOSE 8123

HEALTHCHECK CMD curl -f http://localhost:8123/api/ || exit 1
