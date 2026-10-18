#!/bin/bash
#
# boot-ctrl.sh - Installs Ansible and git in the control node
# Usage: boot-ctrl.sh

set -eu

dnf -qy install ansible-core

# If vagrant user in ctrl node doestn't have a ssh key pair, we create it
KEY="/home/vagrant/.ssh/id_ed25519"
if [[ ! -f "$KEY" ]]; then
    sudo -u vagrant ssh-keygen -t ed25519 -N "" -f "$KEY"
fi

# Copy Ctrl node SSH public key to shared folder (auto created by vagrant)
mkdir -p "/vagrant/shared"
cp "$KEY".pub "/vagrant/shared/control.pub"