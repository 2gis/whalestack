FROM 2gis/openstack-kilo-base
MAINTAINER 2GIS

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        glance-registry && \
    apt-get clean

ADD root/ /

EXPOSE 9191
ENTRYPOINT ["/sbin/my_init"]
