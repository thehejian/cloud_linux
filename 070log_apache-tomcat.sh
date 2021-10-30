#!/bin/bash

sed -i '144a \
      <Valve className="org.apache.catalina.valves.AccessLogValve" directory="logs" \
               prefix="localhost_b_access_log" suffix=".txt" \
               pattern="%h %l %u %t &quot;%r&quot; %s %b" /> ' /usr/local/tomcat/apache-tomcat-8.0.30/conf/server.xml
#prefix="localhost_b_access_log" rizhi mingcheng
#directory="logs"; rizhi lujing

/usr/local/tomcat/apache-tomcat-8.0.30/bin/shutdown.sh
/usr/local/tomcat/apache-tomcat-8.0.30/bin/startup.sh

sleep 5

ss -lnptu | grep java

curl -k https://localhost_b:8443
#localhost_b shi shangyige shezhi
#-k shi fangwen bu anquan de https
#8443shi https de duankou; buneng moren shenglue

ls /usr/local/tomcat/apache-tomcat-8.0.30/logs
ls /usr/local/tomcat/apache-tomcat-8.0.30/logs/localhost_b_access_log.*.txt
