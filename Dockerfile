FROM ubuntu:latest
ENV DEBIAN_FRONTEND noninteractive
MAINTAINER Nageen Chand (nageen23@gmail.com)

RUN apt-get -qq update && \
				apt-get -y update && apt-get -y upgrade && apt-get -y install  gcc-aarch64-linux-gnu bc build-essential zip gcc libc6 curl libstdc++6 git wget libssl-dev zstd
RUN locale-gen en_US.UTF-8
ENV TZ Asia/Kolkata
