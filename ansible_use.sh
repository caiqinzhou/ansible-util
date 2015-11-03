#!/bin/bash
set -eux

ANSIBLE_HOME=~/workspace_python/ansible
cd $ANSIBLE_HOME
source ./hacking/env-setup

export ANSIBLE_INVENTORY=~/workspace_python/ansible_hosts

# No check known_hosts when host changes(eg. reinstalled)
export ANSIBLE_HOST_KEY_CHECKING=False
# /etc/ansible/ansible.cfg or ~/.ansible.cfg
# [defaults]
# host_key_checking = False
