#!/bin/bash

x=0
while :
do
	read -p "请输入数字，输入0就结束 " num
	# -z 数字为空
	[ -z $num ] || [ $num -eq 0 ] && break
	let x+=num
done

echo "所有数字之和是 $x"


#for (( i=0; i<=100; i++))
#do
#yu=$[i%6]
#[ $yu -ne 0 ] && continue
## budengyu0 de jixu zhixing; dengyu0 de zhixing xiamian de ;tiaoguo zhege buzhou,butiaochu xunhuan
#x=$[i+10]
#echo $x
#done
