#!/usr/bin/env bash

ETCD_PORT=${ETCD_PORT:-4001}
HOST_IP=${HOST_IP:-172.17.42.1}
ETCD=$HOST_IP:$ETCD_PORT

confd -onetime -node $ETCD

/usr/local/bin/rally-manage db recreate
/usr/local/bin/rally deployment create --filename=/home/rally/deployment.json --name=deployment
/usr/local/bin/rally deployment use deployment

/usr/local/bin/rally verify start
/usr/local/bin/rally verify results --html --output-file=/home/rally/results.html
/usr/local/bin/rally verify results --json --output-file=/home/rally/results.json
