#!/bin/bash

yum install -y httpd

touch /var/www/html/index.html
echo "this apache" > /var/www/html/index.html


systemctl start httpd
systemctl status httpd
