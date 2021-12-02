#!/bin/bash

read -p "请输入数字 " num
for i in `seq $num`
do
	echo $i
done
#seq 5 输出12345
