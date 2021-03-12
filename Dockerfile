# ----------------------------------
# Pterodactyl Core Dockerfile
# Environment: Java
# Minimum Panel Version: 1.0.0
# ----------------------------------
FROM ubuntu:20.04

MAINTAINER Suhui, <suhui@kokona.tech>

RUN apt update
RUN DEBIAN_FRONTEND=noninteractive apt install openjdk-11-jre-headless locales -y
RUN locale-gen en_US.UTF-8
RUN update-locale LC_ALL=en_US.UTF-8
RUN adduser -D -h /home/container container
 
USER container
ENV  USER=container HOME=/home/container

WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]
