#!/bin/bash

for i in $(ls /etc/*.conf)
#遍历全部的配置文件
do
	md5sum $i >> 049original_conf.txt
done
