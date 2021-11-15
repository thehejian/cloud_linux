#!/bin/bash
myfile=115netstat.txt
netstat -lnptu > $myfile
mytest=$(grep ":80" "$myfile")
[ -n "$mytest" ] && echo -e "\n有www服务器，端口是80\n"
#[我草，方括号中的变量一定要加双引号不然报错]
grep ":22" "$myfile" > /dev/null 2>&1
if [ $? == 0 ]; then
echo -e "有ssh服务器，端口是22\n"
fi
grep ":21" "$myfile" > /dev/null 2>&1
[ $? == 0 ] && echo -e "有ftp服务器，端口是21\n" || echo -e "没有ftp服务器\n"
mytest=$(grep ":25" "$myfile")
if [ "$mytest" != "" ]; then
echo -e "有mail服务器，端口是25\n"
else
echo -e "没有mail服务器\n"
fi
