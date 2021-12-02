#!/bin/bash
#安装Apache
#代理服务器的配置流程之一

yum install -y httpd

touch /var/www/html/index.html
echo "this apache" > /var/www/html/index.html


systemctl start httpd
systemctl status httpd
