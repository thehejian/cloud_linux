<?php
$link_id=mysql_connect('localhost','root','') or mysql_error();
//'主机名','用户','密码'
if($link_id){
    echo "mysql连接错误";
}else{
    echo mysql_error();
}
?>
