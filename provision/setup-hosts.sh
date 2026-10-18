#!/bin/bash
#
# setup-hosts.sh - Adds every lab host to /etc/hosts
# Usage - setup-hosts.sh "ip name" ...
# Each argument is a string of this type "ip name"
# Safe to use several times, if "ip name" string is repeated it doesn't add again

set -eu

for entry in "$@"; do
    if ! grep -qxF "$entry" /etc/hosts; then
        echo "$entry" >> /etc/hosts
        echo "Added to /etc/hosts: ${entry}"
    fi
done