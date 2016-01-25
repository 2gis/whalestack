FROM 2gis/openstack-kilo-base
MAINTAINER 2GIS

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        glance-api \
        python-rbd \
        python-rados && \
    apt-get clean

RUN mkdir /etc/ceph/

ADD root/ /

EXPOSE 9292
ENTRYPOINT ["/sbin/my_init"]
