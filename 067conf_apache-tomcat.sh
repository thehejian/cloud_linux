#!/bin/bash

date=$(date +%Y%m%d)
cp /usr/local/tomcat/apache-tomcat-8.0.30/conf/server.xml /usr/local/tomcat/apache-tomcat-8.0.30/conf/server.$date.xml

sed -i '139a \
      <Host name="localhost_a"  appBase="a" \
            unpackWARs="true" autoDeploy="true"> \
      </Host> \
      <Host name="localhost_b"  appBase="b" \
            unpackWARs="true" autoDeploy="true"> \
      </Host>' /usr/local/tomcat/apache-tomcat-8.0.30/conf/server.xml
#default path /usr/local/tomcat/apache-tomcat-8.0.30/webapps/ROOT/

#mkdir -p /usr/local/tomcat/apache-tomcat-8.0.30/{a,b}/ROOT
mkdir -p /usr/local/tomcat/apache-tomcat-8.0.30/a/ROOT

touch /usr/local/tomcat/apache-tomcat-8.0.30/a/ROOT/index.html
echo "AAA" > /usr/local/tomcat/apache-tomcat-8.0.30/a/ROOT/index.html

#touch /usr/local/tomcat/apache-tomcat-8.0.30/b/ROOT/index.html
#echo "BBB" > /usr/local/tomcat/apache-tomcat-8.0.30/b/ROOT/index.html

mkdir -p /usr/local/tomcat/apache-tomcat-8.0.30/b/base
touch /usr/local/tomcat/apache-tomcat-8.0.30/b/base/index.html
echo "BBB" > /usr/local/tomcat/apache-tomcat-8.0.30/b/base/index.html

echo "127.0.0.1   localhost_a localhost_b" >> /etc/hosts

sed -i '144a \
      <Context path="" docBase="base" />' /usr/local/tomcat/apache-tomcat-8.0.30/conf/server.xml
#docBase default path ROOT

sed -i '145s#<Context path="" docBase="base" />#<Context path="/test" docBase="/usr/local/nginx/html/bak" />#' /usr/local/tomcat/apache-tomcat-8.0.30/conf/server.xml
#Context path like nginx's rewrite

/usr/local/tomcat/apache-tomcat-8.0.30/bin/shutdown.sh
/usr/local/tomcat/apache-tomcat-8.0.30/bin/startup.sh

sleep 5

ss -lnptu | grep java

curl localhost_a:8080
curl localhost_b:8080
curl localhost_b:8080/test
