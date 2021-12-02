#!/bin/bash
if [ "$1" == "hello" ]; then
echo -e "Hello, how are you ? \n"
#判斷 $1 是否為 hello，如果是的話，就顯示 "Hello, how are you ?"；
elif [ -z "$1" ]; then
echo -e "你丫没输入内容\t重新执行${0}文件哈\n";
#如果沒有加任何參數，就提示使用者必須要使用的參數下達法；
elif [ "$1" != "hello" ]; then
echo -e "只能输入hello哈 \t重新执行${0}文件哈\n";
#而如果加入的參數不是 hello ，就提醒使用者僅能使用 hello 為參數。
fi
