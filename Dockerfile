FROM openjdk:8-jdk-alpine
MAINTAINER ikasty <mail.ikasty@gmail.com>

LABEL Description="This image is used to start the yona" maintainer="ikasty"

ARG YONA_VERSION=1.9.0
ARG YONA_DOWNLOAD_URL=https://github.com/yona-projects/yona/releases/download/v${YONA_VERSION}/yona-h2-v${YONA_VERSION}-bin.zip

ENV DEBIAN_FRONTEND noninteractive

RUN apk add --no-cache wget bash

## add yona user
RUN adduser -h /yona -D yona && \
    mkdir /yona/downloads

## install yona
RUN cd /yona/downloads && \
    wget -q --no-check-certificate $YONA_DOWNLOAD_URL && \
    mkdir /yona/release && \
    unzip -q -d /yona/release yona-h2-v$YONA_VERSION-bin.zip && \
    mv /yona/release/yona-$YONA_VERSION /yona/release/yona && \
    rm -f yona-h2-v$YONA_VERSION-bin.zip

## set environment variables
ENV YONA_DATA "/yona/data"
ENV JAVA_OPTS "-Xmx2048m -Xms1024m"

## add entrypoints
ADD ./entrypoints /yona/entrypoints
RUN chmod +x /yona/entrypoints/*.sh

## yona home directory mount point from host to docker container
VOLUME yona/data
WORKDIR /yona

## yona service port expose from docker container to host
EXPOSE 9000

## run yona command
ENTRYPOINT ["/yona/entrypoints/bootstrap.sh"]
