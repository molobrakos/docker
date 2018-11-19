FROM debian:stable-slim as build

WORKDIR /build

RUN set -x && \
    export DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get -y --no-install-recommends install build-essential curl ca-certificates \
         file libpcre3-dev pkg-config libev-dev zlib1g-dev libbz2-dev libssl-dev && \
    curl -L https://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.51.tar.gz | tar xz && \
    cd lighttpd-1.4.51 && \
    ./configure --with-openssl --with-libev --prefix=/usr/local && \
    make && make install && find /usr/local

FROM debian:stable-slim

RUN set -x && \
    export DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get -y --no-install-recommends install curl dumb-init ca-certificates \
      libpcre3 libev4 zlib1g libbz2-1.0 libssl1.1 && \
    apt-get -y autoremove && \
    apt-get -y clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/* && \
    rm -rf /var/tmp/*

EXPOSE 80 443
VOLUME /var/www /var/cache/lighttpd /var/log/lighttpd /etc/lighttpd
WORKDIR /app

COPY --from=build /usr/local /usr/local

RUN find /usr/local

CMD [ "dumb-init", "--", "lighttpd", "-D", "-f", "/etc/lighttpd/lighttpd.conf"]

HEALTHCHECK --interval=1m --timeout=3s CMD curl --head --fail --silent http://localhost > /dev/null || exit 1

# We want at least 1.4.46 (proxy upgrade support)
# We want at least 1.4.51 (fix for SSL content negotiation)

RUN which lighttpd && lighttpd -v

