#!/bin/bash

yum -y install gcc readline-devel
yum -y install ncurses-devel
yum -y install pcre-devel
yum -y install python-docutils

useradd -s /sbin/nologin vaenish

mkdir -p /usr/local/varnish
cd /usr/local/varnish

wget https://varnish-cache.org/_downloads/varnish-5.2.1.tgz

tar -xf varnish-5.2.1.tgz

cd varnish-5.2.1

./configure

make && make install

cp /usr/local/varnish/varnish-5.2.1/etc/example.vcl /usr/local/etc/default.vcl

nginx -s stop

varnishd -f /usr/local/etc/default.vcl
#moren huancun zai neicun

#varnishd -s malloc,128M
#neicun huancun 128MB

#varnishd -s file,/var/lib/varnish_storage.bin,1G
#yingpan huancun 

#varnishlog
#kanrizhi; xiangxi
#shishi xianshi

#varnishncsc
#leisi nginx; shishi xianshi

#varnashadmin
#jiaohu shi
#ban req.url ~ .*
#ban req.url ~ c.html

ss -lnptu | grep 80
curl 1.116.26.230 

