FROM debian:stable-slim

RUN set -x && \
    apt-get update && \
    apt-get -y install lighttpd curl dumb-init && \
    apt-get -y autoremove && \
    apt-get -y clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/* && \
    rm -rf /var/tmp/* && \
    useradd --user-group --no-create-home --shell /bin/false lighttpd

#  && rm -rf /var/cache/apk/* \
#  && rm -rf /var/cache/misc/* \
#  && deluser xfs \
#  && usermod -u 33 lighttpd \
#    ;

# Default user xfs (x font server) in alpine has uid 33 which
# corresponds to user www-data in debian/ubuntu. Lets delete
# it and change uid of the lighttpd user

EXPOSE 80 443
VOLUME /var/www /var/cache/lighttpd /var/log/lighttpd /etc/lighttpd
WORKDIR /app

CMD [ "dumb-init", "--", "lighttpd", "-D", "-f", "/etc/lighttpd/lighttpd.conf"]

HEALTHCHECK --interval=1m --timeout=3s CMD curl --head --fail --silent http://localhost > /dev/null || exit 1
