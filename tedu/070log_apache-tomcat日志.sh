#!/bin/bash

sed -i '144a \
      <Valve className="org.apache.catalina.valves.AccessLogValve" directory="logs" \
               prefix="localhost_b_access_log" suffix=".txt" \
               pattern="%h %l %u %t &quot;%r&quot; %s %b" /> ' /usr/local/tomcat/apache-tomcat-8.0.30/conf/server.xml
#prefix="localhost_b_access_log" 日志名称
#directory="logs"; 日志路径；（在这个路径下的/usr/local/tomcat/apache-tomcat-8.0.30/）

/usr/local/tomcat/apache-tomcat-8.0.30/bin/shutdown.sh
/usr/local/tomcat/apache-tomcat-8.0.30/bin/startup.sh

sleep 5

ss -lnptu | grep java

curl -k https://localhost_b:8443
#localhost_b 是上一个设置
#-k 访问不安全的https
#8443是https的端口

ls /usr/local/tomcat/apache-tomcat-8.0.30/logs
ls /usr/local/tomcat/apache-tomcat-8.0.30/logs/localhost_b_access_log.*.txt
