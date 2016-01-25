FROM 2gis/openstack-kilo-base
MAINTAINER 2GIS

RUN echo designate-common designate/configure_db select false | debconf-set-selections

RUN apt-get update && apt-get install -y --no-install-recommends \
        designate-api && \
    apt-get clean

ADD root/ /

EXPOSE 9001
ENTRYPOINT ["/sbin/my_init"]
