FROM 2gis/openstack-kilo-base
MAINTAINER 2GIS

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        nova-api && \
    apt-get clean

ADD root/ /

EXPOSE 8774
ENTRYPOINT ["/sbin/my_init"]
