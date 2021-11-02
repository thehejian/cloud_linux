#!/bin/bash

##########################################################################################################————》安装lnmp软件
mydate=date +'%Y%m%d'
#安装nginx
#bash 045install_nginx.sh

#安装mariadb mariadb-server mariadb-devel php php-fpm php-mysql php-pecl-memcache
yum install -y mariadb mariadb-server mariadb-devel php php-fpm php-mysql php-pecl-memcache #nginx

##########################################################################################################————》配置php
cp /etc/php-fpm.d/www.conf /etc/php-fpm.d/www.conf.mydate.bak
#备份php的配置文件

#php configure
egrep -v '^$|^.*;' /etc/php-fpm.d/www.conf.bak > /etc/php-fpm.d/www.conf

sed -i 's/pm.max_children = 50/pm.max_children = 32/g' /etc/php-fpm.d/www.conf
#静态启动时，最大进程数
#pm.max_children要大于pm.max_spare_servers
sed -i 's/pm.start_servers = 5/pm.start_servers = 15/g' /etc/php-fpm.d/www.conf
#动态启动时，默认进程数
sed -i 's/pm.min_spare_servers = 5/pm.min_spare_servers = 5/g' /etc/php-fpm.d/www.conf
#动态启动，最小空闲进程数
sed -i 's/pm.max_spare_servers = 35/pm.max_spare_servers = 32/g' /etc/php-fpm.d/www.conf
#动态启动，最大空闲进程数；要小于静态启动时的最大值

##########################################################################################################————》配置nginx
#######################################nginx conf 动静分离
sed -i '42a \
        #location ~ \.php$ { \
        #    proxy_pass   http://127.0.0.1; \
        #} \
        location ~ \.php$ { \
            root           html; \
            fastcgi_pass   127.0.0.1:9000; \
            fastcgi_index  index.php; \
        #   fastcgi_param  SCRIPT_FILENAME  /scripts$fastcgi_script_name; \
            include        fastcgi.conf; \
        } \
        #location ~ /\.ht { \
        #    deny  all; \
        #} ' /usr/local/nginx/conf/nginx.conf
#fastcgi_param  SCRIPT_FILENAME  /scripts$fastcgi_script_name; 这行不需要，得注释掉
#include        fastcgi.conf; fastcgi_params -> fastcgi.conf；默认是错误的，得改成fastcgi.conf------<<重要

#######################################nginx conf index加index.php
sed -i '37s/index  index.html index.htm;/index  index.html index.htm index.php;/g' /usr/local/nginx/conf/nginx.conf

##########################################################################################################————》写php脚本
touch /usr/local/nginx/html/index.php
echo "<?php" > /usr/local/nginx/html/index.php

sed -i '1a \
$servername = "localhost"; \
$username = "root"; \
$password = ""; \
try { \
    $conn = new PDO("mysql:host=$servername;dbname=mysql;port=3306", $username, $password); \
    echo "index.php连接mysql成功"; \
} \
catch(PDOException $e) \
{ \
    echo $e->getMessage(); \
} \
?>' /usr/local/nginx/html/index.php
#先touch文件
#再echo第一行
#再sed给第一行之后加内容

systemctl reload nginx

systemctl start mariadb php-fpm

systemctl status mariadb php-fpm

systemctl enable mariadb php-fpm
