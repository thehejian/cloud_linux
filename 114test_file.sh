#!/bin/bash
# 1. 讓使用者輸入檔名，並且判斷使用者是否真的有輸入字串？
read -p "请输入文件名称" filename
test -z "$filename" && exit 0
# 2. 判斷檔案是否存在？若不存在則顯示訊息並結束腳本
test ! -e "$filename" && echo "文件不存在哈" && exit 0
# 3. 開始判斷檔案類型與屬性
test -r "$filename" && fileperm="可读"
test -w "$filename" && fileperm="可修改"
test -x "$filename" && fileperm="可执行"

test -f "$filename" && filetype="这是个普通文件"
test -d "$filename" && filetype="这是个文件夹"
# 4. 開始輸出資訊！
echo -e "$filename的文件类型是$filetype \n$filename的权限是$fileperm"
#-e代表支持\n等
