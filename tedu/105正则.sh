#!/bin/bash
##############################################################################################——》常用正则
一、校验数字的表达式
数字：^[0-9]*$
n位的数字：^\d{n}$
至少n位的数字：^\d{n,}$
m-n位的数字：^\d{m,n}$
零和非零开头的数字：^(0|[1-9][0-9]*)$
非零开头的最多带两位小数的数字：^([1-9][0-9]*)+(\.[0-9]{1,2})?$
带1-2位小数的正数或负数：^(\-)?\d+(\.\d{1,2})$
正数、负数、和小数：^(\-|\+)?\d+(\.\d+)?$
有两位小数的正实数：^[0-9]+(\.[0-9]{2})?$
有1~3位小数的正实数：^[0-9]+(\.[0-9]{1,3})?$
非零的正整数：^[1-9]\d*$ 或 ^([1-9][0-9]*){1,3}$ 或 ^\+?[1-9][0-9]*$
非零的负整数：^\-[1-9][]0-9"*$ 或 ^-[1-9]\d*$
非负整数：^\d+$ 或 ^[1-9]\d*|0$
非正整数：^-[1-9]\d*|0$ 或 ^((-\d+)|(0+))$
非负浮点数：^\d+(\.\d+)?$ 或 ^[1-9]\d*\.\d*|0\.\d*[1-9]\d*|0?\.0+|0$
非正浮点数：^((-\d+(\.\d+)?)|(0+(\.0+)?))$ 或 ^(-([1-9]\d*\.\d*|0\.\d*[1-9]\d*))|0?\.0+|0$
正浮点数：^[1-9]\d*\.\d*|0\.\d*[1-9]\d*$ 或 ^(([0-9]+\.[0-9]*[1-9][0-9]*)|([0-9]*[1-9][0-9]*\.[0-9]+)|([0-9]*[1-9][0-9]*))$
负浮点数：^-([1-9]\d*\.\d*|0\.\d*[1-9]\d*)$ 或 ^(-(([0-9]+\.[0-9]*[1-9][0-9]*)|([0-9]*[1-9][0-9]*\.[0-9]+)|([0-9]*[1-9][0-9]*)))$
浮点数：^(-?\d+)(\.\d+)?$ 或 ^-?([1-9]\d*\.\d*|0\.\d*[1-9]\d*|0?\.0+|0)$

二、校验字符的表达式
汉字：^[\u4e00-\u9fa5]{0,}$
英文和数字：^[A-Za-z0-9]+$ 或 ^[A-Za-z0-9]{4,40}$
长度为3-20的所有字符：^.{3,20}$
由26个英文字母组成的字符串：^[A-Za-z]+$
由26个大写英文字母组成的字符串：^[A-Z]+$
由26个小写英文字母组成的字符串：^[a-z]+$
由数字和26个英文字母组成的字符串：^[A-Za-z0-9]+$
由数字、26个英文字母或者下划线组成的字符串：^\w+$ 或 ^\w{3,20}$
中文、英文、数字包括下划线：^[\u4E00-\u9FA5A-Za-z0-9_]+$
中文、英文、数字但不包括下划线等符号：^[\u4E00-\u9FA5A-Za-z0-9]+$ 或 ^[\u4E00-\u9FA5A-Za-z0-9]{2,20}$
可以输入含有^%&',;=?$\"等字符：[^%&',;=?$\x22]+
禁止输入含有~的字符：[^~\x22]+

三、特殊需求表达式
Email地址：^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$
域名：[a-zA-Z0-9][-a-zA-Z0-9]{0,62}(\.[a-zA-Z0-9][-a-zA-Z0-9]{0,62})+\.?
InternetURL：[a-zA-z]+://[^\s]* 或 ^http://([\w-]+\.)+[\w-]+(/[\w-./?%&=]*)?$
手机号码：^(13[0-9]|14[5|7]|15[0|1|2|3|4|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\d{8}$
电话号码("XXX-XXXXXXX"、"XXXX-XXXXXXXX"、"XXX-XXXXXXX"、"XXX-XXXXXXXX"、"XXXXXXX"和"XXXXXXXX)：^(\(\d{3,4}-)|\d{3.4}-)?\d{7,8}$
国内电话号码(0511-4405222、021-87888822)：\d{3}-\d{8}|\d{4}-\d{7}
电话号码正则表达式（支持手机号码，3-4位区号，7-8位直播号码，1－4位分机号）: ((\d{11})|^((\d{7,8})|(\d{4}|\d{3})-(\d{7,8})|(\d{4}|\d{3})-(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1})|(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1}))$)
身份证号(15位、18位数字)，最后一位是校验位，可能为数字或字符X：(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)
帐号是否合法(字母开头，允许5-16字节，允许字母数字下划线)：^[a-zA-Z][a-zA-Z0-9_]{4,15}$
密码(以字母开头，长度在6~18之间，只能包含字母、数字和下划线)：^[a-zA-Z]\w{5,17}$
强密码(必须包含大小写字母和数字的组合，不能使用特殊字符，长度在 8-10 之间)：^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])[a-zA-Z0-9]{8,10}$
强密码(必须包含大小写字母和数字的组合，可以使用特殊字符，长度在8-10之间)：^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,10}$
日期格式：^\d{4}-\d{1,2}-\d{1,2}
一年的12个月(01～09和1～12)：^(0?[1-9]|1[0-2])$
一个月的31天(01～09和1～31)：^((0?[1-9])|((1|2)[0-9])|30|31)$
钱的输入格式：
      有四种钱的表示形式我们可以接受:"10000.00" 和 "10,000.00", 和没有 "分" 的 "10000" 和 "10,000"：^[1-9][0-9]*$
      这表示任意一个不以0开头的数字,但是,这也意味着一个字符"0"不通过,所以我们采用下面的形式：^(0|[1-9][0-9]*)$
      一个0或者一个不以0开头的数字.我们还可以允许开头有一个负号：^(0|-?[1-9][0-9]*)$
      这表示一个0或者一个可能为负的开头不为0的数字.让用户以0开头好了.把负号的也去掉,因为钱总不能是负的吧。下面我们要加的是说明可能的小数部分：^[0-9]+(.[0-9]+)?$
      必须说明的是,小数点后面至少应该有1位数,所以"10."是不通过的,但是 "10" 和 "10.2" 是通过的：^[0-9]+(.[0-9]{2})?$
      这样我们规定小数点后面必须有两位,如果你认为太苛刻了,可以这样：^[0-9]+(.[0-9]{1,2})?$
      这样就允许用户只写一位小数.下面我们该考虑数字中的逗号了,我们可以这样：^[0-9]{1,3}(,[0-9]{3})*(.[0-9]{1,2})?$
      1到3个数字,后面跟着任意个 逗号+3个数字,逗号成为可选,而不是必须：^([0-9]+|[0-9]{1,3}(,[0-9]{3})*)(.[0-9]{1,2})?$
      备注：这就是最终结果了,别忘了"+"可以用"*"替代如果你觉得空字符串也可以接受的话(奇怪,为什么?)最后,别忘了在用函数时去掉去掉那个反斜杠,一般的错误都在这里
xml文件：^([a-zA-Z]+-?)+[a-zA-Z0-9]+\\.[x|X][m|M][l|L]$
中文字符的正则表达式：[\u4e00-\u9fa5]
双字节字符：[^\x00-\xff] (包括汉字在内，可以用来计算字符串的长度(一个双字节字符长度计2，ASCII字符计1))
空白行的正则表达式：\n\s*\r (可以用来删除空白行)
HTML标记的正则表达式：<(\S*?)[^>]*>.*?|<.*? /> ( 首尾空白字符的正则表达式：^\s*|\s*$或(^\s*)|(\s*$) (可以用来删除行首行尾的空白字符(包括空格、制表符、换页符等等)，非常有用的表达式)
腾讯QQ号：[1-9][0-9]{4,} (腾讯QQ号从10000开始)
中国邮政编码：[1-9]\d{5}(?!\d) (中国邮政编码为6位数字)
IPv4地址：((2(5[0-5]|[0-4]\d))|[0-1]?\d{1,2})(\.((2(5[0-5]|[0-4]\d))|[0-1]?\d{1,2})){3}
##############################################################################################——》基本用法
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
############################################################################################——扩展用法
+	意義：重複『一個或一個以上』的前一個 RE 字符
        範例：搜尋 (god) (good) (goood)... 等等的字串。 那個 o+ 代表『一個以上的 o 』所以，底下的執行成果會將第 1, 9, 13 行列出來。
        egrep -n 'go+d' regular_express.txt
?	意義：『零個或一個』的前一個 RE 字符
        範例：搜尋 (gd) (god) 這兩個字串。 那個 o? 代表『空的或 1 個 o 』所以，上面的執行成果會將第 13, 14 行列出來。 有沒有發現到，這兩個案例( 'go+d' 與 'go?d' )的結果集合與 'go*d' 相同？ 想想看，這是為什麼喔！ ^_^
        egrep -n 'go?d' regular_express.txt
|	意義：用或( or )的方式找出數個字串
        範例：搜尋 gd 或 good 這兩個字串，注意，是『或』！ 所以，第 1,9,14 這三行都可以被列印出來喔！那如果還想要找出 dog 呢？
        egrep -n 'gd|good' regular_express.txt
        egrep -n 'gd|good|dog' regular_express.txt
()	意義：找出『群組』字串
        範例：搜尋 (glad) 或 (good) 這兩個字串，因為 g 與 d 是重複的，所以， 我就可以將 la 與 oo 列於 ( ) 當中，並以 | 來分隔開來，就可以啦！
        egrep -n 'g(la|oo)d' regular_express.txt
()+	意義：多個重複群組的判別
        範例：將『AxyzxyzxyzxyzC』用 echo 叫出，然後再使用如下的方法搜尋一下！
        echo 'AxyzxyzxyzxyzC' | egrep 'A(xyz)+C'
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

########################################################——》回顾
grep '\*' /etc/* 2>/dev/null
#etc下面全部文件中含有*的文件
#2>/dev/null 标准错误输出到黑洞

grep "*" $(find /etc/ -type f) 2>/dev/null
#搜索/etc 下所有文件中包含*的文件和含*的那一行

grep "*" $(find / -type f)
-bash: /usr/bin/grep: Argument list too long
#文件太多时会报错

#find找到文件,文件路径紧跟find
#xargs -n 10 每次传参10个 进行执行
#xargs配合管道
find / -type f | xargs -n 10 grep "*"
find / -type f | xargs -n 10 grep -l "*"

ifconfig eth0 | grep inet | grep -v inet6 | awk '{print $2}'
ifconfig eth0 | grep inet | grep -v inet6 | sed 's/.*inet//g' | sed 's/netmask.*//g' | sed 's/[[:blank:]]//g'
alias="myip=ifconfig eth0 | grep inet | grep -v inet6 | sed 's/.*inet//g' | sed 's/netmask.*//g' | sed 's/[[:blank:]]//g'"
alias="myip=ifconfig eth0 | grep 'inet ' | sed 's/^.*inet //g' | sed 's/ netmask.*$//'"
#inet后面的空格和netmask前面的空格可以sed去掉

alias myip="ifconfig eth0 | grep 'inet ' | sed 's/^.*inet //g'| sed 's/ *netmask.*$//g'"
myip=$(ifconfig eth0 | grep 'inet ' | sed 's/^.*inet //g'| sed 's/ *netmask.*$//g')
MYIP=$myip

cat >> ~/.bashrc << "eof"
alias myip="ifconfig eth0 | grep 'inet ' | sed 's/^.*inet //g'| sed 's/ *netmask.*$//g'"
myip=$(ifconfig eth0 | grep 'inet ' | sed 's/^.*inet //g'| sed 's/ *netmask.*$//g')
MYIP=$myip
eof
#这个方法比sed合适
tail -n 10 ~/.bashrc

find /etc -type f | xargs -n 10 grep "[XYZ]" --color=auto
#在 /etc 底下，只要含有 XYZ 三個字元的任何一個字元的那一行就列出來
find /etc -type f | xargs -n 10 grep -l "[XYZ]"

/etc/kdump.conf 內容取出後，(1)去除開頭為 # 的行 (2)去除空白行 (3)取出開頭為英文字母的那幾行 (4)最終統計總行數
egrep -v "^#|^$" /etc/kdump.conf | grep "^[a-zA-Z]" | wc -l
egrep -v "^#|^$" /etc/kdump.conf | grep "^[[:alpha:]]" | wc -l





