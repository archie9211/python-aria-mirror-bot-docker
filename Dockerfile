FROM ubuntu:latest
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -qq update && \
apt-get -qq install -y wget p7zip-full aria2 curl pv jq ffmpeg locales python3-lxml python3-pip git
RUN wget https://raw.githubusercontent.com/lzzy12/python-aria-mirror-bot/staging-4.0/extract -P /usr/local/bin && chmod +x /usr/local/bin/extract
RUN wget https://raw.githubusercontent.com/lzzy12/python-aria-mirror-bot/staging-4.0/requirements.txt && pip3 install --no-cache-dir -r requirements.txt
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
