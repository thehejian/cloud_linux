#千万不要少个<号
#!/bin/bash
rm -rf 117_path_ori.txt
mypath=/usr/local/nginx
myfind=$(find "$mypath" -type f -name "*.conf")
#建立指纹，把所有文件放一起;字符数量加文件名
for i in $myfind
do
wc -L $i >> 117_path_ori.txt
done
source /etc/init.d/functions
for j in $myfind
do
mynow=$(cat "$j" | wc -L);
myori=$(grep "$j" 117_path_ori.txt | awk '{print $1}');
[  $mynow -eq $myori ] && action "$j  文件没变" /bin/true || action "$j  文件变了" /bin/fasle;
done
