#!/bin/bash

sudo yum -y install epel-release
echo "Inicio da instalacao do Ansible"
sudo yum -y install ansible
#ansible-galaxy install geerlingguy.mysql

ssh-keygen -t rsa -P '' -b 4096 -f /home/vagrant/.ssh/id_rsa -C vagrant-control-node
chown vagrant: /home/vagrant/.ssh/id_rsa*
