#!/usr/bin/env bash

ETCD_PORT=${ETCD_PORT:-4001}
HOST_IP=${HOST_IP:-172.17.42.1}
ETCD=$HOST_IP:$ETCD_PORT

apache2ctl restart

confd -onetime -node $ETCD

keystone-manage db_sync
keystone-manage token_flush
