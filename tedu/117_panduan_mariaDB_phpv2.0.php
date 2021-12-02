<?php
$servername = "localhost"; 
$username = "root"; 
$password = ""; 
$e = "连接不通哈";
try { 
    $conn = new PDO("mysql:host=$servername;dbname=mysql;port=3306", $username, $password); 
    echo "mysql连接成功"; 
} 
catch(PDOException $e) 
{ 
    echo $e->getMessage(); 
} 
?>
