from       alpine:3.2
maintainer william <wlj@nicescale.com>

# Predefine TZ for local timezone
env TZ "Asia/Shanghai"

run apk add --update wget openssl dnsmasq jq curl bash \
  bash-completion coreutils bind-tools sed grep && \
  ln -sf /bin/bash /bin/sh && \
  rm /var/cache/apk/*

copy rootfs /

run chmod 755 /bin/*.sh /etc/services.d/dns/run /etc/services.d/dns-hack/run /etc/services.d/syslog/run && \
  echo 'hosts: files mdns4_minimal [NOTFOUND=return] dns mdns4' >> /etc/nsswitch.conf

entrypoint ["/init"]
CMD []
