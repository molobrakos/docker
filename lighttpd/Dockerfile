FROM alpine:edge

RUN set -x \
  && apk add --update --no-cache \
        lighttpd curl dumb-init shadow perl \
  && rm -rf /var/cache/apk/* \
  && rm -rf /var/cache/misc/* \
  && deluser xfs \
  && usermod -u 33 lighttpd \
#  && adduser -u 33 -H -D -s /bin/false -G www-data www-data \
    ;

EXPOSE 80 443
VOLUME /var/www /var/cache/lighttpd /var/log/etc/lighttpd
WORKDIR /app

# USER www-data

CMD [ "dumb-init", "lighttpd", "-D", "-f", "/etc/lighttpd/lighttpd.conf"]

HEALTHCHECK --interval=1m --timeout=3s CMD curl --head --fail --silent http://localhost > /dev/null || exit 1
