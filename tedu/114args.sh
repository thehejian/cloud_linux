#!/bin/bash
#程式的檔名為何？
echo -e "\n文档名称为$0\n"
#共有幾個參數？
echo -e "共有参数$#个\n"
#若參數的個數小於 2 則告知使用者參數數量太少
[ $# -lt 2 ] && echo -e "参数太少，只有$#个\n"
#全部的參數內容為何？
echo -e "全部参数为$@\n"
#第一個參數為何？
echo -e "第一个参数为$1\n"
#第二個參數為何
echo -e "第二个参数为$2\n"
