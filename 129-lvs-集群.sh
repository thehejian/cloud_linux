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












