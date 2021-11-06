#!/bin/bash

####################——》准备文件
path=~/cloud_linux/087mkdir批量改文件
mkdir -p $path
rm -rf $path/*.txt
touch $path/{1..10}hejian.txt
ls $path

####################——》改文件的名称hejian去掉
#file=1hejian.txt
#mv $file ${file%hejian*}.txt

for file in $(ls $path)
do
mv $file ${file%hejian*}.txt;
done

ls $path

####################——》改文件的后缀.txt改成.TXT
#file1=1hejian.txt
#mv $file1 ${file1%.txt}.TXT
#mv $file1 ${file1/$.txt/.TXT/}

for file1 in $(ls $path)
do
mv $file1 ${file1/$txt/TXT/}
done

ls $path
