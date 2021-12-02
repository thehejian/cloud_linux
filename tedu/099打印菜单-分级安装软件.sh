#!/bin/bash
#######################打印一个简单菜单
#touch 099menu.sh
#重定向时，自动创建文件
#sed -i后面千万不要跟双引号，会很奇怪，引入各种东西；特殊字符会被单引号转义；但是内容中如果出现单引号，建议换成#，后面再把#替换
#sed -i最后可以这样 ' 099menu.sh和初始的sed -i '1a\
#echo 后面也不要双引号，特别是有特殊字符时；
#-bash: !/bin/bash": event not found
#双引号不行，得换成单引号

echo '#!/bin/bash' > 099menu.sh
sed -i '1a\
menu1() {\
cat <<END\
    请输入你要安装的软件，输入数字即可\
    1.[install lnmp]\
    2.[install lamp]\
    3.[exit]\
END\
}\
menu2() {\
cat <<END\
    ========================================\
    请输入你要安装的二级软件，输入数字即可\
    1.[install apache]\
    2.[install php]\
    3.[install mysql]\
    4.[back]\
    ========================================\
END\
}\
menu1\
read num\
#方括号的写法\
[ $num -eq 1 ] && {\
echo 安装lnmp\
#bash ~/cloud_linux/install_lnmp.sh\
menu2\
read num2\
[ $num2 -eq 1 ] && {\
    echo 安装apache\
}\
}\
' 099menu.sh
bash 099menu.sh











#实现echo多行的功能
cat <<END\
    请输入你要安装的软件，输入数字即可\
    1.[install lnmp]\
    2.[install lamp]\
    3.[exit]\
END\
############################################if的写法，先不关注\
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

#menu1选择其他时的写法，后面再更新吧
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

######################——》cat的使用方法
touch 099cat.txt
echo "cat <<END" > 099cat.sh
sed -i '1a \
    1.DDD \
    2.DDD \
END' 099cat.sh
cat 099cat.sh

bash 099cat.sh
#能把cat输出出来

