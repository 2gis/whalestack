FROM 2gis/openstack-kilo-base
MAINTAINER 2GIS

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        python-pip \
        python-dev \
        libffi-dev \
        libssl-dev \
        gcc && \
    apt-get clean

# FIXIT: newer pbr requieres newer setuptools, so upgrade it in fancy way
RUN pip install --no-use-wheel --upgrade setuptools
RUN pip install --upgrade pbr

RUN git clone https://github.com/openstack/tempest.git /opt/tempest && \
    pip install /opt/tempest && \
    mkdir /etc/tempest

ADD root/ /
