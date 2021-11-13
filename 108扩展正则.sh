#!/bin/bash

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
上面的例子意思是說，我要找開頭是 A 結尾是 C ，中間有一個以上的 "xyz" 字串的意思～


##################


















