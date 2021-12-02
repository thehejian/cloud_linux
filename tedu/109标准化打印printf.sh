#!/bin/bash

#printf 不是管道命令
printf '列印格式' 實際內容
選項與參數：
關於格式方面的幾個特殊樣式：
       \a    警告聲音輸出
       \b    倒退鍵(backspace)
       \f    清除螢幕 (form feed)
       \n    輸出新的一行
       \r    亦即 Enter 按鍵
       \t    水平的 [tab] 按鍵
       \v    垂直的 [tab] 按鍵
       \xNN  NN 為兩位數的數字，可以轉換數字成為字元。
關於 C 程式語言內，常見的變數格式
       %ns   那個 n 是數字， s 代表 string ，亦即多少個字元；
       %ni   那個 n 是數字， i 代表 integer ，亦即多少整數位數；
       %N.nf 那個 n 與 N 都是數字， f 代表 floating (浮點)，如果有小數位數，
             假設我共要十個位數，但小數點有兩位，即為 %10.2f 囉！

printf '%s\t %s\t %s\t %s\t \n' "abc               123               345               789"
                          

cat > 109printf.txt << "eof"
Name     Chinese   English   Math    Average
DmTsai        80        60     92      77.33
VBird         75        55     80      70.00
Ken           60        90     70      73.33
eof

cat 109printf.txt

printf '%s\t %s\t %s\t %s\t %s\t \n' $(cat 109printf.txt)
printf '%10s\t %10i\t %5.1f\t %5.2f\t %10.3f\t \n' $(cat 109printf.txt | grep -v -i "name")
#%10s 10位的字符串
#%10.3f 10位整数，小数点2位的浮点数
#%10i 10位整数
#\t tab
#grep -i 忽略大小写

printf '\x34\n'
#16进制的这个值是多少
#printf 别忘了结尾\n

