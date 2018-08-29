#!/bin/bash

set -e

export CON_NAME=alpine_t
export REG_URL=index.csphere.cn
export IREG_URL=docker.nicescale.com:4443
export IMAGE=microimages/alpine
export TAGS="3.8 3"

docker build -t $IMAGE .
./test.sh

docker tag -f $IMAGE $REG_URL/$IMAGE
docker tag -f $IMAGE $IREG_URL/$IMAGE

for t in $TAGS; do
  docker tag -f $IMAGE $REG_URL/$IMAGE:$t
  docker tag -f $IMAGE $IREG_URL/$IMAGE:$t
  docker tag -f $IMAGE $IMAGE:$t
done

docker push $IMAGE
docker push $REG_URL/$IMAGE
docker push $IREG_URL/$IMAGE
