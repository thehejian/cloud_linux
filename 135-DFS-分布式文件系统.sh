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
#高扩展、高可用、高性能
#功能：对象存储、块存储（需要格式化，才能mount，就是一块盘）、文件系统（直接mount，就是一个文件夹）存储
#可以提供PB级别存储
#软件定义存储（Software Defined Storage）存储行业的趋势

#Ceph组件
#OSDs   存储设备（必须）（ceph-osd）（需要分享的节点得安装）（用户不访问osd节点）
#Monitors       集群监控组件（必须）  （类似调度器） （用户访问mon）   （高可用，至少2个mon）   （过半原则，一半以上好着才能用）
#RadosGateway（RGW）      对象存储网关   
#MDSs   存放文件系统的元数据（对象存储和块存储不需要该组件）
#Client ceph客户端












































