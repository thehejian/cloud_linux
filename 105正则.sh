#!/bin/bash
^word           意義：待搜尋的字串(word)在行首！
                範例：搜尋行首為 # 開始的那一行，並列出行號
                grep -n '^#' regular_express.txt
word$	        意義：待搜尋的字串(word)在行尾！
                範例：將行尾為 ! 的那一行列印出來，並列出行號
                grep -n '!$' regular_express.txt
.	        意義：代表『一定有一個任意字元』的字符！
                範例：搜尋的字串可以是 (eve) (eae) (eee) (e e)， 但不能僅有 (ee) ！亦即 e 與 e 中間『一定』僅有一個字元，而空白字元也是字元！
                grep -n 'e.e' regular_express.txt
\	        意義：透過 shell 的跳脫字符，將特殊符號的特殊意義去除！
                範例：搜尋含有單引號 ' 的那一行！
                grep -n \' regular_express.txt
*	        意義：重複零個到無窮多個的前一個 RE 字符
                範例：找出含有 (es) (ess) (esss) 等等的字串，注意，因為 * 可以是 0 個，所以 es 也是符合帶搜尋字串。另外，因為 * 為重複『前一個 RE 字符』的符號， 因此，在 * 之前必須要緊接著一個 RE 字符喔！例如任意字元則為 『.*』 ！
                grep -n 'ess*' regular_express.txt
[list]	        意義：字元集合的 RE 字符，裡面列出想要擷取的字元！
                範例：搜尋含有 (gl) 或 (gd) 的那一行，需要特別留意的是，在 [] 當中『謹代表一個待搜尋的字元』， 例如『 a[afl]y 』代表搜尋的字串可以是 aay, afy, aly 即 [afl] 代表 a 或 f 或 l 的意思！
                grep -n 'g[ld]' regular_express.txt
                [n1-n2]	意義：字元集合的 RE 字符，裡面列出想要擷取的字元範圍！
                範例：搜尋含有任意數字的那一行！需特別留意，在字元集合 [] 中的減號 - 是有特殊意義的，他代表兩個字元之間的所有連續字元！但這個連續與否與 ASCII 編碼有關，因此，你的編碼需要設定正確(在 bash 當中，需要確定 LANG 與 LANGUAGE 的變數是否正確！) 例如所有大寫字元則為 [A-Z]
                grep -n '[A-Z]' regular_express.txt
[^list]	        意義：字元集合的 RE 字符，裡面列出不要的字串或範圍！
                範例：搜尋的字串可以是 (oog) (ood) 但不能是 (oot) ，那個 ^ 在 [] 內時，代表的意義是『反向選擇』的意思。 例如，我不要大寫字元，則為 [^A-Z]。但是，需要特別注意的是，如果以 grep -n [^A-Z] regular_express.txt 來搜尋，卻發現該檔案內的所有行都被列出，為什麼？因為這個 [^A-Z] 是『非大寫字元』的意思， 因為每一行均有非大寫字元，例如第一行的 "Open Source" 就有 p,e,n,o.... 等等的小寫字
                grep -n 'oo[^t]' regular_express.txt
\{n,m\}	        意義：連續 n 到 m 個的『前一個 RE 字符』
                意義：若為 \{n\} 則是連續 n 個的前一個 RE 字符，
                意義：若是 \{n,\} 則是連續 n 個以上的前一個 RE 字符！ 範例：在 g 與 g 之間有 2 個到 3 個的 o 存在的字串，亦即 (goog)(gooog)
                grep -n 'go\{2,3\}g' regular_express.txt

#################################################——》通配符意思
『萬用字元』並不相同， 例如，在萬用字元當中的 * 代表的是『 0 ~ 無限多個字元』的意思
正規表示法當中， * 則是『重複 0 到無窮多個的前一個 RE 字符』
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


grep -n "\.$" 105regular_express.txt
cat -An 105regular_express.txt | head -n 10 | tail -n 4
grep -n "^$" 105regular_express.txt
grep -n -v "^$" 105regular_express.txt | grep -v "^#"
grep -n -v "^$" 105regular_express.txt | grep -v "^#" | cat -A
grep -E -v -n "^$|^#" 105regular_express.txt
egrep -nv "^$|^#" 105regular_express.txt

################################################################正则的.和*
. (小數點)：代表『一定有一個任意字元』的意思；
* (星星號)：代表『重複前一個字元， 0 到無窮多次』的意思，為組合形態

grep -n "g..d" 105regular_express.txt
#grep -n "g??d" 105regular_express.txt
#这样不对哦

grep -n "o*" 105regular_express.txt
#出现o 0次以及0次以上的内容，也就是全部页面

grep -n "oo*" 105regular_express.txt
#出现o （2-1）1次以及1次以上的内容
grep -n "ooo*" 105regular_express.txt
#2个oo及以上的内容

grep -n "g*g" 105regular_express.txt
#前面的g和后面的g， 前后任意出现一次，都显示
#grep -n "g*" 105regular_express.txt
#这两个都是显示全部；*前后没放内容则代表任意子串出现0次以及0次以上

#grep -n "*g" 105regular_express.txt
#grep -n "*gg" 105regular_express.txt
#*代表重复前面字节，现在前面字节为空，匹配不到
#重複 0 個或多個前面的 RE 字符

ll *txt
#注意区别，ll不支持正则；这里的*是通配符

grep -n "go*g" 105regular_express.txt
#gg之间0个及以上o
grep -n "goo*g" 105regular_express.txt
#gg之间1个及以上o
grep -n "gooo*g" 105regular_express.txt
#gg之间2个及以上o
grep -n "g*g" 105regular_express.txt
#后面g是固定的，所以搜索的内容必须的包含尾巴是g的内容
#前面一个g代表，这个g出现0次或0次以上
grep -n "g*" 105regular_express.txt
#*后面没有东西，不匹配任何内容,类似下面这行，会显示全部内容
#grep -n "" 105regular_express.txt
#*前面的g代表出现0次或0次以上，类似上面的命令

grep -n "*g" 105regular_express.txt
#匹配不到任何内容
#*前面不写代表全部内容类似下面内容
#grep -n "" 105regular_express.txt
#代表???

grep -n "*g" 105regular_express.txt 
#匹配不到任何内容；*前面必须放东西，哪怕是.
grep -n "a*g" 105regular_express.txt 
#g结尾，a出现0次以及以上
grep -n ".*g" 105regular_express.txt 
#从第一个子串开始，包含空格，g结尾，（任意字节）.出现0次及以上
#找到所以g
grep -n "..*g" 105regular_express.txt 
#从第一个子串开始，包含空格，g结尾，（任意字节）.出现1次及以上；
#g 这行会被过滤;*之前的任意字节没有出现
grep -n "...*g" 105regular_express.txt 
#从第一个子串开始，包含空格，g结尾，（任意字节）.出现2次及以上；
#开始到g，不能少于2个字节；
#g 这行会被过滤掉
# g 空格+g 这行会被过滤掉
grep -n ".*g" 105regular_express.txt
#g结尾，任意子串出现0次及以上
#有g的内容；选中的颜色是从开头到g出现那个字节全部显示
grep -n "g.*" 105regular_express.txt 
#g出现0次及以上
#有g的内容；g开头到结尾
grep -n "g*" 105regular_express.txt
#全部内容；g颜色
grep -n "gg*" 105regular_express.txt
#g出现1个以上；g颜色

grep -n -E "^g|g$" 105regular_express.txt
#g开头或者g结尾的
#g在行首

grep -n "g.*g" 105regular_express.txt
#g开头或者g结尾的
#g在行中任意位置

grep -n "[0-9]" 105regular_express.txt
grep -n "[0-9][[:digit:]]*" 105regular_express.txt
#结果一样，下面为正则（RE）的写法

grep -n "ooo*" 105regular_express.txt
grep -En "o{2}" 105regular_express.txt
egrep -n "o{2}" 105regular_express.txt
grep -n "o\{2\}" 105regular_express.txt
#不加E时，要对{}进行转义




