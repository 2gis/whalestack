#!/usr/bin/env bash

cd /usr/share/openstack-dashboard/ && python manage.py compress
cd /
sv restart apache2

