#!/bin/bash

sudo yum -y install epel-release
echo "Inicio da instalacao do Ansible"
sudo yum -y install ansible
cat <<EOT >> /etc/hosts
192.168.1.2 control-node
192.168.1.3 app01
192.168.1.4 db1
EOT

cat <<EOF >>/home/vagrant/.ssh/authorized_keys
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCGdo6Qqr5mRfuzQRsd+rtS6dMSDOnt2w/SuoQ8OclXSgZNHJYcx+nxx1Q+01dTQBXza843YuG91XD1XVHPBzVxw8r7YaZPLWHqlreVimm72dOAFvIbPoADGmAyem2Ldd33IsRiXr9CtFsFrVC9HlPw1lZ9omagcBJ8bkh4wWsw4ar++wseCnBRGE3n4mM+L4Z+grbk/H8pI5cWEwybM0j6L7GkUR41+1gaVp5msJivAVOduu5CoRZf+lgTw6i8rPkggGcfixnEl37QEOoWB7h+1r6Y6Nc7lghs562x8WqqAyJ42sE+1IA+/lEqHTNMpGO03qkqnqG1XF0eeAup3+0lyD5fgyKUjST/UkyHTGctt1gzWt1WN/R3uk3eNQ7kwE+muemhvOqBROh/s0Eyaq3cF5CCYbOFKE97z3hGOCtobCwM2OgIzQhjoChM6IhRJfnwMZDtWFlznmwQ4fQVMkmtx0yKnJt56CT2Dbg7My9Yq6u0hVkOCyEJDBnP7MW+5M+5nf3nefDuYT5Nez871YZitrdNC6zE7MLMkqJS8fC5+wiGmjLGHQaZTLTvFH56Mnfqyzcb/4iacU+3XDpaPCJnM79/AE6a1K+GhYwWfVgfPrJ/w2j2cP/ZZLUMzrT9rqn6Y1j0gDkkClIxJtbGyW66cLppeBFfdTEwEDldVyNnxw== genianderson@genianderson-z370m
EOF
