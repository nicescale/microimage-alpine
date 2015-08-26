#!/bin/bash

set -e

if docker ps -a | grep -i $CON_NAME; then

    docker rm -f "$CON_NAME"
    docker run -d -t --name $CON_NAME $REG_URL/csphere/$IMAGE:$VERSION sh
else
    docker run -d -t --name $CON_NAME $REG_URL/csphere/$IMAGE:$VERSION sh
fi
