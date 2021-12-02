#!/bin/bash

#服务器端
#HTTP方法
yum -y install httpd gitweb

sed -i '11a \
$projectroot="/var/git"' /etc/gitweb.conf
#配置gitweb的仓库地址

git init --bare /var/git/base_http
#服务器端创建仓库

nginx -s stop
#先把80端口腾出来（之前是nginx在用）

systemctl start httpd
#systemctl enable httpd
systemctl status httpd

##########################################################客户端，浏览器

curl -k 1.116.26.230/git
#浏览器打开 1.116.26.230/git
