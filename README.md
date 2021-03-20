# script main.sh must be run in "/root/" directory

# Assignment
Automate as much as possible the installation of the following:

Nginx, configure it to serve static pages and dynamic pages.

PostgreSQL DBMS and create DB, user for DB, set users password.

Python application which would serve "Hello World!"

Distro : Linux Ubuntu server 18.04 LTS

# Expected results

Nginx will be serving "hello world, ansible" on port 80

Python will be serving "Hello World!" on port 8000

database = "demo"

user = "test"

password = "hardpass"

# Summary

Main.sh install nginx,postgresql,ansible

Ansible will configure nginx and create the service called "webservers.service"

