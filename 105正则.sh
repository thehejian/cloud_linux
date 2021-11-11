#!/bin/bash
################################################——》特殊符号
[:alnum:]       代表英文大小寫字元及數字，亦即 0-9, A-Z, a-z
[:alpha:]       代表任何英文大小寫字元，亦即 A-Z, a-z
[:lower:]       代表小寫字元，亦即 a-z
[:upper:]       代表大寫字元，亦即 A-Z
[:digit:]       代表數字而已，亦即 0-9

[:blank:]       代表空白鍵與 [Tab] 按鍵兩者
[:cntrl:]       代表鍵盤上面的控制按鍵，亦即包括 CR, LF, Tab, Del.. 等等
[:graph:]       除了空白字元 (空白鍵與 [Tab] 按鍵) 外的其他所有按鍵
[:print:]       代表任何可以被列印出來的字元
[:punct:]       代表標點符號 (punctuation symbol)，亦即：" ' ? ! ; : # $...
[:space:]       任何會產生空白的字元，包括空白鍵, [Tab], CR 等等
[:xdigit:]      代表 16 進位的數字類型，因此包括： 0-9, A-F, a-f 的數字與字元

############——》grep
dmesg | grep -i -B 1 -A 3 "yama"
#-i 忽略大小写
#-B 之前
#-A 之后

###——》空白行添加时，这个方法好用到爆炸
cat > 105regular_express.txt << "eof"
"Open Source" is a good mechanism to develop programs.
apple is my favorite food.
Football game is not use feet only.
this dress doesn't fit me.
However, this dress is about $ 3183 dollars.
GNU is free air not free beer.
Her hair is very beauty.
I can't finish the test.
Oh! The soup taste good.
motorcycle is cheap than car.
This window is clear.
the symbol '*' is represented as start.
Oh!	My god!
The gd software is a library for drafting programs.
You are the best is mean you are the no. 1.
The world <Happy> is the same with "glad".
I like dog.
google is the best tools for search keyword.
goooooogle yes!
go! go! Let's go.
# I am VBird
eof
cat 105regular_express.txt

grep -n "the" 105regular_express.txt
grep -nv "the" 105regular_express.txt
#-nv 显示序号，显示匹配以外的全部行

grep -n 't[ea]st' 105regular_express.txt
#单引号全部转义，双引号不转义
#方括号代表的是一个字串a或者e

grep -n "ea" 105regular_express.txt
#搜索ea

grep -n "oo" 105regular_express.txt
#搜所有含oo的

grep -n "[^g]oo" 105regular_express.txt
#搜索所有oo，排除goo 那一行

grep -n "[^a-z]oo" 105regular_express.txt
#搜索所有oo，排查"小写字母+o"一行
grep -n "[^[:lower:]]oo" 105regular_express.txt
grep -n "[A-Z]oo" 105regular_express.txt 
grep -n "[[:upper:]]oo" 105regular_express.txt

grep -n "[0-9]" 105regular_express.txt
grep -n "[[:digit:]]" 105regular_express.txt
#找到有数字的行

###########################################################行首與行尾字元 ^ $
grep -n "^the" 105regular_express.txt
grep -n '^the' 105regular_express.txt
#这里的^是首字串的意思，所有单引号转义也无所谓

grep -n '^[[:lower:]]' 105regular_express.txt
#^[] 方括号中的内容代表抽象的一个字串 [:lower:]代表a-z

grep -n '^[a-z]' 105regular_express.txt
#a-z 等于 [:lower:] 

grep -n '^[^A-Z]' 105regular_express.txt
#方括号外面是开头的意思
#方括号里面是取反的意思

grep -n '^[^[:upper:]]' 105regular_express.txt
#最外层方括号是开头的意思
#第二层方括号是取反的意思
#最里面一层这种情况，永远不会出现^

























