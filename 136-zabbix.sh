#!/bin/bash

####################################___>>anzhuang LNMP
#anzhuang yum fujian yuan
#安装yum附加源
#anzhuang yum fujian yuan
yum -y install epel-release

#anzhuang lnmp
#安装lnmp
yum -y install nginx php php-mysql mariadb mariadb-devel mariadb-server php-fpm 

#peizhi nginx
#配置Nginx
vim /etc/nginx/nginx.conf
location ~ \.php$ {
                root    html;
                fastcgi_pass    127.0.0.1:9000;
                fastcgi_index   index.php;
                include fastcgi.conf;
}
#zheyiduan fangzai server nei;
#这一段放在server内

#chakan anzhuang qingkuang
#查看安装情况
rpm -q nginx php php-mysql php-fpm mariadb-server mariadb-devel mariadb

#qidong nginx mariadb php-fpm sange fuwu
#启动nginx mariadb php-fpm三个服务
systemctl start nginx mariadb php-fpm
systemctl enable nginx mariadb php-fpm
systemctl status nginx mariadb php-fpm

#chakan shifou qidong chenggong
#查看是否启动成功
netstat -lnptu | egrep '80|3306|9000'

vim /usr/share/nginx/html/test.php
<?php
$i=99;
echo $i;
?>
#cat > <<eof 
#gaobuding
#搞不定

############################################___>>anzhuang zabbix
#安装zabbix














