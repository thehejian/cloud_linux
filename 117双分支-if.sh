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

####################################——》判断数字1.0
cat > 117_panduan.sh << "eof"
#!/bin/bash
read -p "input " a
mya1=$(echo "$a" | grep "[0-9]")
#判断数字
mya2=$(echo "$a" | grep "[a-zA-Z]")
#判断字母
#[ ${#mya1} -eq 0 ] && echo "纯字母" || echo "纯数字"
if [ ${#mya1} -eq 0 ]; then
echo "纯字串（特殊符号也算）";
elif [ ${#mya2} -eq 0 ]; then
echo "纯数字";
else
echo "不是纯数字或者纯字串";
fi
eof
bash 117_panduan.sh

####################################——》判断数字2.0
cat > 117_panduan.sh_2.0 << "eof"
#!/bin/bash
read -p "input " a
mynum=$(echo "$a" | sed 's#[0-9]##g')
#[ ${#mynum} -eq 0 ] && echo -e "\n$a是纯数字" || echo -e "\n$a不是纯数字"
[ -z $mynum ] && echo -e "\n$a是纯数字" || echo -e "\n$a不是纯数字"
eof
bash 117_panduan_v2.0.sh





