#!/bin/bash

############################################################
## docker project name
PROJECT_NAME="docker-yona"
############################################################
## docker configurations
DOCKER_USER="ikasty"
DOCKER_VERSION="1.9.0"
DOCKER_NAME="yona"
DOCKER_IMAGE="$DOCKER_USER/$DOCKER_NAME:$DOCKER_VERSION"
############################################################
## container configurations
DOCKER_CONTAINER_NAME="yona"
DOCKER_CONTAINER_PORT="9000"
############################################################
# YONA_DATA="/home/user/yona-data"
JAVA_OPT="-Xmx2048m -Xms1024m"
############################################################
