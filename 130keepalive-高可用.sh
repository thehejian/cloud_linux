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


