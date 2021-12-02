#检查站点目录是否修改
mypath=/usr/local/nginx
mydate=$(date +%Y%m%d)
myfind=$(find $mypath -type f -name "*.conf")
rm -rf 117_md5sum_nginx_"$mydate".txt
for i in $myfind
#遍历全部的配置文件
do
md5sum $i >> 117_md5sum_nginx_"$mydate".txt
done

source /etc/init.d/functions
mydiff=$(diff 117_md5sum_nginx_"$mydate".txt 117_md5sum_nginx_ori.txt)
[ -z "$mydiff" ] && action "$path配置没变化" /bin/true || {
action "$path配置文件变化了" /bin/false
echo -e "详情如下:\n$mydiff"
}
