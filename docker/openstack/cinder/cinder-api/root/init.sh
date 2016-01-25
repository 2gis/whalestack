#!/usr/bin/env bash

ETCD_PORT=${ETCD_PORT:-4001}
HOST_IP=${HOST_IP:-172.17.42.1}
ETCD=$HOST_IP:$ETCD_PORT

confd -onetime -node $ETCD

cinder-manage db sync
