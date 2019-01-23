# -------------------------------------------------------------------

FROM python:3.6-slim-stretch

RUN set -x && \
    apt-get update && \
    apt-get -y --no-install-recommends install \
      dumb-init \
      gcc \
      g++ \
      make \
      nmap \
      libsodium18 \
      make \
      curl \
      libffi-dev \
      ffmpeg \
      net-tools \
      iputils-ping \
      && \
    \
    apt-get -y autoremove && \
    apt-get -y clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/* && \
    rm -rf /var/tmp/* && \
    \
    useradd --user-group --no-create-home --shell /bin/false home-assistant \
    ;

# -------------------------------------------------------------------

VOLUME /config
WORKDIR /app

RUN pip3 install --no-cache-dir --upgrade pip colorlog cchardet cython uvloop pywebpush

HEALTHCHECK CMD curl --max-time 5 --fail --silent --output /dev/null http://localhost:8123/manifest.json || exit 1

CMD [ "dumb-init", "--", "hass", "--config", "/config" ]

# -------------------------------------------------------------------

RUN pip3 install --no-cache-dir --upgrade https://github.com/home-assistant/home-assistant/archive/dev.zip

# -------------------------------------------------------------------

USER home-assistant
