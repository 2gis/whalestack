FROM 2gis/openstack-kilo-base
MAINTAINER 2GIS

RUN apt-get update && \
    apt-get install -y \
        neutron-server \
        python-keystoneclient && \
    apt-get clean

ADD root/ /

COPY l3_agentschedulers_db.py /usr/lib/python2.7/dist-packages/neutron/db/l3_agentschedulers_db.py

EXPOSE 9696
ENTRYPOINT ["/sbin/my_init"]
