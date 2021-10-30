#!/bin/bash

read -p "input username " user
useradd $user
[ -z "$user" ] && echo "input name" && exit

stty -echo 
read -p "input password " pass
stty echo

#shuru weikong bu zhixing

echo $pass | passwd --stdin $user

