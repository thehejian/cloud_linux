#!/bin/bash

#anzhuang nginx
#bash 045install_nginx.sh

yum install -y mariadb mariadb-server mariadb-devel php php-fpm php-mysql php-pecl-memcache #nginx

cp /etc/php-fpm.d/www.conf /etc/php-fpm.d/www.conf.bak

#php configure
egrep -v '^$|^.*;' /etc/php-fpm.d/www.conf.bak > /etc/php-fpm.d/www.conf

sed -i 's/pm.max_children = 50/pm.max_children = 32/g' /etc/php-fpm.d/www.conf
sed -i 's/pm.start_servers = 5/pm.start_servers = 15/g' /etc/php-fpm.d/www.conf
sed -i 's/pm.min_spare_servers = 5/pm.min_spare_servers = 5/g' /etc/php-fpm.d/www.conf
sed -i 's/pm.max_spare_servers = 35/pm.max_spare_servers = 32/g' /etc/php-fpm.d/www.conf

#nginx conf dongjing fenli
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
#fastcgi_param  SCRIPT_FILENAME  /scripts$fastcgi_script_name; xuyao zhushi diao
#include        fastcgi.conf; fastcgi_params -> fastcgi.conf

sed -i '37s/index  index.html index.htm;/index  index.html index.htm index.php;/g' /usr/local/nginx/conf/nginx.conf

#xie PHP jiaoben 
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

systemctl reload nginx

systemctl start mariadb php-fpm

systemctl status mariadb php-fpm

systemctl enable mariadb php-fpm
