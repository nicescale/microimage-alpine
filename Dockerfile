from       alpine:3.8
maintainer admin <admin@csphere.cn>

# Predefine TZ for local timezone
env TZ "Asia/Shanghai"

run apk add -U wget openssl bash curl tzdata \
  bash-completion coreutils bind-tools sed grep && \
  ln -sf /bin/bash /bin/sh && \
  cp /usr/share/zoneinfo/$TZ /etc/localtime && \
  apk del tzdata && \
  mkdir -p /usr/share/zoneinfo/Asia && \
  cp /etc/localtime /usr/share/zoneinfo/Asia/Shanghai

run wget https://github.com/just-containers/s6-overlay/releases/download/v1.21.4.0/s6-overlay-amd64.tar.gz \
  -O /tmp/s6-overlay.tar.gz && \
  tar zxf /tmp/s6-overlay.tar.gz -C / && rm -f /tmp/s6-overlay.tar.gz

entrypoint ["/init"]
cmd []
