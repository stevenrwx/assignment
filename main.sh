#!/bin/bash

echo "updating system........"
apt update -y && apt upgrade -y
sleep 1
echo "installing nginx......."
apt install nginx -y
sleep 1
echo "installing ansible......"
apt-add-repository --yes --update ppa:ansible/ansible
apt update -y
apt install software-properties-common -y
apt install ansible -y
apt install python3 -y
echo "installing postgreSQL......"
sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add - 
sudo apt-get update
sudo apt-get -y install postgresql
echo "creating database......."
set -e 
DB_NAME="demo"
DB_USER="test"
DB_USER_PASS="hardpass"
sudo su postgres <<EOF
createdb $DB_NAME;
psql -c "CREATE USER $DB_USER WITH PASSWORD '$DB_USER_PASS';"
psql -c "grant all privileges on database $DB_NAME to $DB_USER;"
echo "Postgres User '$DB_USER' and database '$DB_NAME' created."
EOF
echo "copy playbooks.........."
mkdir /etc/ansible/playbook
cp /root/assignment/files/nginx.yml /etc/ansible/playbook/nginx.yml
echo "ansible time....."
ansible-playbook /etc/ansible/playbook/nginx.yml -l 127.0.0.1
echo "checking services online......"
ufw allow 80
ufw allow 8000
systemctl status nginx && systemctl status postgresql && systemctl status webservers.service
if [ $? -gt 0 ]
then 
	echo "we have a problem"
	exit 2
else 
echo "script ran succesfully"
exit 0
fi

