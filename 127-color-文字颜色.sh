#!/bin/bash
#系统设定
        SETCOLOR_SUCCESS="echo -en \\033[1;32m"
        SETCOLOR_FAILURE="echo -en \\033[1;31m"
        SETCOLOR_WARNING="echo -en \\033[1;33m"

SETCOLOR_SUCCESS="echo -en \\033[1;32m"
echo "成功"  && $SETCOLOR_SUCCESS
#$脚本中使用，下一行会变色

下面是相应的字和背景颜色，可以自己来尝试找出不同颜色搭配 
echo -e "\033[31m 红色字 \033[0m"

echo -e "\033[34m 黄色字 \033[0m"

echo -e "\033[41;33m 红底黄字 \033[0m"

echo -e "\033[41;37m 红底白字 \033[0m"


Linux 字体颜色
echo -e "\033[30m 黑色字 \033[0m"
echo -e "\033[31m 红色字 \033[0m" 
echo -e "\033[32m 绿色字 \033[0m" 
echo -e "\033[33m 黄色字 \033[0m" 
echo -e "\033[34m 蓝色字 \033[0m" 
echo -e "\033[35m 紫色字 \033[0m" 
echo -e "\033[36m 天蓝字 \033[0m" 
echo -e "\033[37m 白色字 \033[0m"

 Linux 字体背景颜色40—–47
echo -e "\033[40;37m 黑底白字 \033[0m" 
echo -e "\033[41;37m 红底白字 \033[0m" 
echo -e "\033[42;37m 绿底白字 \033[0m" 
echo -e "\033[43;37m 黄底白字 \033[0m" 
echo -e "\033[44;37m 蓝底白字 \033[0m" 
echo -e "\033[45;37m 紫底白字 \033[0m" 
echo -e "\033[46;37m 天蓝底白字 \033[0m" 
echo -e "\033[47;30m 白底黑字 \033[0m"


字体闪烁：
echo -e "\033[42;30;5m wwww \033[0m"
echo -e "\033[47;30;5m wwww \033[0m"










