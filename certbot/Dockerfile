FROM alpine:latest

VOLUME /app
WORKDIR /app

RUN apk add --no-cache --update \
    certbot \
	&& \
	rm -rf /root/.cache && \
    rm -rf /var/cache/apk/* \
    && \
    adduser -H -D -s /bin/false certbot \
    ;

EXPOSE 443
				
# USER certbot

ENTRYPOINT [ "certbot", "--config-dir", "/app/config", "--work-dir", "/app/work", "--logs-dir", "/app/log" ]
