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
#Mega sdk dependencies
RUN apt-get -qq install -y git g++ gcc autoconf automake \
	m4 libtool  make  libcurl4-openssl-dev     libcrypto++-dev \
	libsqlite3-dev libc-ares-dev     libsodium-dev libnautilus-extension-dev \
	libssl-dev libfreeimage-dev swig
ENV MEGA_SDK_VERSION '3.7.1'
RUN git clone --depth 1 https://github.com/meganz/sdk.git -b $MEGA_SDK_VERSION sdk && cd sdk && ./autogen.sh && \
    ./configure --disable-silent-rules --enable-python --disable-examples && \
    make -j$(nproc --all) && cd bindings/python/ && \
    python3 setup.py bdist_wheel && cd dist/ && \
    pip3 install --no-cache-dir megasdk-$MEGA_SDK_VERSION-*.whl
