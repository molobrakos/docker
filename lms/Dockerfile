FROM debian:stable-slim

ENV DEBIAN_FRONTEND noninteractive
ENV LANG C.UTF-8

VOLUME /config /music /logs /cache

WORKDIR /lms

RUN apt-get update && \
    apt-get -y install curl pv supervisor faad flac lame sox libio-socket-ssl-perl && \
    curl -Os \
    # http://downloads.slimdevices.com/LogitechMediaServer_v7.9.1/logitechmediaserver_7.9.1_amd64.deb && \
    #http://downloads-origin.slimdevices.com/nightly/7.9/sc/ffc273f/logitechmediaserver_7.9.1~1508904967_amd64.deb && \
    http://downloads-origin.slimdevices.com/nightly/7.9/sc/184cc48/logitechmediaserver_7.9.1~1512734075_amd64.deb && \
    dpkg -i *.deb && \
    rm -f *.deb && \
    apt-get -y autoremove && \
    apt-get -y clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/* && \
    rm -rf /var/tmp/* && \
    useradd --user-group --home-dir /lms --shell /bin/false lms

EXPOSE 3483 3483/udp 9000 9090

HEALTHCHECK CMD curl -s -f -o /dev/null -d '{"id":1,"method":"slim.request","params":["",["serverstatus"]]}' http://localhost:9000/jsonrpc.js || exit 1

USER lms

ENTRYPOINT [ "squeezeboxserver", "--user", "lms", "--prefsdir", "/config", "--logdir", "/logs", "--cachedir", "/cache" ]
