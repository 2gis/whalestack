FROM 2gis/openstack-kilo-base
MAINTAINER 2GIS

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        heat-api && \
    apt-get clean

ADD root/ /

EXPOSE 8004
ENTRYPOINT ["/sbin/my_init"]
