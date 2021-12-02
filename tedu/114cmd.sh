#當執行一個程式的時候，這個程式會讓使用者選擇 Y 或 N ，
read -p "请输入是否执行y or n " mycmd
#如果使用者輸入 Y 或 y 時，就顯示『 OK, continue 』
[ "$mycmd" == "Y" -o "$mycmd" == "y" ] && echo -e "OK, continue\n"
#这里不能用-eq，不知道什么原因
#如果使用者輸入 n 或 N 時，就顯示『 Oh, interrupt ！』
[ "$mycmd" == "N" -o "$mycmd" == "n" ] && echo -e "Oh, interrupt ！\n"
#如果不是 Y/y/N/n 之內的其他字元，就顯示『 I don't know what your choice is 』
[ "$mycmd" != "Y" -o "$mycmd" != "y"  -o "$mycmd" != "N" -o "$mycmd" != "n" ] && echo -e "I don't know what your choice is\n"
#echo -e "I don't know what your choice is\n"
