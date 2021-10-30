#!/bin/bash

read -p "input vision like:1.12.2 " vision
if [ -e $vision ] ; then
        echo "not get; bye "
        exit
fi
#定义需要安装的版本（变量）

yum install -y gcc pcre-devel openssl-devel
#gcc c语言解释器 pcre-devel支持正则 openssl-devel用来加密，配置https的私钥和证书（公钥）

useradd -s /sbin/nologin nginx
#添加不登录的nginx用户

mkdir -p /usr/local/nginx

cd /usr/local/nginx

wget -O /usr/local/nginx/nginx-$vision.tar.gz http://nginx.org/download/nginx-$vision.tar.gz
#官网下载tar.gz包

tar -xf nginx-$vision.tar.gz

cd /usr/local/nginx/nginx-$vision

./configure \
	--prefix=/usr/local/nginx \
	--user=nginx \
	--group=nginx \
	--with-http_ssl_module \
        --with-stream \
        --with-http_stub_status_module
#配置 名称、用户名、用户组和加密模块
#with-http_ssl_module http加密功能
#with-stream 开启4层反向代理功能
#with-http_stub_status_module Status monitoring

make && make install
#make并make安装
#升级时，只make不makeinstall

ln -s /usr/local/nginx/sbin/nginx /sbin
#sbin中加快捷启动操作

echo "启动目录 /usr/local/nginx/sbin/nginx"
echo "关闭 /usr/local/nginx/sbin/nginx -s stop"
echo "启动 /usr/local/nginx/sbin/nginx"
echo "查看版本 /usr/local/nginx/sbin/nginx -V"
echo "重新加载配置文件 /usr/local/nginx/sbin/nginx -s reload"

touch /usr/lib/systemd/system/nginx.service
echo "" > /usr/lib/systemd/system/nginx.service
#将nginx加入systemctl模块

sed -i '1a [Unit]\
Description=nginx \
After=network.target \
[Service] \
Type=forking \
PIDFile=/usr/local/nginx/logs/nginx.pid \
ExecStart=/usr/local/nginx/sbin/nginx \
ExecReload=/usr/local/nginx/sbin/nginx -s reload \
ExecStop=/usr/local/nginx/sbin/nginx -s stop \
PrivateTmp=true \
[Install] \
WantedBy=multi-user.target '  /usr/lib/systemd/system/nginx.service 

systemctl daemon-reload
#重新加载sys系统设置

killall -9 nginx

systemctl start nginx
systemctl enable nginx
systemctl status nginx





#do this
#cd /nas/001-脚本
#cp /usr/local/nginx/ 055nginx_conf_dir/nginx_1019 -r
#cp /usr/local/nginx/conf/ 055nginx_conf_dir/conf_1019 -r
#cp /usr/local/nginx/html/ 055nginx_conf_dir/html_1019 -r
#rm -rf /usr/local/nginx/

#bash 045install_nginx.sh
 
#mv /usr/local/nginx/html/ /usr/local/nginx/html.bak/
#mv /usr/local/nginx/conf/ /usr/local/nginx/conf.bak/
#cp 055nginx_conf_dir/conf_1019/ /usr/local/nginx/conf -r
#cp 055nginx_conf_dir/html_1019/ /usr/local/nginx/html -r

#nginx -t
#nginx -s reload

#cp 055nginx_conf_dir/nginx_1019/pass /usr/local/nginx/pass
#rm -rf /usr/local/nginx/html/nas/

#cp /nas /usr/local/nginx/html/






