#!/bin/bash

################################################——》比较大小
####判断条件，前后的空格，千万不能忘！！！！
#((a>b)) [ $a -gt $b ] [[ $a > $b ]]
#-eq 只能是整数哈

cat > 117_digit.sh << "eof"
#!/bin/bash
read -p "请输入两个数中间空格隔开 像： 3 7 " a b

if [ $a -gt $b ]; then
    echo -e "\n$a大与$b\n";
elif [ $a -lt $b ]; then
    echo -e "$a小与$b\n";
else
    echo -e "一样大\n";
fi
eof
bash 117_digit.sh
