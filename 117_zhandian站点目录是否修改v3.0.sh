#检查站点目录是否修改
mypath=/usr/local/nginx
mydate=$(date +%Y%m%d)
myfind=$(find $mypath -type f -name "*.conf")
source /etc/init.d/functions
rm -rf 117_md5sum_nginx_"$mydate".txt
for i in $myfind
#遍历全部的配置文件
do
md5sum $i >> 117_md5sum_new_nginx_"$mydate".txt
done

mydiff=$(diff 117_md5sum_new_nginx_"$mydate".txt 117_md5sum_nginx_ori.txt)
for i in $mydiff
do
[ -z "$mydiff" ] && action "$i配置没变化" /bin/true || action "$i配置文件变化了" /bin/false
done
