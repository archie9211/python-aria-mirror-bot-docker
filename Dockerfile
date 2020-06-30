FROM ubuntu:latest
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -qq update
RUN apt-get -qq update
RUN apt-get -qq install -y p7zip-full aria2 curl pv jq ffmpeg locales python3-lxmlCOPY requirements.txt .
COPY extract /usr/local/bin
RUN chmod +x /usr/local/bin/extract
RUN pip3 install --no-cache-dir -r requirements.txt
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
