FROM ubuntu:latest

ENV DEBIAN_FRONTEND noninteractive
ENV LANG C.UTF-8

VOLUME /config /music /logs /cache

WORKDIR /lms

RUN apt-get update
RUN apt-get -y install wget supervisor faad flac lame sox libio-socket-ssl-perl

RUN wget -q http://downloads.slimdevices.com/LogitechMediaServer_v7.9.0/logitechmediaserver_7.9.0_amd64.deb
RUN dpkg -i *.deb && \
    rm *.deb && \
    apt-get clean

RUN adduser --no-create-home --disabled-login --disabled-password --gecos "" lms

RUN ls

EXPOSE 3483 3483/udp 9000

HEALTHCHECK CMD curl -f http://localhost:9000/api/ || exit 1

USER lms

CMD [ "squeezeboxserver", "--user", "lms", "--prefsdir", "/config", "--logdir", "/logs", "--cachedir", "/cache" ]
