#!/bin/bash

#for i in {1..200}
#do
#
#done

for (( i=0; i<=100; i++))
do
	yu=$[i%6]
	[ $yu -ne 0 ] && continue
	# budengyu0 de jixu zhixing; dengyu0 de zhixing xiamian de ;tiaoguo zhege buzhou,butiaochu xunhuan
	echo $[i+10]
done
