#!/bin/bash
set -eu
set -x

ANSIBLE_HOME=~/workspace_python/ansible

if [ ! -d "$ANSIBLE_HOME" ]
then
	cd ~/workspace_python/
	git clone git://github.com/ansible/ansible.git --recursive --depth 1
	sudo easy_install pip
	sudo pip install paramiko PyYAML Jinja2 httplib2 six
else
	cd $ANSIBLE_HOME
	git pull --rebase
	git submodule update --init --recursive
fi

