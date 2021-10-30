#! /bin/bash

user=$(awk -F[:] '/bash$/{print $1}' /etc/passwd)

for i in $user
do
	grep ^$i /etc/shadow | awk -F[:] '{print $1" ----> "$2}'
done
