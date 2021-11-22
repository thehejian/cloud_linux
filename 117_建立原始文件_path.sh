#建立默认文件
mypath=/usr/local/nginx
myfind=$(find "$mypath" -type f -name "*.conf")
#rm -rf 117_zhandian站点目录是否修改_path.sh
for i in $myfind
#遍历全部的配置文件
do
md5sum $i >> 117_md5sum_nginx_ori.txt
done
