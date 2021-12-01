#/bin/bash
#proxy1 用keepalive生成VIP
#proxy2
#proxy是主备部署、浮动IP
#proxy要安装keepalive（对外提供浮动IP）；高可用，配置优先级防止proxy坏掉，并对web进行安全检查
#proxy要安装ipvsadm调用内核的lvs功能；
#实际可以不安装，只是为了看结果；

#web1 lo:0 为vip 
#web2
#web是集群部署，由lvs的proxy进行负载分担；然后DR模式直接发包给client（回环lo：0为vip）

#proxy 1
yum -y install ipvsadm keepalived
ipvsadm -Ln
ipvsadm -C

cat > /etc/keepalived/keepalived.conf << "eof"
! Configuration File for keepalived

global_defs {
   notification_email {
     acassen@firewall.loc       #设置收件人邮箱
     failover@firewall.loc
     sysadmin@firewall.loc
   }
   notification_email_from Alexandre.Cassen@firewall.loc        #设置发件人邮箱
   smtp_server 192.168.200.1    #定义邮件服务器
   smtp_connect_timeout 30
   router_id lvs        #设置路由ID号，两台proxy（lvs）服务器要一致    （需要修改）
   vrrp_skip_check_adv_addr
   vrrp_strict
   vrrp_garp_interval 0
   vrrp_gna_interval 0
}

vrrp_instance VI_1 {
    state MASTER        #主服务器为MASTER   备份为BACKUP       （需要修改）
    interface eth0      #定义网络接口        centos7需要改成ens33        （需要修改）
    virtual_router_id 50        #VRID，虚拟路由器ID；两台proxy（lvs）服务器要一致    （需要修改）
    priority 100        #优先级 备份小于100 99        （需要修改）
    advert_int 1
    authentication {
        auth_type PASS
        auth_pass 1111  #密码    虚拟路由器ID；两台proxy（lvs）服务器要一致
    }
    virtual_ipaddress { #这是vip 浮动IP    lvs（proxy）的虚拟机IP        webserver的回环lo：0 IP     （需要修改）
        192.168.4.15
    }
}
#上面实现的是一个功能，设置VIP      浮动IP的功能（可以给多个服务器配置，按照优先级将浮动IP跟lvs服务器匹配；）
#验证方式：router_id lvs、virtual_router_id 50、 auth_pass 1111      路由ID（路由下是不是可以多个虚拟路由）和虚拟机路由ID和密码
#缺lvs（虚拟机路由）和健康检查功能；

#相当于ipvsadm -A 
#可以实现多个集群
virtual_server 192.168.4.15 80 {    #ipvsadm -A 192.168.4.15:80 -t -s wrr       (需要修改)
    delay_loop 6
    lb_algo rr  #轮询    调度算法
    lb_kind DR #NAT   调度类型
    #persistence_timeout 50    #需要注释掉，保持连接；客户端在一定时间内访问的是同一台服务器  (需要修改)
    protocol TCP        #-t TCP协议
    real_server 1.116.26.230 80 {   #ipvsadm -a 192.168.4.15:80 -r 1.116.26.230 -w 1 -m （需要修改）
        weight 1
        #HTTP_GET {       #健康检查功能，重要      （443）      （需要修改）
        #类型有3中
                #TCP_CHECK 只检查80端口，网页被篡改，内容无法检查；不需要URL检查
                #HTTP_GET 访问网页并检查 80
                        #ping（能ping通IP，服务（apache）如果关了则检查不出来）
                        #curl（网页能否打开；缺点；网页如果被篡改，则无法检查出来）
                        #md5sum方式
                                #myurl=1.116.26.230
                                #mytxt=$(curl "$myurl" | md5sum)
                                #[ "mytxt" == "myori_index" ] && echo "网页OK" || echo "网页被篡改了"
                                #myori_index是原始网页的MD5sum值
                #SSL_GET 443
            #url {
            #  path /
            #  digest 41adc458d6f0d1588aada7abf1d664fb   #md5sum值        （需要修改）
            #}
            #url {      #支持多个目录的检查
            #  path /mrtg/
            #  digest 9b3a0c85a887a256d6939da88aabd8cd
            #}
        TCP_CHECK {
            connect_timeout 3
            nb_get_retry 3      #再试3次
            delay_before_retry 3        #隔3s再访问
        }
    }    
    real_server 10.243.232.63 80 {   #ipvsadm -a 192.168.4.15:80 -r 1.116.26.230 -w 1 -m （需要修改）
        weight 1
            TCP_CHECK {
            connect_timeout 3
            nb_get_retry 3      #再试3次
            delay_before_retry 3        #隔3s再访问
        }
    }

}
eof

systemctl restart keepalived
ipvsadm -Ln
ip a s
#查看虚拟网络
iptables -F
setenforce 0
#清防火墙规则

######################################################################################——》web修改
#Realsever改lo：0ip
#lo 是vip 192.168.29.162——》192.168.4.15
cd /etc/sysconfig/network-scripts/
#suse是下面
#cd /etc/sysconfig/network/
cp ifcfg-lo{,:0}
cat > ifcfg-lo:0 << "eof"
DEVICE=lo:0
IPADDR=192.168.4.15
#vip
NETMASK=255.255.255.255
NETWORK=192.168.4.15
# If you're having problems with gated making 127.0.0.0/8 a martian,
# you can change this to something else (255.255.255.255, for example)
BROADCAST=192.168.4.15
ONBOOT=yes
NAME=lo:0
eof

#地址可能会冲突，做下面的操作
cat >> /etc/sysctl.conf << "eof"
net.ipv4.conf.all.arp_ignore=1
#当arp广播问谁是vip（192.168.29.162）时，忽略arp广播，所有网卡；
#不回vip，其他的正常
net.ipv4.conf.lo.arp_ignore=1
#忽略arp广播（回环）
net.ipv4.conf.all.arp_announce=2
#声明，宣告；回包；
#不对外宣称自己的的loip是vip；
#2坚决不声明；1尽可能不声明；
net.ipv4.conf.lo.arp_announce=2
eof
sysctl -p
#立即生效

systemctl restart network
#centos有2个程序管理网络，可能冲突；network 和 networkManager




















  
  
  
  
  


