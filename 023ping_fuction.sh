#!/bin/bash
myping() {
	ping $1 -c 1 -W 1 -i 0.2 &> /dev/null 
	if [ $? -eq 0 ] ;then
		echo "$1.$i ping tongle OK"
		let chenggong++
	else
		echo "$1.$i mei ping tong noOK"
		let shibai++
	fi
}


for i in {1..254}
do
	myping 192.168.1.$i &
done
wait
