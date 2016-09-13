from       alpine:3.4
maintainer william <wlj@nicescale.com>

# Predefine TZ for local timezone
env TZ "Asia/Shanghai"

#copy rootfs /

run apk-install wget openssl bash curl tzdata \
  bash-completion coreutils bind-tools sed grep && \
  ln -sf /bin/bash /bin/sh && \
  cp /usr/share/zoneinfo/$TZ /etc/localtime && \
  apk del tzdata && \
  mkdir -p /usr/share/zoneinfo/Asia && \
  cp /etc/localtime /usr/share/zoneinfo/Asia/Shanghai

run wget https://github.com/just-containers/s6-overlay/releases/download/v1.18.1.3/s6-overlay-amd64.tar.gz \
  -O /tmp/s6-overlay.tar.gz && \
  tar zxf /tmp/s6-overlay.tar.gz -C / && rm -f /tmp/s6-overlay.tar.gz
#run wget https://github.com/janeczku/go-dnsmasq/releases/download/0.9.8/go-dnsmasq-min_linux-amd64 -O /usr/sbin/go-dnsmasq && \
#  chmod 755 /usr/sbin/go-dnsmasq

entrypoint ["/init"]
cmd []
