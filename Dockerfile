from       alpine:3.2
maintainer william <wlj@nicescale.com>

# Predefine TZ for local timezone
env TZ "Asia/Shanghai"

copy rootfs /

run apk add --update wget openssl dnsmasq jq curl bash \
  bash-completion coreutils bind-tools sed grep && \
  ln -sf /bin/bash /bin/sh && \
  rm /var/cache/apk/*

run wget https://github.com/just-containers/s6-overlay/releases/download/v1.15.0.0/s6-overlay-amd64.tar.gz -O /tmp/s6-overlay.tar.gz && \
  tar zxf /tmp/s6-overlay.tar.gz -C / && rm -f /tmp/s6-overlay.tar.gz && \
  chmod 755 /bin/*.sh /etc/services.d/dns/run /etc/services.d/dns-hack/run /etc/services.d/syslog/run && \
  echo 'hosts: files mdns4_minimal [NOTFOUND=return] dns mdns4' >> /etc/nsswitch.conf

entrypoint ["/init"]
CMD []
