#!/bin/bash

path=/usr/local/tomcat/apache-tomcat-8.0.30/webapps/ROOT

touch $path/test.jsp

echo "<html>" >  $path/test.jsp

sed -i '1a \
<body> \
<center> \
Now time is:<%=new java.util.Date()%> //xianshi dangqian shijian \
</center> \
</body> \
</html>' $path/test.jsp

