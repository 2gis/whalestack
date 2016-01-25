FROM 2gis/openstack-kilo-base
MAINTAINER 2GIS

RUN apt-get update && \
    apt-get install -y \
        dnsmasq \
        neutron-dhcp-agent && \
    apt-get clean

ADD root/ /

ENTRYPOINT ["/sbin/my_init"]
