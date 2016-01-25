FROM 2gis/openstack-kilo-base
MAINTAINER 2GIS

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        cinder-volume \
        python-keystoneclient \
        ceph-common \
        python-cinder \
        python-rbd && \
    apt-get clean

RUN mkdir /etc/ceph/

ADD root/ /

ENTRYPOINT ["/sbin/my_init"]
