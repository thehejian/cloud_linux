#!/bin/bash
#使用者輸入某個目錄檔名， 然後我找出某目錄內的檔名的權限
read -p "请输入路径，像/etc " mypath
[ -z "$mypath" -o  ! -d "$mypath" ] && echo -e "\n滚，你丫没输入,bash $0"
#! -d不是目录
myls=$(ls -a "$mypath" 2> /dev/null)
#错误的输入不显示
for i in $myls
do
        perm=""
        #不停循环中，得把perm变量每次先清空，不然就会变成金字塔；
        [ -r "$mypath"/"$i" ] && perm="$perm读 "
        [ -w "$mypath"/"$i" ] && perm="$perm写 "
        [ -x "$mypath"/"$i" ] && perm="$perm执行 "
        echo -e "$mypath/$i拥有\t$perm 权限"
done
