mypath=/usr/local/nginx
myfind=$(find $mypath -type f -name "*.conf")
for i in $myfind
do
echo "$myfind" | wc -L >> 117_nginx_ori.txt
done
