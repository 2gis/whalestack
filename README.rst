==========
Whalestack
==========

This repository hosts a *research* results of packaging OpenStack `kilo` services into Docker.

Whalestack aimed to be easy and fast way to build, ship, test and deploy
OpenStack services. Specifically, we aim at providing a clean and modular packaging
implementation using Docker and GNU Make.

**Please note:** This repo shouldn't be taken as fully-working solution.

Infrastructure
==============

Overview
--------

At the moment of research we used this scheme::

    +---------------------+        +---------------------+      +----------+  +---------+  +---------+  +------+  +-------+
    |  CoreOS cluster     |        |   Ceph cluster      |      | RabbitMQ |  |  MySQL  |  |Memcached|  | PNDS |  |HAProxy|
    |  +---------------+  |        |  +---------------+  |      +-----+----+  +----+----+  +----+----+  +---+--+  +-+---+-+
    |  |               |  |        |  |               |  |            |            |            |           |       |   |
    |  |               |  |        |  |               |  |            |            |            |           |       |   |
    |  +---------------+  |        |  +---------------+  |            |            |            |           |       |   |
    |                     |        |                     |            |            |            |           |       |   |
    |  +---------------+  |        |  +---------------+  |            |            |            |           |       |   |
    |  |               |  |        |  |               |  |            |            |            |           |       |   |
    |  |               |  |        |  |               |  |            |            |            |           |       |   |
    |  +---------------+  |        |  +---------------+  |            |            |            |           |       |   |
    |                     |        |                     |            |            |            |           |       |   |
    |  +---------------+  |        |  +---------------+  |            |            |            |           |       |   |
    |  |               |  |        |  |               |  |            |            |            |           |       |   |
    |  |               |  |        |  |               |  |            |            |            |           |       |   |
    |  +---------------+  |        |  +---------------+  |            |            |            |           |       |   |
    +---------------------+        +---------------------+            |            |            |           |       |   |
              |                               |                       |            |            |           |       |   |
    +---------+-------------------------------+-----------------------+------------+------------+-----------+-------+------+
                                                                                                                        |
                                                         Private network                                                +-----+
                                                                                                                        Public network

Basically this is CoreOS cluster + backing services. You can deploy it in any way, convinient for you.
On each CoreOS host we place ``router``, ``registrator`` and bunch of OpenStack services.
So, all external requests comes to ``HAProxy``, then goes to ``router`` and then into Docker containers.

Included services
-----------------

* ``docker/infrastructure/registrator`` - Make wrapper for `registrator`_
* ``docker/infrastructure/router`` - HAProxy based solution for containers interaction.
    This is the *only* service, which bind ports to the host system.

OpenStack services
==================

* base
    - ubuntu
    - apache2
* keystone
* horizon
* libvirt
* nova
    - nova-consoleauth
    - nova-scheduler
    - nova-api-metadata
    - nova-conductor
    - nova-api
    - nova-compute
    - nova-spiceproxy
* neutron
    - neutron-metadata-agent
    - neutron-dhcp-agent
    - neutron-server
    - neutron-linuxbridge-agent
    - neutron-l3-agent
* glance
    - glance-registry
    - glance-api
* cinder
    - cinder-volume
    - cinder-scheduler
    - cinder-api
* designate
    - designate-api
    - designate-central
* heat
    - heat-api-cfn
    - heat-api
    - heat-engine
* tempest
* rally

Images structure
================

Base image
----------

It's Ubuntu Trusty with several addons:

* Init system called `my_init` from `phusion/baseimage-docker`_
* Service supervision `runit`_
* Dynamic configuration templating using `confd`_
* Ubuntu OpenStack repository `cloud-archive:kilo`

OpenStack Services
------------------

Services builds on top of base image. Each service includes:

* Package installation
* Configuraton files using `confd`_
* Service start scritps using `runit`_
* ``ENV`` variables for `registrator`_

More on configuration
---------------------

`etcd`_ is used as configuration storage. So, data somehow should be set into etcd.
You can dump all keys, which is used in configuration files using::

    make -C docker/ dump-confd-config-keys


Project includes MPV dynamic configuration, you can expand it more, if you want.


How to build images?
====================

.. code-block:: sh

     make -C docker/ build


How to start containers?
========================

You can find exampe `fleet`_ unit-files in ``docker/fleet-unit-files``


.. _phusion/baseimage-docker: https://github.com/phusion/baseimage-docker
.. _runit: http://smarden.org/runit/
.. _confd: https://github.com/kelseyhightower/confd
.. _registrator: https://github.com/gliderlabs/registrator
.. _etcd: https://coreos.com/etcd/
.. _fleet: https://github.com/coreos/fleet
