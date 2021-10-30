#!/bin/bash

read -p "shuru IP" ping

if [ -z $ping ] ; then
	echo "shuru zhengque IP"
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
			echo "$ping.$j.$i tongletongletongletongle"
			let chenggong++
		else 
			echo "$ping.$j.$i butong"
			let shibai++
		fi
	done
done

echo "chenggong $chenggong tai"
echo "shibai $shibai tai"
