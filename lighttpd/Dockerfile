FROM alpine

RUN apk add --update --no-cache \
        lighttpd curl dumb-init \
  && rm -rf /var/cache/apk/* \
  && rm -rf /var/cache/apk/* \
#  && adduser -H -D -s /bin/false www-data \
    ;

EXPOSE 80 443
VOLUME /var/www /etc/lighttpd
WORKDIR /app

USER www-data

ENTRYPOINT [ "dumb-init", "lighttpd", "-D", "-f", "/etc/lighttpd/lighttpd.conf"]

HEALTHCHECK --interval=1m --timeout=3s CMD curl --head --fail --silent http://localhost > /dev/null || exit 1
