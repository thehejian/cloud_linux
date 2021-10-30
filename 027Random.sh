#!/bin/bash

a=asdfjhqsdpjfhqsdfjqsdpfojalsdfmnalsdmfasldfkjqsldfkqsdfkqsdfkqsdkf
for i in {1..8}
do
	x=$[RANDOM%23]
	y=${a:x:1}
	z=$z$y
	#zhongdian zai zheli
done
echo $z
