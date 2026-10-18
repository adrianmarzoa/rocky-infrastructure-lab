#!/bin/bash
#
# Authorizes control node in each managed node
# Usage: authorize-ctrl.sh

set -eu

PUBKEY=/vagrant/.shared/control.pub
AUTH=/home/vagrant/.ssh/authorized_keys

# Check for the public key to exist
if [[ ! -f $PUBKEY ]]; then
    echo "$PUBKEY does not exist. Create it in ctrl01 first."
    exit 1
fi

# Add the pub key if is not added yet
if ! grep -qxF "$(cat $PUBKEY)" $AUTH; then
    cat $PUBKEY >> $AUTH
fi