#!/bin/bash

#memcached shujuku cun shuju shi cunzai neicun
#server 1.116.26.230
yum install -y memcached

#client 192.168.29.154
yum install -y telnet

yum install -y php-pecl-memcache

systemctl start memcached telnet
systemctl enable memcached telnet
systemctl status memcached telnet

#installed on 1.116.26.230
#configuration path
#/usr/lib/systemd/system/memcached.service 
#/etc/sysconfig/memcached

#memcache --> kv Database (key=value)

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

