#!/bin/bash

set -e

export CON_NAME=alpine_t
export REG_URL=index.csphere.cn
export IMAGE=microimages/alpine
export TAGS="3.4 3"

docker build -t $IMAGE .
./test.sh

docker tag -f $IMAGE $REG_URL/$IMAGE

for t in $TAGS; do
  docker tag -f $IMAGE $REG_URL/$IMAGE:$t
  docker tag -f $IMAGE $IMAGE:$t
done

docker push $IMAGE
docker push $REG_URL/$IMAGE
