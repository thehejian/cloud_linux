#!/bin/bash

#rm -rf /home/nginx

mkdir -p /home/nginx
cd /home/nginx

if [ ! -e nginx-1.12.2 ] ; then
	wget http://nginx.org/download/nginx-1.12.2.tar.gz
fi

tar -xzvf nginx-1.12.2.tar.gz


#apt-get autoremove -y gcc openssl-devel pcre-devel
#apt install -y gcc openssl geoip-database libgeoip1 libnginx-mod-http-geoip libnginx-mod-http-image-filter libnginx-mod-http-xslt-filter libnginx-mod-mail libnginx-mod-stream autoconf automake make
autoremove -y gcc openssl-devel pcre-devel
yum install -y gcc openssl-devel pcre-devel

cd nginx-1.12.2

./configure
make
make install


