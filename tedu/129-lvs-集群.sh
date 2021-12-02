#!/bin/bash
###########################################################################################################################################LVS-NAT
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
#转发效率高，但是默认是没有健康检查的；
###########################################################################################################################################LVS-DR
#调度器：centos
  #dip  调度器给后端web的ip；作为主IP;192.168.29.161;ens33
  #vip  用户访问的IP；这个IP要隐藏起来；作为次IP(虚拟接口);ens33:0;192.168.29.162 ——《用户访问这个
#web1：ubuntu 192.168.29.151；需要设置双IP；lo: VIP lo:192.168.1.162
#web2：txy 1.116.26.230；需要设置双IP；VIP;lo: VIP lo:192.168.1.162
#有几个web就得有几个公网IP

#step1
#开启调度器路由功能
echo 1 > /proc/sys/net/ipv4/ip_forward
#重定向可以，不能用vim；
#ipforward打开，当路由器用；
#临时生效
echo "net.ipv4.ip_forward=1" >> /etc/sysctl.conf
#永久生效
#（web和proxy都需要改一下）

################################——》调度proxy配置
#修改主机名称
hostname proxy
#临时修改主机名；立即生效
vim /etc/hosts
#127.0.0.1   proxy localhost localhost.localdomain localhost4 localhost4.localdomain4

#创建虚拟网卡(VIP)
#主网卡  ens33 192.168.29.161  DIP
#虚拟机网卡 ens33:0 192.168.29.162 VIP
cd /etc/sysconfig/network-scripts/

cp ifcfg-ens33{,:0}
#cp ifcfg-ens33 ifcfg-ens33:0
cat > /etc/sysconfig/network-scripts/ifcfg-ens33:0 << "eof"
TYPE=Ethernet
BOOTPROTO=none
DEFROUTE=yes
NAME=ens33:0
DEVICE=ens33:0
ONBOOT=yes
IPADDR=192.168.29.162
PREFIX=24
eof

#systemctl stop NetworkManager
systemctl restart network
#重启网络

################################——》webserver1配置
#修改主机名称
hostname web1-ubuntu
#临时修改主机名；立即生效
vim /etc/hosts
#127.0.0.1   web1-ubuntu localhost localhost.localdomain localhost4 localhost4.localdomain4
#lo 是vip 192.168.29.162
cd /etc/sysconfig/network-scripts/
cp ifcfg-lo{,:0}
cat > /etc/sysconfig/network-scripts/ifcfg-lo:0 << "eof"
DEVICE=lo:0
IPADDR=192.168.29.162
#vip
NETMASK=255.255.255.255
NETWORK=192.168.29.162
# If you're having problems with gated making 127.0.0.0/8 a martian,
# you can change this to something else (255.255.255.255, for example)
BROADCAST=192.168.29.162
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

################################——》proxy做DR模式的代理
ipvsadm -C
ipvsadm -A -t 192.168.29.161:80 -s wrr
#161是DIP，主IP
ipvsadm -a -t 192.168.29.161:80 -r 1.116.26.230 -g -w 1
#-g DR模式，默认；可以不加
#-w 1 权重为1，默认。可以不加
ipvsadm -a -t 192.168.29.161:80 -r 192.168.29.151
#RIP webserver IP
ipvsadm -Ln
ipvsadm --save -n > /etc/sysconfig/ipvsadm-config 
#永久保存

################################——》健康检查
#默认不健康检查，
cat > 129_01_jiankangjiancha.sh << "eof"
#!/bin/bash
VIP=192.168.29.162
RIP1=192.168.29.151
RIP2=1.116.26.230
while :
do
  for IP in $RIP1 $RIP2
  do
    curl -s http://$IP &> /dev/null
    #访问RIP，webserverIP
    if [ $? -eq 0 ]; then
        ipvsadm -Ln | grep -q $IP || ipvsadm -a -t $VIP -r $IP
        #RIP能访问通，就加进来
      else
        ipvsadm -Ln | grep -q $IP || ipvsadm -d -t $VIP -r $IP
        #访问不通就删掉
    fi
  done
  sleep 1
done
eof
bash 129_01_jiankangjiancha.sh






#网卡备份
##########################################
TYPE=Ethernet
PROXY_METHOD=none
BROWSER_ONLY=no
BOOTPROTO=none
DEFROUTE=yes
IPV4_FAILURE_FATAL=no
IPV6INIT=yes
IPV6_AUTOCONF=yes
IPV6_DEFROUTE=yes
IPV6_FAILURE_FATAL=no
IPV6_ADDR_GEN_MODE=stable-privacy
NAME=ens33:0
#UUID=44701f4e-612f-47a7-85b3-4bcd65c8e3fb
DEVICE=ens33:0
ONBOOT=yes
IPADDR=192.168.29.162
PREFIX=24
#############################################
TYPE=Ethernet
PROXY_METHOD=none
BROWSER_ONLY=no
BOOTPROTO=dhcp
DEFROUTE=yes
IPV4_FAILURE_FATAL=no
IPV6INIT=yes
IPV6_AUTOCONF=yes
IPV6_DEFROUTE=yes
IPV6_FAILURE_FATAL=no
IPV6_ADDR_GEN_MODE=stable-privacy
NAME=ens33
UUID=44701f4e-612f-47a7-85b3-4bcd65c8e3fb
DEVICE=ens33
ONBOOT=yes
#############################################


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

#网关的通俗解释
#https://blog.csdn.net/huangyimo/article/details/82887367
网关的作用及工作流程的通俗解释　　假设你的名字叫小不点，你住在一个大院子里，你的邻居有很多小伙伴，在门口传达室还有个看大门的李大爷，李大爷就是你的网关。当你想跟院子里的某个小伙伴玩，只要你在院子里大喊一声他的名字，他听到了就会回应你，并且跑出来跟你玩。

但是你不被允许走出大门，你想与外界发生的一切联系，都必须由门口的李大爷（网关）用电话帮助你联系。假如你想找你的同学小明聊天，小明家住在很远的另外一个院子里，他家的院子里也有一个看门的王大爷（小明的网关）。但是你不知道小明家的电话号码，不过你的班主任老师有一份你们班全体同学的名单和电话号码对照表，你的老师就是你的DNS服务器。于是你在家里拨通了门口李大爷的电话，有了下面的对话：

小不点：李大爷，我想找班主任查一下小明的电话号码行吗？

李大爷：好，你等着。（接着李大爷给你的班主任挂了一个电话，问清楚了小明的电话）问到了，他家的号码是211.99.99.99

小不点：太好了！李大爷，我想找小明，你再帮我联系一下小明吧。

李大爷：没问题。（接着李大爷向电话局发出了请求接通小明家电话的请求，最后一关当然是被转接到了小明家那个院子的王大爷那里，然后王大爷把电话给转到小明家）

就这样你和小明取得了联系。





