#!/bin/bash

read -p "input user " user

if [ -z $user ] ; then
	echo "input username "
	exit
fi
useradd $user 
stty -echo
read -p "input passwd" passWd
stty echo

echo $passWd | passwd --stdin $user
