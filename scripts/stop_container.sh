#!/bin/bash

CONTAINER_NAME="docker_container_name"
CONTAINER_DIR="/path/container/"

cd $CONTAINER_DIR

echo "-> Parando container"
docker stop $CONTAINER_NAME