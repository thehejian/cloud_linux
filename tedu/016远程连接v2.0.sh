#!/bin/bash

#输入IP前两位，检测XX.XX.{25~26}.{229~231} 网段的IP通不通

read -p "输入IP的前两位" ping

if [ -z $ping ] ; then
	echo "请输入IP"
	exit
fi

chenggong=0
shibai=0

for j in {25..27}
do
	for i in {229..231}
	do
		ping $ping.$j.$i -c 3 -i 0.2 -W 1 &> /dev/null 
		if [ $? -eq 0 ] ; then
		#$?=0 #? -eq 0 上次结果成功；
			echo "$ping.$j.$i 通了"
			let chenggong++
		else 
			echo "$ping.$j.$i 不通"
			let shibai++
		fi
	done
done

echo "成功了 $chenggong 个IP"
echo "失败 $shibai 个IP"

#$0 这个程式的执行名字
#$n 这个程式的第n个参数值，n=1..9
#$* 这个程式的所有参数,此选项参数可超过9个。
#$# 这个程式的参数个数
#$$ 这个程式的PID(脚本运行的当前进程ID号)
#$! 执行上一个背景指令的PID(后台运行的最后一个进程的进程ID号)
#$? 执行上一个指令的返回值 (显示最后命令的退出状态。0表示没有错误，其他任何值表明有错误)
#$- 显示shell使用的当前选项，与set命令功能相同
#$@ 跟$*类似，但是可以当作数组用
