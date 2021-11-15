#!/bin/bash
#参考：https://support.huaweicloud.com/qs-ecs/zh-cn_topic_0085634797.html
1.查看新增的数据盘
fdisk -l

2.新增数据盘（交互式操作）
        fdisk /dev/vdb
        #进入新增盘
        n
        #开始新建分区
        p
        #设置为主分区
        1
        #主分区编号为1
        2048或者直接回车
        #其实磁柱值
        直接回车
        #截止磁柱值
        p
        #查看已经设置好的磁盘
        w
        #将分区结果写进分区表
        #分区创建完成

3.新的分区表同步至系统
partprobe

4.新分区设置为系统需要的格式
#格式化中，需要等一等
mkfs -t ext4 /dev/vdb

5.挂载到系统路径
        mkdir /mnt/sdc
        #创建新文件路径
        mount /dev/vdb /mnt/sdc
        #挂载新分区到文件路径
        df -TH
        #查看挂载结果

6.开机启动设置（自动挂载）（UUID挂载）
        一、查看UUID
        blkid /dev/vdb
        二、修改配置表
sed -i '$a UUID=282f2c33-f2ff-4ae6-ac87-21bec433eb65       /mnt/sdc        ext4    defaults        0       2' /etc/fstab

        


