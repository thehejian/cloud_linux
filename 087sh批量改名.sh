#!/bin/bash

####################——》准备文件
mkdir -p ~/cloud_linux/087mkdir批量改文件
rm -rf ~/cloud_linux/087mkdir批量改文件/*.txt
touch {1..10}hejian.txt


#file=1hejian.txt
#mv $file ${file%hejian*}.txt
myls=$(ls ~/cloud_linux/087mkdir批量改文件/*.txt)

for file in $myls
do
mv $file ${file%hejian*}.txt;
done

ls ~/cloud_linux/087mkdir批量改文件
