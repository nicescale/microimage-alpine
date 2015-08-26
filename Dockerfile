#
# AUTHOR              Carson,C.J.Zeong <zcy@nicescale.com>
# DOCKER-VERSION      1.7
# Dockerizing Alpine: Dockerfile for building Alpine images
#

from       alpine:3.2
maintainer Carson,C.J.Zeong <zcy@nicescale.com>

# Predefine TZ for local timezone
env TZ "Asia/Shanghai"

run apk add --update openssl 