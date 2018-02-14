FROM molobrakos/home-assistant:base

RUN pip3 install --no-cache-dir --upgrade \
    homeassistant uvloop

USER home-assistant

CMD [ "hass", "--config", "/config"]
