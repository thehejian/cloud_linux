#!/bin/bash
#nginx代理（调度）；通过nginx去访问web，数据是返回给nginx
#lvs（调度器）；转发数据包；客户访问web；数据包直接给用户（DR）
  #NAT
  #DR 调度器进，web直接给用户
  #Tunnel 隧道
#vip 用户访问的地址，调度器的虚拟地址，web（rip）的虚拟回环地址
#dip 调度器的主地址
#rip webserver的IP，lo回环为vip
#缺少健康检查；

#keepalived 实现健康检查功能
#自动配置LVS规则
#软路由功能
#VRRP 虚拟路由器备援协议 (Virtual Router Redundancy Protocol)
#优先级高为主路由；
#VIP 浮动IP 用户访问的，调度器的虚拟机路由；web的lo回环IP

################################################################## web1和web2安装keepalived
#不用调度器，两个web都安装web；利用VRRP的功能；
#VIP不是手动配置，而是自动生成；

yum install -y keepalived

sed -i 's/router_id LVS_DEVEL/router_id web1/g' /etc/keepalived/keepalived.conf
#设置路由ID
sed -i 's///g' /etc/keepalived/keepalived.conf
sed -i 's///g' /etc/keepalived/keepalived.conf

vim /etc/keepalived/keepalived.conf
vrrp_instance VI_1 {
    state MASTER
    #主 MASTER   备 BACKUP
    interface eth0
    #配置哪个网卡 ens33
    virtual_router_id 51
    #虚拟路由ID；主备virtual_route_id 要一致
    priority 100
    #优先级，默认100；备份要小于100
    advert_int 1
    authentication {
        auth_type PASS
        auth_pass 1111
        #主备密码一致，最好改了
    }
    virtual_ipaddress {
        192.168.4.80
    }
}
#剩下内容 999dd 删除
systemctl start keepalived
systemctl enable keepalived
systemctl status keepalived

iptables -F
setenforce 0
#清空防火墙，每次启动都需要；

ip a s eth0
2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP group default qlen 1000
    link/ether fa:16:3e:95:42:6f brd ff:ff:ff:ff:ff:ff
    inet 162.166.94.62/22 brd 162.166.95.255 scope global eth0
       valid_lft forever preferred_lft forever
    inet 10.185.81.80/32 scope global eth0
       valid_lft forever preferred_lft forever
    inet6 fe80::f816:3eff:fe95:426f/64 scope link 
       valid_lft forever preferred_lft forever














