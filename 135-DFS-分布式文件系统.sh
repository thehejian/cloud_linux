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

######################################################################——》ssh免登陆
#选一台server，可以登录其他节点（server）
ssh-keygen -f /root/.ssh/id_rsa -N ''
ip1=10.185.81.181
ip2=10.243.232.63
for i in $ip1 $ip2
do
        ssh-copy-id $i
done
#ssh 10.243.232.63
#免密码登录

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
######################################################################——》配置域名
cat >> /etc/hosts << "eof"
10.185.81.181    node1
10.243.232.63    node2
eof
ssh node2

######################################################################——》NTP服务器时间要一致
cp /etc/chrony.conf /etc/chrony.conf.bak
cat > /etc/chrony.conf << "eof"
server ntp.aliyun.com iburst
eof

for i in node1 node2
do
        scp /etc/chrony.conf $i:/etc/chrony.conf
        ssh $i "systemctl restart chronyd"
done

chronyc sources
#查看时间同步情况，跟谁同步时间
######################################################################——》给服务器加3个磁盘
#手动操作，加3块盘；server都要加，client不关注
lsblk
#列出块设备信息

########################################################################——》ceph yum源
#本地文件生成yum源
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
for i in node1 node2
do
        scp  /etc/yum.repos.d/ceph.repo $i:/etc/yum.repos.d/ceph.repo
        ssh $i "yum -y install ceph-mon ceph-osd ceph-mds ceph-radosgw"
        #ceph-osd       块
        #ceph-mds       文件系统
        #ceph-radosgw   对象存储
done

#yum install -y yum-utils && yum-config-manager --add-repo https://dl.fedoraproject.org/pub/epel/7/x86_64/ && yum install --nogpgcheck -y epel-release && rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-7 && rm -f /etc/yum.repos.d/dl.fedoraproject.org*

#yum -y install ceph-deploy ceph-common
#ceph-deploy    远程其他电脑不需要密码，就是ssh-keygen那台机器,是python写的；用来自动部署
#cat /usr/bin/ceph-deploy
#ceph-deploy --help

########################################################################——》创建目录
mkdir -p ~/cloud_linux/tedu/ceph-cluster
cd ~/cloud_linux/tedu/ceph-cluster

########################################################################——》部署ceph集群
#monitor
ceph-deploy new node1 node2
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

















