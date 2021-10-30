#!/bin/bash

##########------>3 http
yum -y install httpd gitweb

sed -i '11a \
$projectroot="/var/git"' /etc/gitweb.conf

git init --bare /var/git/base_http

nginx -s reload
#xian ba 80 duankou de nginx guandiao

systemctl start httpd
#systemctl enable httpd
systemctl status httpd

#change to client

#liulanqiu dakai 1.116.26.230/git
