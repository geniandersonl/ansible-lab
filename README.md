**Esse Playbook está sendo executado no Ubuntu 22.04 LTS utilizando libvirt e não no ~~virtualbox~~**

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

#### Para verificar que sua vm está sendo executada
```$ sudo virsh list```

#### Para ver o status do seu vagrant dentro do diretorio execute
```$ sudo vagrant status```