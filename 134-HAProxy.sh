#!/bin/bash
#清楚lvs的内容
#要把web配置的lo:0清理
        #ifdown lo:0 临时删除立即生效（lvs DR方式的地址伪装）
        #rm -rf /etc/sysconfig/network-scripts/ifcfg-lo:0 永久删除需要重启
                #suse 系统为 rm -rf /etc/sysconfig/network/ifcfg-lo:0
#要把lvs的ipvsadm -C 规则清干净
#关掉lvs的keepalived
        #systemctl stop keepalived
        #systemctl disable keepalived
        #Removed symlink /etc/systemd/system/multi-user.target.wants/keepalived.service.

yum -y install haproxy
systemctl enable haproxy

cp /etc/haproxy/haproxy.cfg /etc/haproxy/haproxy.cfg.bak
##################################################################################################################
cat > /etc/haproxy/haproxy.cfg << "eof"
global
    log         127.0.0.1 local2

    chroot      /var/lib/haproxy
    pidfile     /var/run/haproxy.pid
    maxconn     4000    #最大连接数
    user        haproxy
    group       haproxy
    daemon              #创建进程，然后放后台

    stats socket /var/lib/haproxy/stats

defaults
    mode                    http                #模式{tcp（4层）|http（7层）|health（不做调度器，仅健康检查）}
    log                     global
    option                  httplog             #日志格式，类似http格式
    option                  dontlognull         #健康检查不记录日志
    option http-server-close                    #每次请求完毕主动关闭http通道
    option forwardfor       except 127.0.0.0/8  #后端服务器可以从http header中获取
    option                  redispatch          #轮询到web1，web1坏了，强制定向到其他服务器
    retries                 3                   #重试3次
    timeout http-request    10s
    timeout queue           1m
    timeout connect         10s
    timeout client          1m
    timeout server          1m
    timeout http-keep-alive 10s
    timeout check           10s
    maxconn                 3000
#999dd 删除下面全部的操作
#两种格式
        #方案一：前端/后端
                #frontend  main *:5000
                #backend static
                        #frontend  main *:5000
                        #    acl url_static       path_beg       -i /static /images /javascript /stylesheets
                        #    acl url_static       path_end       -i .jpg .gif .png .css .js

                        #    use_backend static          if url_static
                         #   default_backend             app

                        #backend static
                        #    balance     roundrobin
                        #    server      static 127.0.0.1:4331 check
        #方案二： 更简单  
listen stats 0.0.0.0:1080      #监听端口,查看状态
        stats refresh 30s
        stats uri /stats        #访问路径，uri不是url
        stats realm Haproxy Manager
        stats auth hejian:123456        #用户/密码
listen haproxy_hejian *:80
        balance roundrobin
        server web1 1.116.26.230:80 check inter 2000 rise 2 fall 5
        server web2 10.243.232.63:80 check inter 2000 rise 2 fall 5
        #健康检查 2成功启动；5次失败换其他
eof
#eof后面千万不能有空格
##################################################################################################################
systemctl start haproxy
systemctl restart haproxy
systemctl status haproxy
#关掉其他的80端口
ss -lnptu | grep 80
systemctl stop httpd

curl localhost



















