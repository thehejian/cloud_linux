#!/bin/bash

####################################___>>anzhuang LNMP
#anzhuang yum fujian yuan
yum -y install epel-release

#anzhuang lnmp
yum -y install nginx php php-mysql mariadb mariadb-devel mariadb-server php-fpm 

#peizhi nginx
vim /etc/nginx/nginx.conf
location ~ \.php$ {
                root    html;
                fastcgi_pass    127.0.0.1:9000;
                fastcgi_index   index.php;
                include fastcgi.conf;
}
#zheyiduan fangzai server nei;

#chakan anzhuang qingkuang
rpm -q nginx php php-mysql php-fpm mariadb-server mariadb-devel mariadb

#qidong nginx mariadb php-fpm sange fuwu
systemctl start nginx mariadb php-fpm
systemctl enable nginx mariadb php-fpm
systemctl status nginx mariadb php-fpm

#chakan shifou qidong chenggong
netstat -lnptu | egrep '80|3306|9000'

vim /usr/share/nginx/html/test.php
<?php
$i=99;
echo $i;
?>
#cat > <<eof gaobuding

############################################___>>anzhuang zabbix














