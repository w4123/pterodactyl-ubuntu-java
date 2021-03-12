# ----------------------------------
# Pterodactyl Core Dockerfile
# Environment: Java
# Minimum Panel Version: 1.0.0
# ----------------------------------
FROM ubuntu:20.04

MAINTAINER Suhui, <suhui@kokona.tech>

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install openjdk-11-jre-headless -y
RUN adduser -D -h /home/container container
 
USER container
ENV  USER=container HOME=/home/container LANG=C.UTF-8

WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]
