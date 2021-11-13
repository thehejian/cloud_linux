#!/bin.bash

cat > 113sh_example.sh << "eof"
#!/bin/bash
# Program:
#       This program shows "Hello World!" in your screen.
# History:
# 2015/07/16	VBird	First release
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH
echo -e "Hello World! \a \n"
exit 0
eof

cat 113sh_example.sh

###########################################——》良好习惯
script 的功能；
script 的版本資訊；
script 的作者與聯絡方式；
script 的版權宣告方式；
script 的 History (歷史紀錄)；
script 內較特殊的指令，使用『絕對路徑』的方式來下達；
script 運作時需要的環境變數預先宣告與設定。

###########################################——》日期文件
cat > 113file_date.sh << "eof"
#!/bin/bash
#这是一个按日期保存文件的脚本
#2021-11-13 何健 v1.0.0
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH
echo "这是一个批量保存文件的脚本"
read -p "请输入文件名" fileusr
filename=${fileusr:-filename}
date1=$(date --date='2 days ago' +'%Y%m%d')
date2=$(date --date='1 days ago' +'%Y%m%d')
date=$(date +'%Y%m%d')

touch 113_$file$date2.txt
touch 113_$file$date1.txt
touch 113_$file$date.txt
eof

bash 113file_date.sh
ls | grep "113.*txt" | xargs rm 

###########################################——》乘法脚本
cat > 113chengfa.sh << "eof"
#!/bin/bash
#这是一个按日期保存文件的脚本
#2021-11-13 何健 v1.0.0
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH
read -p "第一个数字" a
read -p "第二个数字" b
total=$((a*b))
#小括号内的计算，不用空格
echo "${a}X${b}=$total"
#建议变量还是加上大括号，避免出错
eof
bash 113chengfa.sh

ls | grep "113.*txt" | xargs rm

########################################——》圆周率的计算
echo "scale=3; 4*a(1)" | bc -lq
#3.140
#4*a(1) bc计算圆周率的方法
#scale=3 三位小数点

########################################——》bash和source执行
#bash执行的是子程序
#source执行的是父程序














