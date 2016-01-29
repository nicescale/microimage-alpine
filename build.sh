#!/bin/bash

set -e

export CON_NAME=alpine_t
export REG_URL=d.nicescale.com:5000
export IMAGE=alpine
export VERSION=3.3

docker build -t microimages/$IMAGE .

#./test.sh

echo "---> Starting push microimages/$IMAGE:$VERSION"

docker tag -f microimages/$IMAGE microimages/$IMAGE:$VERSION

docker push microimages/$IMAGE
