FROM 2gis/openstack-kilo-base
MAINTAINER 2GIS

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        libguestfs-tools \
        python-rbd \
        python-rados \
        python-guestfs \
        ceph-common \
        nova-compute && \
    update-guestfs-appliance && \
    apt-get clean

RUN mkdir /etc/ceph/

ADD root/ /

ENTRYPOINT ["/sbin/my_init"]