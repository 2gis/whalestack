#!/usr/bin/env bash

# Copyright 2014, Rackspace US, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

set -e

LOCKFILE="/var/run/neutron_ha_tool.lock"

# Trap any errors that might happen in executing the script
trap my_trap_handler ERR

function my_trap_handler {
    kill_job
}

function unlock {
    rm "${LOCKFILE}"
}

function do_job {
    # Do a given job
    logger "$(. /admin-openrc.sh && python /usr/bin/neutron-ha-tool.py --l3-agent-migrate)"
}

function cooldown {
    # Sleep for a given amount of time
    sleep 30
}

function kill_job {
    # If the job needs killing kill the pid and unlock the file.
    PID="$(cat ${LOCKFILE})"
    unlock
    if [ -f "${LOCKFILE}" ]; then
        kill -9 "${PID}"
    fi
}

if [ ! -f "${LOCKFILE}" ]; then
    echo $$ | tee "${LOCKFILE}"
    do_job
    cooldown
    unlock
else
    if [ "$(find ${LOCKFILE} -mmin +15)" ]; then
        logger "Stale pid found for ${LOCKFILE}. Killing any left over processes and unlocking"
        kill_job
    fi
fi

