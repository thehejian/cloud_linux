#!/bin/bash

read -p "input IP; like 1.116.26.230 " IP

ssh-keygen -f /root/.ssh/id_rsa -N '' -y
#-f 指定文件路径
#-N '' 指定密码为空
#-y 默认覆盖指定位置
ssh-copy-id $IP
#客户端密码传到服务器

ssh-keygen
ssh-copy-id 47.112.144.203




#windows powershell方法
ssh-keygen -f C:\Users\Administrator\.ssh\id_rsa -N '' -y
scp C:\Users\Administrator\.ssh\id_rsa.pub root@1.116.26.230:/root/.ssh/authorized_keys

C:\Windows\System32\drivers\etc
1.116.26.230 txy
