from       alpine:3.2
maintainer william <wlj@nicescale.com>

# Predefine TZ for local timezone
env TZ "Asia/Shanghai"

copy rootfs /
run apk add --update wget openssl dnsmasq jq curl bash bash-completion coreutils bind-tools sed grep && \
  chmod 755 /bin/*.sh /etc/services.d/dns/run /etc/services.d/dns-hack/run /etc/services.d/syslog/run && \
  echo 'hosts: files mdns4_minimal [NOTFOUND=return] dns mdns4' >> /etc/nsswitch.conf && \
  rm /var/cache/apk/*

run ln -sf /bin/bash /bin/sh

ENTRYPOINT ["/init"]
CMD []
