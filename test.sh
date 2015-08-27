#!/bin/bash

set -e

if docker ps -a | grep -i $CON_NAME; then
    docker rm -f "$CON_NAME"
    docker run -d -t --name $CON_NAME $REG_URL/csphere/$IMAGE:$VERSION sh
else
    docker run -d -t --name $CON_NAME $REG_URL/csphere/$IMAGE:$VERSION sh
fi

docker exec $CON_NAME /bin/echo "testing"
docker exec $CON_NAME cat /etc/resolv.conf
docker exec $CON_NAME wget -O - $REG_URL

docker rm -f $CON_NAME

echo "---> The test pass"
