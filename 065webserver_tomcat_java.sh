#!/bin/bash

yum -y install java-1.8.0-openjdk java-1.8.0-openjdk-headless
#insatll on web1(1.116.26.230); web also install php-pecl-memcache
#java-1.8.0-openjdk-headless --> no GUI
#yum list | grep jdk
#java -version

vision=8.0.30
mkdir -p /usr/local/tomcat/

#wget -O /usr/local/tomcat/tomcat-$vision.tar.gz https://dlcdn.apache.org/tomacat/tomcat-8/v$vision/bin/apache-tomcat-$vision.tar.gz
wget -O /usr/local/tomcat/tomcat-$vision.tar.gz https://archive.apache.org/dist/tomcat/tomcat-8/v$vision/bin/apache-tomcat-$vision.tar.gz
#官网下载tar.gz包

cd /usr/local/tomcat
tar -xf tomcat-$vision.tar.gz

cd /usr/local/tomcat/apache-tomcat-$vision

mv /dev/random /dev/random.bak
# cp /dev/urandom /dev/random
ln -s /dev/urandom /dev/random ruan lianjie ye keyi
#strings /dev/random tomcat start need many random
#strings /dev/urandom 

/usr/local/tomcat/apache-tomcat-8.0.30/bin/startup.sh
#start up apache-tomcat

ps -ef | grep java
netstat -lnptu | grep java
#ss -lnptu | grep java
#ss quick than netstat

#8009 & 8080 mean success;8009 wusuowei
#cat /dev/random tomcat start need many random

#java
#IBM 	 	websphere + java	付费
#Oracle 		weblogic + java		付费
#Apache 		tomcat + java 		免费 			用的人最多
#Redhat 		oss + java 		付费，12306用这个 	

#tomcat 是用java写的，不支持php，只能用java

#nginx + php/python 	动态网站
#httpd + php 		动态网站
