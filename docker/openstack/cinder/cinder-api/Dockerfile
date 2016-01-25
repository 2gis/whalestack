FROM 2gis/openstack-kilo-base
MAINTAINER 2GIS

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        cinder-api \
        python-keystoneclient && \
    apt-get clean

ADD root/ /

EXPOSE 8776
ENTRYPOINT ["/sbin/my_init"]
