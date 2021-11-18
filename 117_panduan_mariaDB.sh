#!/bin/bash
#mysql -u root -p '123456' > /dev/null 2>&1
mysql -u root > /dev/null 2>&1
#没设置密码，-p就省略掉吧
[ $? -eq 0 ] && echo "mysql已" && exit || echo "mysql没启动"
