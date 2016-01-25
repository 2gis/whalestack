FROM 2gis/openstack-kilo-base
MAINTAINER 2GIS

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        nova-spiceproxy \
        websockify && \
    apt-get clean

ADD root/ /

EXPOSE 6082
ENTRYPOINT ["/sbin/my_init"]
