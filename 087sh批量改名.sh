#!/bin/bash

####################——》准备文件
mkdir -p ~/cloud_linux/087mkdir批量改文件
rm -rf ~/cloud_linux/087mkdir批量改文件/*.txt
touch {1..10}hejian.txt
ls /cloud_linux/087mkdir批量改文件/*.txt

####################——》改文件的名称hejian去掉
#file=1hejian.txt
#mv $file ${file%hejian*}.txt
myls=$(ls ~/cloud_linux/087mkdir批量改文件/*.txt)

for file in $myls
do
mv $file ${file%hejian*}.txt;
done

ls ~/cloud_linux/087mkdir批量改文件

####################——》改文件的后缀.txt改成.TXT
#file1=1hejian.txt
#mv $file1 ${file1%.txt}.TXT
#mv $file1 ${file1/$.txt/.TXT/}

for file1 in $myls
do
mv $file1 ${file1/$.txt/.TXT/}
done

myls
