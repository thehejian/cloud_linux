#!/bin/bash

#gonggong wangluo
#GRE PPTP L2TP+IPSec SSL
#cong nan dao yi
#cong anquan jiaodu zhenghao xiangfan

#client	eth3	201.1.2.10/24
#proxy eth0	192.168.4.5/24
#proxy eth3	201.1.2.5/24

#xuyao zai kvm shangmian gao
####--->client
#setip
#eth3
#201.1.2.10/24

####--->proxy
#setip
#eth3
#192.168.4.5/24


###########################################################################################################################---->GRE
#window moren buzhichi GRE
#client he proxy dou xuyao anzhuang 
#liangge linux zhijian; buqufen client he server
#neihe zhichi gongneng; buxuyao anzhuang ruanjian
#linux neihe shi mokuaihua sheji

#####################################---->chakan shifou anzhuang gre mokuai
lsmod
lsmod | grep ip_gre

modprobe ip_gre
lsmod | grep ip_gre

modinfo ip_gre
#chakan ip_gre xinxi



