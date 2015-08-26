#!/bin/bash

set -e

export CON_NAME=alpine_t
export REG_URL=d.nicescale.com:5000
export IMAGE=alpine
export VERSION=3.2

docker build -t $REG_URL/microimages/$IMAGE:$VERSION .

./test.sh

docker exec $CON_NAME /bin/echo "testing"

echo "---> The test pass"

echo "---> Starting push $REG_URL/microimages/$IMAGE:$VERSION"

docker push $REG_URL/microimages/$IMAGE:$VERSION

docker rm -f $CON_NAME
