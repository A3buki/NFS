#!/bin/bash

##
# Скрипт для сервреа NFS
# Скрипт - создает каталог и экспортирует его
# на клиента regul, клиент должен быть доступен
# по сети.
##

yum install nfs-utils autofs

echo sirius > /etc/hostname
echo "192.168.10.10  sirius" >> /etc/hosts
echo "192.168.10.11  regul" >> /etc/hosts

cd /
sudo mkdir nfsshare
sudo chmod 777 nfsshare

sudo systemctl start firewalld
sudo firewall-cmd --permanent --add-service nfs
sudo firewall-cmd --reload

sudo systemctl enable nfs-server
sudo systemctl start nfs-server

echo "/nfsshare    regul(rw)" > /etc/exports

#Экспортируем запись на клиента Regul
sudo exportfs -avr

# Проверка экспорта:
cat /var/lib/nfs/etab > /tmp/nfsshare.log

# Создадим файл в каталоге для теста,
# его можно будет увидеть на клиенте Regul
cd /
cd /nfsshare
sudo mkdir upload
sudo chmod 777 upload

### Далее скрипт смотреть скрипт для клиента Regul.
