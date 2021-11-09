#!/bin/bash

touch 099cat.txt
echo "cat <<END" > 099cat.sh
sed -i '1a \
    1.DDD \
    2.DDD \
END' 099cat.sh
cat 099cat.sh

bash 099cat.sh
#能把cat输出出来

#######################打印一个简单菜单
touch 099menu.sh

echo '#!/bin/bash' > 099menu.sh
#双引号不行，得换成单引号
sed -i '1a\
memu() {\
cat <<END\
    请输入你要安装的软件，输入数字即可\
    1.[install lnmp]\
    2.[install lamp]\
    3.[exit]\
END\
}\
memu\
read num\
echo "你已经选择了$num"\
#if的写法\
if [ "$num" -eq 1 ]; then\
echo "安装lnmp";\
#bash ~/cloud_linux/install_lnmp.sh;\
else if [ "$num" -eq 2 ]; then\
echo "安装lamp";\
#bash ~/cloud_linux/install_lamp.sh;\
else if [ "$num" -eq 3 ]; then\
echo "退出啦";\
exit;\
else\
echo "重新输入哈";\
fi\
' 099menu.sh
bash 099menu.sh



#方括号的写法
[ "$num" -eq 1 ] && {\
echo "安装lnmp"\
#bash ~/cloud_linux/install_lnmp.sh\
}\
[ "$num" -eq 2 ] && {\
echo "安装lamp"\
#bash ~/cloud_linux/install_lamp.sh\
}\
[ "$num" -eq 3 ] && {\
echo "退出啦"\
exit\
}\
[ "$num" -ne 1 -a "$num" -ne 2 -a "$num" -ne 3 ] && {\
echo "重新输入哈"\
}\

