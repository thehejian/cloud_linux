<?php
$servername = "localhost"; 
$username = "root"; 
$password = ""; 
$e = "连接不通哈";
try { 
    $conn = new PDO("mysql:host=$servername;dbname=mysql;port=3306", $username, $password); 
    echo "连接成功 -> 1.116.26.230"; 
} 
catch(PDOException $e) 
{ 
    echo $e->getMessage(); 
} 
?>
#php 117_panduan_mariaDB_phpv2.0.php
/bin/cp -rf 117_panduan_mariaDB_phpv2.0.php /usr/local/nginx/html/
curl 1.116.26.230/117_panduan_mariaDB_phpv2.0.php
