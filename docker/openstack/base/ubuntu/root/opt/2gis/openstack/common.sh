#!/usr/bin/env bash

function die() {
    echo -e "ERROR: $*" >&2
    exit 1
}

function wait_for_endpoint() {
    local usage="wait_for_endpoint <endpoint> [poll_interval] [retries]"
    local endpoint=${1:?$usage}
    local poll_interval=${2:-1}
    local attempts=${3:-10}

    attempt=1
    until $(curl --output /dev/null --silent --head --fail $endpoint); do
        echo "Endpoint \"$endpoint\" is not available. Attempt $attempt of $attempts."

        if [[ $attempt -eq $attempts ]]; then
            die "all attempts were failed"
        fi

        sleep $poll_interval
        ((attempt++))
    done
}
