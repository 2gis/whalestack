FROM 2gis/openstack-kilo-base
MAINTAINER 2GIS

RUN apt-get update && apt-get install -y --no-install-recommends \
        libvirt-bin \
        qemu \
        qemu-utils \
        dmidecode \
        ebtables \
        pm-utils && \
    apt-get clean && \
    rm /etc/libvirt/qemu/networks/autostart/*

ADD root/ /

ENTRYPOINT ["/sbin/my_init"]
