FROM molobrakos/home-assistant:base

RUN pip3 install --no-cache-dir --upgrade \
    homeassistant

USER home-assistant

CMD [ "hass", "--config", "/config"]
