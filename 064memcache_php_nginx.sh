#!/bin/bash

#yum list | grep memcache
yum install -y php-pecl-memcache
#php-memcache installed in webserver, not proxy server;

sed -i 's#= files#= memcache#g' /etc/php-fpm.d/www.conf
sed -i 's#/var/lib/php/session#"tcp://1.116.26.230:11211"#g' /etc/php-fpm.d/www.conf

#read PHP script
touch /usr/local/nginx/html/mem.php
echo "<?php" > /usr/local/nginx/html/mem.php

sed -i '1a \
$memcache = new Memcache; \
$memcache->connect("1.116.26.230",11211) or die("could not connect!"); \
$memcache->set("key","test"); \
$get_value=$memcache->get("key"); \
echo $getvalue; \
?>' /usr/local/nginx/html/mem.php


systemctl restart php-fpm

#注意！！！
#子段里面有'' 时，需要换成双引号；

