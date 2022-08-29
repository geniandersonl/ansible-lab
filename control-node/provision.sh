#!/bin/bash

cp /vagrant/certs/id_rsa* /home/vagrant/.ssh/ 
chown vagrant: /home/vagrant/.ssh/id_rsa*
chmod 0600 /home/vagrant/.ssh/id_rsa

sudo yum -y install epel-release
echo "Inicio da instalacao do Ansible"
sudo yum -y install ansible
#ansible-galaxy install geerlingguy.mysql
cat <<EOT >>/etc/hosts
192.168.1.2 control-node
192.168.1.3 app01
192.168.1.4 db01
EOT

