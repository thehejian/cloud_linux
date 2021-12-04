#!/bin/bash

#存储的类型
#直连
        #DAS    直连存储
                #ide接口（淘汰）
                #sata接口（家用）
                #sas接口（性能好）（企业级）（和sata接口一样）
#网盘
        #NAS    网络附加存储  共享文件系统  （已经格式化过，可以直接用）  ext3，ext4，fat32，ntfs，xfs文件系统
                #nfs    #缺点：挂载后，不能把多个nfs的空间放到一起叠加；不能实现n个存储无限叠加；
                #ftp
                #samba                
        #SAN    存储区域网络  块（没格式化） （不能直接用，用之前要先格式化）
                #iscsi  #缺点 同NAS，只能生成多个/dev/sda /dev/sdb 不能把空间合到一起
        #SDS    软件定义存储 （分布式存储）
                #Ceph           红帽
                #glusterFS      红帽
                #lustre
                #Hadoop
                #fastDFS        国产
        
#分布式文件系统
#Distributed File System
#文件系统管理的物理存储资源不一定直接连接在本地节点；而是通过计算机网络与节点相连
#分布式文件系统的设计基于客户机/服务器模式——》SC模式

#Ceph是什么
#Ceph是分布式文件系统
#高扩展、高可用（默认3副本）、高性能
#功能：对象存储、块存储（需要格式化，才能mount，就是一块盘）、文件系统（直接mount，就是一个文件夹）存储
#可以提供PB级别存储
#软件定义存储（Software Defined Storage）存储行业的趋势

#Ceph组件
#OSDs   存储设备（必须）（ceph-osd）（需要分享的节点得安装）（用户不访问osd节点）
#Monitors       集群监控组件（必须）  （类似调度器） （用户访问mon）   （高可用，至少2个mon）   （过半原则，一半以上好着才能用）
#RadosGateway（RGW）      对象存储网关   
#MDSs   存放文件系统的元数据（对象存储和块存储不需要该组件）
#Client ceph客户端

#生产环境建议OSD和monitor分开装，至少准备6台机器
#3osd 3mon 也可以osd和mon装在一个机器
#每个机器配置vdb（SSD）/vdc/vdd各20GB
#3个盘都需要格式化；SSD盘格两个区（手动格），SATA格一个区（直接用ceph-deploy格）
#总共提供3*（20+20）=120共享空间；需要120+（10+10）*3=120+60=180的server空间；     120SATA；60SSD
#缓存盘          共享盘           共享盘     
#SSD             STAT            SATA
#vdb             vdc             vdd
#vdb1(10GB)      vdc1(20GB)                      vdb1作为vdc1的缓存盘
#vdb2(10GB)                      vdd1(20GB)      vdb2作为vdd1的缓存盘

#创建1个client客户端
#创建3个server服务器端 存储集群（mon osd）
#4台机器的主机名、yum源、ntp
#4台ssh免密登录
#3台虚拟机共享磁盘
        #ceph-deploy这个脚本快速执行，前提是免密ssh

######################################################################——》修改主机名
mydate=$(date +'%Y%m%d')
cat >> /etc/hosts << "eof"
10.185.81.181    node1
10.243.232.63    node2
1.116.26.230     node3       
eof

for i in node1 node2 node3
do
        mv $i:/etc/hosts $i:/etc/hosts.$mydate.bak
        scp /etc/hosts $i:/etc/hosts
done
######################################################################——》ssh免登陆
#选一台server，可以登录其他节点（server）
ssh-keygen -f /root/.ssh/id_rsa -N ''

for i in node1 node2 node3
do
        ssh-copy-id $i
done
#ssh 10.243.232.63
#免密码登录

#这步可以不做，后面有涉及
#useradd cephadm
#echo '123456' | passwd --stdin cephadm
#echo "cephadm ALL = (root) NOPASSWD:ALL" | tee /etc/sudoers.d/cephadm
#chmod 0440 /etc/sudoers.d/cephadm
#su - cephadm
#ssh-keygen -t rsa -P ''
#ssh-copy-id cephadm@ceph-mon1
#ssh-copy-id cephadm@ceph-mon2
#ssh-copy-id cephadm@ceph-mon3
#ssh-copy-id cephadm@ceph-osd4
######################################################################——》NTP服务器时间要一致/改下主机名
mv /etc/chrony.conf /etc/chrony.conf.$mydate.bak
cat > /etc/chrony.conf << "eof"
server ntp.aliyun.com iburst
eof

for i in node1 node2 node3
do
        scp /etc/chrony.conf $i:/etc/chrony.conf
        ssh $i "systemctl restart chronyd"
        ssh $i "hostname $i"
        #顺便改下主机名
done

chronyc sources
#查看时间同步情况，跟谁同步时间

########################################################################——》ceph yum源
#本地文件生成yum源的方法
#cp a.rpm /var/ftp/pub
#createrepo /var/ftp/pub/
#cat /var/ftp/pub/repodata
#查看yum软件目录
#yum repolist
#查看yum源

cat > /etc/yum.repos.d/ceph.repo << "eof"
[Ceph]
name=Ceph packages for $basearch
baseurl=http://mirrors.aliyun.com/ceph/rpm-mimic/el7/$basearch
enabled=1
gpgcheck=1
type=rpm-md
gpgkey=https://mirrors.aliyun.com/ceph/keys/release.asc

[Ceph-noarch]
name=Ceph noarch packages
baseurl=http://mirrors.aliyun.com/ceph/rpm-mimic/el7/noarch
enabled=1
gpgcheck=1
type=rpm-md
gpgkey=https://mirrors.aliyun.com/ceph/keys/release.asc

[ceph-source]
name=Ceph source packages
baseurl=http://mirrors.aliyun.com/ceph/rpm-mimic/el7/SRPMS
enabled=1
gpgcheck=1
type=rpm-md
gpgkey=https://mirrors.aliyun.com/ceph/keys/release.asc
eof
########################################################################——》安装ceph

#批量安装包
for i in node1 node2 node3
do
        scp  /etc/yum.repos.d/ceph.repo $i:/etc/yum.repos.d/ceph.repo
        ssh $i "yum -y install ceph-mon ceph-osd ceph-mds ceph-radosgw"
        #ceph-osd       块
        #ceph-mds       文件系统
        #ceph-radosgw   对象存储
done
#也可以用ceph-deploy
#ceph-deploy install ceph-mon ceph-osd ceph-mds ceph-radosgw node1 node2 node3
#rhel7才支持，centos不支持
#ceph-deploy    远程其他电脑不需要密码，就是ssh-keygen那台机器,是python写的；用来自动部署
#cat /usr/bin/ceph-deploy
#ceph-deploy --help

#按照上面的安装就可以了
#yum install -y yum-utils && yum-config-manager --add-repo https://dl.fedoraproject.org/pub/epel/7/x86_64/ && yum install --nogpgcheck -y epel-release && rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-7 && rm -f /etc/yum.repos.d/dl.fedoraproject.org*
#yum -y install ceph-deploy ceph-common

########################################################################——》创建目录
#这是client盘还得sever（node）盘做的操作呢？
mkdir -p ~/cloud_linux/tedu/ceph-cluster
cd ~/cloud_linux/tedu/ceph-cluster

######——》部署ceph集群
#服务器端，node1
#monitor
ceph-deploy new node1 node2 node3
ls
#ceph.conf  ceph-deploy-ceph.log  ceph.mon.keyring

cat ceph.conf 
#[global]
#fsid = c3738875-0508-40e1-9f04-8e480c53c25d
#mon_initial_members = node1, node2
#mon_host = 10.185.81.181,10.243.232.63
#auth_cluster_required = cephx
        #是否需要密码 none不需要；cephx密码占位，密码在其他地方配置
#auth_service_required = cephx
#auth_client_required = cephx

########################################################################——》格式化磁盘
#每台机器先在vmwave上挂载3个盘进来，vdb（20GB）（SSD）、vdc（20GB）（SATA）（20GB）、vdd（20GB）（SATA）（20GB）
#对vdb进行分区，分成两个主分区，各10GB；分区表格式为gpt；vdb为缓存盘
#其他盘vdc和vdd作为共享盘，暂不处理

#缓存盘          共享盘           共享盘     
#SSD             STAT            SATA
#vdb             vdc             vdd
#vdb1(10GB)      vdc1(20GB)                      vdb1作为vdc1的缓存盘
#vdb2(10GB)                      vdd1(20GB)      vdb2作为vdd1的缓存盘

for i in node1 node2 node3
#for循环中不要用fdisk，不能交互式
do
        ssh $i "parted /dev/vdb mklabel gpt"
        #创建分区表 mklabel,mktable LABEL-TYPE               create a new disklabel (partition table)
        #分区表格式 https://zhuanlan.zhihu.com/p/26098509
                #gpt分区可以大于4个； 容量也可以大于2TB
                #MBR主分区不能大于4；最大单分区不能超过2TB
        ssh $i "parted /dev/vdb mkpart primary 1 50%"
        #primary 主分区
        #主分区空间是从1到50%的大小
        #vdb1
        ssh $i "parted /dev/vdb mkpart primary 50% 100%"
        #primary 主分区
        #主分区空间是从50%到100%的大小
        #vdb2
done
#执行完，需要分区表写到/etc/fstab，开机自动启动，永久生效

lsblk
#列出系统上的所有的磁盘列表
#NAME   MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
#sr0     11:0    1   18M  0 rom  
#vda    253:0    0  200G  0 disk 
#├─vda1 253:1    0    1G  0 part /boot
#├─vda2 253:2    0    8G  0 part /
#├─vda3 253:3    0 1023M  0 part [SWAP]
#└─vda4 253:4    0  190G  0 part /mnt/sdc

fdisk -l
#fdisk -l：查看机器所挂硬盘个数及分区情况
#Disk /dev/vda: 214.7 GB, 214748364800 bytes, 419430400 sectors
#Units = sectors of 1 * 512 = 512 bytes
#Sector size (logical/physical): 512 bytes / 512 bytes
#I/O size (minimum/optimal): 512 bytes / 512 bytes
#Disk label type: dos
#Disk identifier: 0x000e1317

#   Device Boot      Start         End      Blocks   Id  System
#/dev/vda1   *        2048     2099199     1048576   83  Linux
#/dev/vda2         2099200    18868223     8384512   83  Linux
#/dev/vda3        18868224    20963327     1047552   82  Linux swap / Solaris
#/dev/vda4        20963328   419430399   199233536   83  Linux

########################################################################——》修改磁盘权限（缓存盘vdb1、vdb2）
#默认权限ceph软件无法读取，需要改权限
for i in node1 node2 node3
do
        ssh $i "chown ceph.ceph /dev/vdb1"
        ssh $i "chown ceph.ceph /dev/vdb2"
        #ssh $i "chown ceph.ceph /dev/vdc"
        #vdc和vdd好像非必须;用更便捷的ceph-deploy方法下面
        #ssh $i "chown ceph.ceph /dev/vdd"
done
#临时修改，立即生效
ll /dev/vd*

#永久生效
cat > /etc/udev/rules.d/70-ceph.rules << "eof"
#用于ceph分区；名称是自己起的
ENV{DEVNAME}=="/dev/vdb1",OWNER="ceph",GROUP="ceph"
ENV{DEVNAME}=="/dev/vdb2",OWNER="ceph",GROUP="ceph"
#ENV{DEVNAME}=="/dev/vdc",OWNER="ceph",GROUP="ceph"
#ENV{DEVNAME}=="/dev/vdd",OWNER="ceph",GROUP="ceph"
#==是判断，如果有设备名称为/dev/vdb1，则设备文件的所有者和组为ceph
eof
cat /etc/udev/rules.d/70-ceph.rules

#改好的规则给其他也复制下
for i in node1 node2 node3
do
        scp /etc/udev/rules.d/70-ceph.rules $i:/etc/udev/rules.d/70-ceph.rules
done

########################################################################——》修改磁盘权限（共享盘vdc、vdd）
cd ~/cloud_linux/tedu/ceph-cluster
#这个盘之前做了ceph-deploy new
#ceph-deploy命令要先进入此文件夹
ceph-deploy disk zap node1:vdc node1:vdd
#zap 格式化
#默认分区格式gpt
ceph-deploy disk zap node2:vdc node1:vdd
ceph-deploy disk zap node3:vdc node1:vdd

########################################################################——》创建共享存储块共享盘
#osd类型管理缓存盘和共享盘进行关联
#至少需要3osd（副本）才能正常访问，一个osd就是一个块
ceph-deploy osd create node1:vdc:/dev/vdb1 node1:vdd:/dev/vdb2
ceph-deploy osd create node2:vdc:/dev/vdb1 node2:vdd:/dev/vdb2
ceph-deploy osd create node3:vdc:/dev/vdb1 node3:vdd:/dev/vdb2

ceph -s
#health Error WARN clock（时间不同步等） OK
ceph osd tree
#能看到共享盘的情况

########################################################################——》常见错误
#重新配置秘钥
#ceph-deploy gatherkeys node1 node2 node3

########################################################################——》共享池
#操作时，最好先退出再重新进入，就有tab键补齐了
#集群部署，在任何node都可以
#ceph120GB
        #共享池|共享镜像（可以多个镜像，最多不超过120GB）
ceph osd lspools 
#默认有一个池子，叫rbd 编号为0
########################################################################——》共享镜像
rbd create A-ceph-image --image-feature layering --size 10G
#A-ceph-image   镜像盘名称
rbd create rbd/B-ceph-image --image-feature layering --size 10G
#rbd    资源池
#--image-feature layering 开启layering功能，COW功能
#qcow2 镜像类型，支持镜像快照功能，增量快照

rbd list
rbd info A-ceph-image

#扩容|缩容
rbd resize --size 15G A-ceph-image
rbd resize --size 5G A-ceph-image --allow-shrink
#缩容要提醒
##########################################################################——》以上所有都是服务器端操作

#######################################################################——》客户端安装ceph-common
#挂载的是块
#登录到client客户端
yum -y install ceph-common
#mv /etc/ceph/ceph.conf /etc/ceph/ceph.conf.$mydate.bak
scp node1:/etc/ceph/ceph.conf /etc/ceph/ceph.conf
#配置文件拷贝到client
scp node1:/etc/ceph/ceph.client.admin.keyring /etc/ceph/

rbd map image
lsblk
#多了一个rbd0
rbd showmapped

#######################################################################——》客户端挂载硬盘
mkfs.xfs /dev/rbd0
#格式
mount /dev/rbd0 /mnt/ceph
#挂载
echo "test" /mnt/ceph/test.txt



























