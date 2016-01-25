FROM 2gis/openstack-kilo-base
MAINTAINER 2GIS

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_PID_FILE /var/run/apache2.pid
ENV APACHE_RUN_DIR /var/run/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2
ENV APACHE_SERVERADMIN admin@localhost
ENV APACHE_SERVERNAME localhost
ENV APACHE_SERVERALIAS docker.localhost
ENV APACHE_DOCUMENTROOT /var/www

RUN apt-get update && \
    apt-get install -y apache2

RUN a2enmod rewrite

RUN ln -sf /dev/stdout /var/log/apache2/access.log && \
    ln -sf /dev/stdout /var/log/apache2/error.log && \
    ln -sf /dev/stdout /var/log/apache2/other_vhosts_access.log

# Avoid error:
# AH00526: Syntax error on line 74 of /etc/apache2/apache2.conf:
# Invalid Mutex directory in argument file:/var/lock/apache2
RUN service apache2 restart

ADD root/ /

EXPOSE 80

ENTRYPOINT ["/sbin/my_init"]
