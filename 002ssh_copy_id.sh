#!/bin/bash

read -p "input IP; like 1.116.26.230 " IP

ssh-keygen -f /root/.ssh/id_rsa -N '' -y
#-f zhiding wenjian lujing
#-N '' zhiding mima weikong
#-y moren fugai zhiqian de mima
ssh-copy-id $IP
#client mima chuan gei server
