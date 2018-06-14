FROM debian:stable-slim

VOLUME /app
WORKDIR /app

RUN set -x && \
    apt-get update && \
    apt-get -y install certbot && \
    apt-get -y autoremove && \
    apt-get -y clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/* && \
    rm -rf /var/tmp/* && \
    useradd --user-group --no-create-home --shell /bin/false certbot

EXPOSE 443

USER certbot

ENTRYPOINT [ "certbot", "--config-dir", "/app/config", "--work-dir", "/app/work", "--logs-dir", "/app/log" ]
