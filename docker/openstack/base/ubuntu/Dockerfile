FROM ubuntu:trusty
MAINTAINER 2GIS

ENV DEBIAN_FRONTEND=noninteractive \
    CONFD_OPTS='-interval 10 -node 172.17.42.1:4001' \
    CONFD_VERSION=0.10.0 \
    TERM=xterm \
    SVDIR=/etc/service \
    DGIS_OPENSTACK_SCRIPTS_PATH='/opt/2gis/openstack'

RUN apt-get update && \
    apt-get install -y --no-install-recommends software-properties-common && \
    add-apt-repository cloud-archive:kilo && \
    apt-get update && \
    apt-get install -y \
        curl \
        git \
        runit \
        ca-certificates \
        python-keystoneclient \
        python-openstackclient \
        mariadb-client \
        python-mysqldb \
        python-psycopg2 && \
    apt-get clean

RUN curl -sSL https://github.com/kelseyhightower/confd/releases/download/v${CONFD_VERSION}/confd-${CONFD_VERSION}-linux-amd64 \
        -o /usr/local/bin/confd && \
    chmod +x /usr/local/bin/confd

RUN curl -sSL https://raw.githubusercontent.com/phusion/baseimage-docker/master/image/bin/my_init \
        -o /sbin/my_init && \
    chmod +x /sbin/my_init

ADD root/ /

ENTRYPOINT ["/sbin/my_init"]
