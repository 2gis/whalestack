FROM 2gis/openstack-kilo-base
MAINTAINER 2GIS

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        cinder-scheduler \
        python-keystoneclient && \
    apt-get clean

ADD root/ /

ENTRYPOINT ["/sbin/my_init"]
