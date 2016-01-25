FROM 2gis/openstack-kilo-base
MAINTAINER 2GIS

RUN apt-get update && \
    apt-get install -y \
        neutron-l3-agent \
        neutron-plugin-ml2 && \
    apt-get clean

ADD root/ /

ENTRYPOINT ["/sbin/my_init"]
