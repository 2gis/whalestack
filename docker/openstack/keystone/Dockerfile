FROM 2gis/openstack-kilo-apache2
MAINTAINER 2GIS

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        keystone \
        libapache2-mod-wsgi \
        python-keystoneclient \
        python-ldap && \
    apt-get clean

ADD root/ /

RUN ln -s /etc/apache2/sites-available/wsgi-keystone.conf /etc/apache2/sites-enabled && \
    mkdir -p /var/www/cgi-bin/keystone && \
    cp -a /usr/share/keystone/wsgi.py /var/www/cgi-bin/keystone/main && \
    cp -a /usr/share/keystone/wsgi.py /var/www/cgi-bin/keystone/admin && \
    chown -R keystone:keystone /var/www/cgi-bin/keystone && \
    chmod 755 /var/www/cgi-bin/keystone/*

RUN ln -sf /dev/stdout /var/log/apache2/keystone.log && \
    ln -sf /dev/stdout /var/log/apache2/keystone_access.log

EXPOSE 5000
EXPOSE 35357
ENTRYPOINT ["/sbin/my_init"]
