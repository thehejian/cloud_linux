#!/bin/bash

#pv page view
#uv user view

sed -i '42a \
        location /status { \
            stub_status on; \
            #allow IP; \
            #deny IP; \
        }' /usr/local/nginx/conf/nginx.conf


systemctl reload nginx

# Active connection -> dangqian lianjie shu (bingfa shu)
# Server accepts -> jieshou lianjie cishu
# server handled -> chuli le duoshaoci; yiban jianli duoshao ci jiu chuli duoshao ci
# server requests -> qingqiu cishu

#reading -> dangqian du bao shu
#writing -> xie huiying de shujubao shu
#waiting -> qingjiu dengdai shu

# 3ci wishou jianli lianjei(syn , syn+ack ,ack) ,4ci duankai
# 1ci lianjie duoci qingjiu; bu duankai; shoudong guanbi liulanqi cai duankai 
