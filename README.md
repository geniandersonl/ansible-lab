**Esse Playbook está sendo executado no Ubuntu 22.04 LTS utilizando libvirt ao invés do ~~virtualbox~~. Nele consta algumas variáveis com senhas porque é um ambiente apenas de estudos**

#### Caso não tenha os pacotes necessários siga os seguintes passos

```
$ sudo apt install qemu libvirt-daemon-system libvirt-clients libxslt-dev libxml2-dev libvirt-dev zlib1g-dev ruby-dev ruby-libvirt ebtables dnsmasq-base
$ sudo vagrant plugin install vagrant-mutate
```


#### Agora vamos testar uma imagem
```
$ vagrant init centos/7
$ sudo vagrant up --provider=libvirt
```

#### Para facilitar as coisas vamos colocar a variável de exportação dentro do .bashrc do root ao final do arquivo
```
$ sudo vim /root/.bashrc
export VAGRANT_DEFAULT_PROVIDER=libvirt
```
#### Agora vamos carregar as variáveis de ambiente novamente
```$ source /root/.bashrc```

#### Para verificar que sua vm está sendo executada
```$ sudo virsh list```

#### Para ver o status do seu vagrant dentro do diretorio execute
```$ sudo vagrant status```

#### Após te ajustado os requisitos vamos executar algumas tarefas para utilizá-lo
```
$ git clone https://github.com/geniandersonl/ansible-lab.git
$ cd ansible-lab
$ mkdir -p control-node/certs
$ ssh-keygen -t rsa -P '' -b 4096 -f control-node/certs/id_rsa -C vagrant-control-node
$ cat control-node/certs/id_rsa.pub
```

#### Copia a saida e cole dentro do arquivo db01/provision.sh e app01/provision.sh
```
#/bin/sh

cat <<EOT >>/home/vagrant/.ssh/authorized_keys
**COLE AQUI A SAIDA**  
EOT
```
#### Após esses passos vamos provisinar o ambiente e testar
```
$ cd control-node
$ sudo vagrant up

$ cd ../db01
$ sudo vagrant up

$ cd ../app01
$ sudo vagrant up

# cd ../control-node
```

#### Agora vamos acessar o control-node para fazer algumas verificações
```
$ sudo vagrant ssh
```

#### Agora de dentro do control-node vamos testar as conexões com o db01 e app01
```
$ ssh db01
$ exit
$ ssh app01
$ exit
```
#### Por fim vamos executar os playbook para construir o ambiente
```
$ cd /vagrant/playbooks/
$ ansible-galaxy install geerlingguy.mysql
$ ansible-playbook -i hosts db.yml
$ ansible-playbook -i hosts app.yml
```

#### Testando a API
```
$ cd  /vagrant
$ curl -H "Content-Type: application/json" --data @note.json http://app01:8080/api/notes
$ curl http://app01:8080/api/notes
```