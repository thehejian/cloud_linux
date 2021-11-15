#!/bin/bash
echo "计算未来预期时间距现在的天数"
read -p "请预期输入时间，格式参考 20221231 " dateori
echo "$dateori" | grep "[0-9]\{8\}" > /dev/null 2>&1
[ "$?" != "0" ] && echo -e "\n 格式不对哈，重新输入；重新执行 $0"

data_s_now=$(date +%s)
date_s_ori=$(date --date=$dateori +%s)
#预期时间和现在时间的秒数

date_s_last=$((date_s_ori-data_s_now))
#剩余秒数
date_d_last=$((date_s_last/60/60/24))
#剩余天数
date_y_last=$((date_d_last/365))
#剩余年
date_y_d_last=$((date_d_last%365))
#不足一年的天数
echo -e "\n剩余$date_y_last年,$date_y_d_last天 \n"

