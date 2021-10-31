#! /bin/bash
user=sed -n '/$bash/s/:.*//p' /etc/passwd

for i in $user
do
	pass1=sed -n '/^$i/p' /etc/shadow
	pass2=${pass1#.*:}
	pass=${pass2%%:*}
	echo $i ---> $pass
done


