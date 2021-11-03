#!/bin/bash

keytool -genkeypair -alias tomcat -keyalg RSA -keystore /usr/local/tomcat/apache-tomcat-8.0.30/conf/keystore
#私钥和证书合一
#私钥和证书的名称/usr/local/tomcat/apache-tomcat-8.0.30/conf/keystore

sed -i '84d' /usr/local/tomcat/apache-tomcat-8.0.30/conf/server.xml
sed -i '87d' /usr/local/tomcat/apache-tomcat-8.0.30/conf/server.xml

sed -i '85a \
               keystoreFile="/usr/local/tomcat/apache-tomcat-8.0.30/conf/keystore" keystorePass="123456" ' /usr/local/tomcat/apache-tomcat-8.0.30/conf/server.xml

/usr/local/tomcat/apache-tomcat-8.0.30/bin/shutdown.sh
/usr/local/tomcat/apache-tomcat-8.0.30/bin/startup.sh

sleep 5

ss -lnptu | grep java

curl -k https://localhost_b:8443
#localhost_b 是之前的虚拟主机设置
#-k shi fangwen bu anquan de https
#8443shi https de duankou; buneng moren shenglue


