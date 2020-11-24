#!/bin/bash

##
# Скрипт для клиента nfs
# устанавливает необходимые пакеты
# подключает сетевой NFS ресурс.
##

yum install nfs-utils

echo regul > /etc/hostname
echo "192.168.10.10  sirius" >> /etc/hosts
echo "192.168.10.11  regul" >> /etc/hosts

# Создаем каталог для монтирования
cd /
sudo mkdir nfsmount
sudo chmod 777 nfsmount

sudo mount -t nfs sirius:/nfsshare /nfsmount
