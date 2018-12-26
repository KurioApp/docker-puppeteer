FROM node:10-slim

LABEL maintainer="Eka Cahya P <eka@kurio.co.id>"

COPY system-requirements.txt /tmp/system-requirements.txt
RUN apt-get update && \
    apt-get -y upgrade && \
    xargs apt-get -y -q install < /tmp/system-requirements.txt && \
    apt-get clean && apt-get -y autoremove && rm -rf /var/lib/apt/lists/*

RUN groupadd -r pptruser && useradd -r -g pptruser -G audio,video pptruser \
    && mkdir -p /home/pptruser/.ssh \
    && chown -R pptruser:pptruser /home/pptruser
