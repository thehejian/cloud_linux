#!/bin/bash

####################——》准备文件
path=~/cloud_linux/087mkdir批量改文件
mkdir -p $path
rm -rf $path/*
touch $path/abc{1..10}hejian.txt
ls $path

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

####################——》改文件的后缀.txt改成.TXT
#file1=1hejian.txt
#mv $file1 ${file1%.txt}.TXT
#mv $file1 ${file1/$.txt/.TXT}

for file1 in $(ls $path/*)
do
mv $file1 ${file1/%txt/doc};
done

echo "改文件的后缀.txt改成.TXT"
ls $path
echo ""

####################——》改文件的abc改成hehe
file2=abc1.TXT
mv file2 ${file2/#abc/hehe};
#一定不能忘了分号
for file2 in $(ls $path/*)
do
mv file2 ${file2/#abc/hehe};
done
echo "改文件的abc改成hehe"
ls $path
echo ""
