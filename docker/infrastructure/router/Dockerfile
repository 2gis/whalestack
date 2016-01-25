FROM haproxy:1.5
MAINTAINER 2GIS

ENV DEBIAN_FRONTEND=noninteractive \
    CONFD_OPTS='-interval 10 -node 172.17.42.1:4001' \
    CONFD_VERSION=0.10.0 \
    SVDIR=/etc/service \
    TERM=xterm

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        curl \
        ca-certificates \
        python3 \
        busybox-syslogd \
        runit && \
    curl -sSLo /usr/local/bin/confd \
        https://github.com/kelseyhightower/confd/releases/download/v${CONFD_VERSION}/confd-${CONFD_VERSION}-linux-amd64 && \
    chmod a+x /usr/local/bin/confd && \
    curl -sSLo /sbin/my_init \
        https://raw.githubusercontent.com/phusion/baseimage-docker/master/image/bin/my_init && \
    chmod +x /sbin/my_init

ADD root/ /

# Keystone
EXPOSE 35357
EXPOSE 5000
# Nova
EXPOSE 8774
# Horizon
EXPOSE 80
EXPOSE 443
# Heat
EXPOSE 8004
EXPOSE 8000
# Designate
EXPOSE 9001
# Cinder
EXPOSE 8776
# Glance
EXPOSE 9292

ENTRYPOINT ["/sbin/my_init"]
