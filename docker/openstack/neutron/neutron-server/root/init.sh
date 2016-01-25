#!/usr/bin/env bash

ETCD_PORT=${ETCD_PORT:-4001}
HOST_IP=${HOST_IP:-172.17.42.1}
ETCD=$HOST_IP:$ETCD_PORT

confd -onetime -node $ETCD

neutron-db-manage --config-file /etc/neutron/neutron.conf --config-file /etc/neutron/plugins/ml2/ml2_conf.ini upgrade head
