#!/bin/bash

#安装memcached服务器，用来存储用户访问后在web服务器产生的session，并同步到所有的web服务器；

#Session是在服务端保存的一个数据结构，用来跟踪用户的状态，这个数据可以保存在集群、数据库、文件中；
#Cookie是客户端保存用户信息的一种机制，用来记录用户的一些信息，也是实现Session的一种方式。

#memcached 数据操作内存
#server 1.116.26.230
yum install -y memcached

#client 192.168.29.154
yum install -y telnet

yum install -y php-pecl-memcache
#php中memcache的插件

systemctl start memcached telnet
systemctl enable memcached telnet
systemctl status memcached telnet

#安装在 1.116.26.230
#memcached的配置文件
#/usr/lib/systemd/system/memcached.service 
#/etc/sysconfig/memcached

#memcache 是 kv Database (key=value)

telnet localhost 11211
#Trying ::1...
#Connected to localhost.
#Escape character is '^]'.
set name 0 180 3
plj
#STORED
get name
#VALUE name 0 3
#plj
#END

#0 表示不压缩 
#180 缓存数据时间
#3 存储的数据字节数

#add myname 0 180 3
#新建；已有时一致时，会报错
#set myname 0 180 3
#添加/新建
#replace myname 0 180 3
#替换;如果没有就报错
#get myname
#读取变量
#append myname 0 180 2
#向变量追加数据;再已有的myname变量再加两位
#delete myname
#删除变量
#flush_all 
#清空所有


#memcache & proxy installed on centos192.168.29.154 
#web server ubuntu192.168.29.151 & 1.116.26.230

#session path /var/lib/php/session/

# client ----> server [login] session
# session fuwuqi jilu client denglu zhuangtai de wenjian
# sess_uuid[tom,login:true]
# <----- fanhui yemian gei client;(header:cookie:00101)
# liulanqi zidong baocun cookie(00101.txt)
# F5 shuaxin --->00101.txt----->uuid.txt[tom,login:true](buyong zai denglu le)

# session -> server
# cookie -> client

