#!/bin/bash

####################——》准备文件
path=~/cloud_linux/087mkdir批量改文件
mkdir -p $path
rm -rf $path/*
touch $path/abc{1..10}hejian.txt
echo "创建的文件"
ls $path
echo ""

####################——》改文件的名称hejian去掉
#file=1hejian.txt
#mv $file ${file%hejian*}.txt;
#一定不能忘了分号

for file in $(ls $path/*)
do
mv $file ${file%hejian*}.txt;
done
echo "改文件的名称hejian去掉"
ls $path
echo ""

###########使用awk方法
#cd $path
#ls | awk -F "hejian" '{print "mv",$0,$1$2}' | bash
#ls
#-F "hejian" 以字符串为分割
#print "mv",$0,$1$2 构造执行的命令管道传给bash

###########使用rename方法
#rename "hejian" "" $path/*

####################——》改文件的后缀.txt改成.doc
#file1=1hejian.txt
#mv $file1 ${file1%txt}doc;
#mv $file1 ${file1/$txt/doc};


for file1 in $(ls $path/*)
do
mv $file1 ${file1/%txt/doc};
done

echo "改文件的后缀.txt改成.doc"
ls $path
echo ""

####################——》改文件的abc改成hehe
#file2=abc1.doc
#mv file2 ${file2/#abc/hehe};
#mv file2 ${file2/abc/hehe};
#不要加#不然不能成功
#一定不能忘了分号
for file2 in $(ls $path/*)
do
mv $file2 ${file2/abc/hehe};
done
echo "改文件的abc改成hehe"
ls $path
echo ""
