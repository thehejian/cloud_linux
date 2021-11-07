
#!/bin/bash

#内置操作的效率要不外部的快很多
chart=$(seq -s " " 100)
#-s 使用字符等分割

echo ${#chart}
#291
#字符串长度

expr length "$chart"
#echo $(expr length "$chart")
#291
#expr 方法
#$()命令结果
#"$chart" 命令要加双引号

echo $chart | wc -m
#292
echo $chart | wc -L
#291

#############################查看效率
echo "括号的的效率"
time for i in $(seq 10000);
do
count=${#chart};
done
#real	0m0.031s
#user	0m0.029s
#sys	0m0.001s

echo "expr的的效率"
time for i in $(seq 10000);
do
count=$(expr length "$chart");
done
#real	0m10.670s
#user	0m4.736s
#sys	0m5.383s

echo "wc -L的效率"
time for i in $(seq 10000);
do
count=$(echo $chart | wc -L);
done
#real	0m18.657s
#user	0m10.349s
#sys	0m7.187s


