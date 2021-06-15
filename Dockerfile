# ----------------------------------
# Pterodactyl Core Dockerfile
# Environment: Java
# Minimum Panel Version: 1.0.0
# ----------------------------------
FROM ubuntu:20.04

MAINTAINER Suhui, <suhui@kokona.tech>

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install software-properties-common wget -y
RUN wget -qO - https://adoptopenjdk.jfrog.io/adoptopenjdk/api/gpg/key/public | apt-key add -
RUN add-apt-repository --yes https://adoptopenjdk.jfrog.io/adoptopenjdk/deb/
RUN DEBIAN_FRONTEND=noninteractive apt-get install adoptopenjdk-11-openj9-jre -y
RUN rm -rf /var/lib/apt/lists/*
RUN adduser --disabled-password -h /home/container container
 
USER container
ENV  USER=container HOME=/home/container LANG=C.UTF-8

WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]
