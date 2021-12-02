#!/bin/bash

#for i in {1..200}
#do
#
#done

read -p "请输入最大值" mycount

for (( i=0; i<=$mycount; i++))
do
	yu=$[i%6]
	[ $yu -ne 0 ] && continue
	#不等于0的继续执行；等于0的跳过执行下面的；跳过执行步骤，不跳出循环；
	echo $[i]
done
