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
#不够严谨的方法，建议用方法二
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
cat > 117_panduan_v2.0.sh << "eof"
#!/bin/bash
read -p "input " a
mynum=$(echo "$a" | sed 's#[0-9]##g')
#[ ${#mynum} -eq 0 ] && echo -e "\n$a是纯数字" || echo -e "\n$a不是纯数字"
[ -z $mynum ] && echo -e "\n$a是纯数字" || echo -e "\n$a不是纯数字"
eof
bash 117_panduan_v2.0.sh

####################################——》判断数字3.0
cat > 117_panduan_v3.0.sh << "eof"
#!/bin/bash
read -p "input " a
mynum=$(echo "$a" | sed 's#[0-9]##g' | grep "")
#脱裤子放屁，多此一举
#[ ${#mynum} -eq 0 ] && echo -e "\n$a是纯数字" || echo -e "\n$a不是纯数字"
[ -z $mynum ] && echo -e "\n$a是纯数字" || echo -e "\n$a不是纯数字"
eof
bash 117_panduan_v3.0.sh

####################################——》判断数字4.0
cat > 117_panduan_v4.0.sh << "eof"
#!/bin/bash
read -p "input " a
mynum=$(echo "${a//[0-9]/}")
#利用变量自身的替换来实现 
#[ ${#mynum} -eq 0 ] && echo -e "\n$a是纯数字" || echo -e "\n$a不是纯数字"
[ -z $mynum ] && echo -e "\n$a是纯数字" || echo -e "\n$a不是纯数字"
eof
bash 117_panduan_v4.0.sh


####################################——》判断数字5.0
cat > 117_panduan_v5.0.sh << "eof"
#!/bin/bash
#如果a长度不为0，把a中的非数字删除，跟原来的a判断；相等则为数字
read -p "input " a
mynum=$(echo "${a//[^0-9]/}")
[ -n "$a" -a "$a" == "$mynum" ] && echo -e "\n$a是纯数字" || echo -e "\n$a不是纯数字" 
        #[ -z "$a" ] && echo "输入为空，请重新执行 $0" &&  exit
        #为空时退出
        #不能用;代表不论成功失败都执行下面的内容，会跳出循环
        #跟sed不同，记着最后没有/
        #mynum=$(echo "$a" | sed 's#[^0-9]##g')
        #[ "$a" == "$mynum" ] && echo -e "\n$a是纯数字" || echo -e "\n$a不是纯数字" 
eof
bash 117_panduan_v5.0.sh













