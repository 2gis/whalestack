FROM 2gis/openstack-kilo-base
MAINTAINER 2GIS

RUN apt-get update && \
    apt-get install --yes --no-install-recommends \
        build-essential \
        python-dev \
        python-pip \
        libssl-dev \
        libffi-dev \
        libxml2-dev \
        libxslt1-dev \
        libpq-dev \
        wget && \
    apt-get clean

# FIXIT: newer pbr requieres newer setuptools, so upgrade it in fancy way
RUN pip install --no-use-wheel --upgrade setuptools
RUN pip install --upgrade pbr

# FIXIT: must remove older oslo.config due to error in rally install
# better way is not use 2gis/openstack-kilo-base as base
RUN apt-get autoremove --purge --yes python-oslo-config

RUN git clone https://github.com/openstack/rally.git
RUN cd rally && \
    ./install_rally.sh --system --verbose --yes && \
    chmod -R 750 /etc/rally && \
    mv doc /usr/share/doc/rally && \
    mv samples ~/ && \
    rm -rf /tmp/* && \
    useradd -m rally

ADD root/ /

ENV HOME /home/rally
WORKDIR /home/rally

ENTRYPOINT ["/sbin/my_init"]
