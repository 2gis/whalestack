FROM 2gis/openstack-kilo-apache2
MAINTAINER 2GIS

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        openstack-dashboard && \
    apt-get clean

RUN rm /etc/apache2/sites-enabled/*

ADD root/ /

EXPOSE 80
EXPOSE 443
ENTRYPOINT ["/sbin/my_init"]
