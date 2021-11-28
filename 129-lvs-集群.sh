#!/bin/bash
#多个服务器集中起来，提供一种服务；
#提高性能、降低成本（相比普通计算机便宜）；提供可扩展；增强可靠性
#神威和银河一号；超级计算机
#HPC高性能
#HA高可用；单点故障
#LB负载均衡；平均分担
#LVS 章文嵩 虚拟服务器
#Director server 调度服务器
#Real server 真实服务器，后端服务器
#VIP    用户访问的IP——《
#DIP 调度器连接节点服务器的IP（和VIP可以一样吗）
#RIP 真实IP——《web的IP
#CIP    client IP 跟LVS没啥关系

#lvs和nginx的原理完全不通，最终效果一样；效率高很多；是内核

#lvs是路由器；（数据包转发）；（本质是软件路由器）；看到的是用户在访问；(NAT功能)；
#不能路由器，确实调度功能；（转web1还是web2）
#缺点：只能做转发

#lvs的工作模式：
#NAT 路由器模式，用户访问通过工位调度器，调度器再访问webserver，sever把数据包给调度器，调度器给用户；比路由器多调度功能；缺点，访问量大时，调度器服务器的带宽会成为瓶颈；集群越大效率越低
#TUN 调度器在公网，web在私网；用户访问调度器，请求通过调度器走公网发给webserver，响应包通过公网直接发给用户；
#DR 直连模式，用户访问走调度器，返回时直接给用户，不走调度器；请求包一般比较小，响应包比较大；

#nginx是代理，agent（帮你干活），看到的是用户在上网；是软件   

#lvs 负载均衡常用调度算法
#rr 轮询 Round Robin RR
#wrr  加权轮询 weighted Round Robin；WRR 极端情况下轮询不合适，会导致其中一个webserver负载更高
#lc 最少连接 least connections LC
#wlc  加权最少连接 weighted least connections WLC
#sh source hash；类似ip_hash；源地址hash；看client的IP
#dh destination hash；目标地址hash；看webserver的IP

yum -y install ipvsadm
#工具，把命令转给内核的lvs

ipvsadm -A -t 192.168.29.158:80 -s wrr
#-A 新建
#-t tcp service address
#-s wrr 调度类型为加权轮询

pvsadm -a -t 192.168.29.158:80 -r 1.116.26.230 -w 1
#-a 添加真实IP
#-r realIP
#-w weighted 权重

ipvsadm -a -t 192.168.29.158:80 -r 192.168.29.151 -w 1
ipvsadm -L
#IP Virtual Server version 1.2.1 (size=4096)
#Prot LocalAddress:Port Scheduler Flags
#  -> RemoteAddress:Port           Forward Weight ActiveConn InActConn
#TCP  192.168.29.158:http wrr
#  -> 192.168.29.151:http          Route   1      0          0         
#  -> txy:http                     Route   1      0          0 
#调度器是centos 192.168.29.158
#real server txy 1.116.26.230
#real server ubuntu 192.168.29.151
#默认时DR模式
#-g 默认，DR模式
#-m nat模式 --masquerading -m                   masquerading (NAT)
#-i 隧道模式   --ipip         -i                   ipip encapsulation (tunneling)
#--numeric      -n                   numeric output of addresses and ports
#-A -E -D 新建 修改 删除
#-a -e -d 新增 修改 删除Real server

[root@192 cloud_linux]# ipvsadm -l
IP Virtual Server version 1.2.1 (size=4096)
Prot LocalAddress:Port Scheduler Flags
  -> RemoteAddress:Port           Forward Weight ActiveConn InActConn
TCP  192.168.29.158:http wrr
  -> 192.168.29.151:http          Route   1      0          0         
  -> txy:http                     Route   1      0          0         
[root@192 cloud_linux]# ipvsadm -ln
IP Virtual Server version 1.2.1 (size=4096)
Prot LocalAddress:Port Scheduler Flags
  -> RemoteAddress:Port           Forward Weight ActiveConn InActConn
TCP  192.168.29.158:80 wrr
  -> 192.168.29.151:80            Route   1      0          0         
  -> 1.116.26.230:80              Route   1      0          0

#轮询时，权重无效

ipvsadm-save -n > /etc/sysconfig/ipvsadm-config  
#永久保存规则

#ipvsadm -C
#清空所有规则

####################################################################################################
#step1

#开启调度器路由功能
echo 1 > /proc/sys/net/ipv4/ip_forward
#重定向可以，不能用vim；
#ipforward打开，当路由器用；
#临时生效
echo "net.ipv4.ip_forward=1" >> /etc/sysctl.conf
#永久生效

#step 2
ipvsadm -A -t 192.168.29.158:80 -s wrr
#-s wrr 调度模式为加权轮询
ipvsadm -a -t 192.168.29.158:80 -r 1.116.26.230 -w 1 -m
#-m NAT模式
ipvsadm -a -t 192.168.29.158:80 -r 192.168.29.151 -w 1 -m
ipvsadm -Ln
#查看，-n数字模式，ip
ipvsadm --save -n > /etc/sysconfig/ipvsadm-config 
#永久保存

#step3
curl http://192.168.29.158
#curl 可以使用，浏览器好像有延续呀

#查看网关
#区域网的网关需要一致
[root@192 cloud_linux]# route -n
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
0.0.0.0         192.168.29.2    0.0.0.0         UG    100    0        0 ens33
0.0.0.0         192.168.29.2    0.0.0.0         UG    101    0        0 ens37
172.17.0.0      0.0.0.0         255.255.0.0     U     0      0        0 docker0
192.168.29.0    0.0.0.0         255.255.255.0   U     100    0        0 ens33
192.168.29.0    0.0.0.0         255.255.255.0   U     101    0        0 ens37

[root@VM-0-14-centos ~]# route -n
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
0.0.0.0         172.17.0.1      0.0.0.0         UG    0      0        0 eth0
169.254.0.0     0.0.0.0         255.255.0.0     U     1002   0        0 eth0
172.17.0.0      0.0.0.0         255.255.240.0   U     0      0        0 eth0
172.18.0.0      0.0.0.0         255.255.0.0     U     0      0        0 docker0

root@hejian-virtual-machine:~# route -n

内核 IP 路由表
目标            网关            子网掩码        标志  跃点   引用  使用 接口
0.0.0.0         192.168.29.2    0.0.0.0         UG    100    0        0 ens33
169.254.0.0     0.0.0.0         255.255.0.0     U     1000   0        0 ens33
172.17.0.0      0.0.0.0         255.255.0.0     U     0      0        0 docker0
192.168.29.0    0.0.0.0         255.255.255.0   U     100    0        0 ens33







