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
