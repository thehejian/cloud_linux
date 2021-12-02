#!/bin/bash

read -p "请输入ip的前3位 " myip
myping() {
	ping $myip -c 1 -W 1 -i 0.2 &> /dev/null 
	#-c 1	1次
	#-W 1	超时时间1s
	#-i 0.2 频率0.2s
	if [ $? -eq 0 ] ;then
		echo "$myip.$i ping通了"
		let chenggong++
	else
		echo "$myip.$i ping不通"
		let shibai++
	fi
}


for i in {1..254}
do
	myping 192.168.1.$i &
done
wait
