#!/bin/bash


echo "updating system........"
apt update -y && apt upgrade -y`
sleep 1
echo "installing nginx......."
apt install nginx -y`
sleep 1
echo "installing ansible......"
apt-add-repository --yes --update ppa:ansible/ansible
apt update -y
apt install software-properties-common -y
apt install ansible -y

echo "installing postgreSQL......"
sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add - 
sudo apt-get update
sudo apt-get -y install postgresql

echo "checking services online......"
systemctl status nginx && systemctl enable nginx
systemctl status postgresql && systemctl enable postgresql


echo $?
sleep 1


