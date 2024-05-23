<?php
$servername = "db"; 
$username = "root";
$password = "root_password";
$dbname = "pretres_civiques";

$sql = "mysql:host=$servername;dbname=$dbname;";
    try {
        $pdo = new PDO($sql, $username, $password); 
    } catch (PDOException $error) {
        echo 'Connection error: ' . $error->getMessage();
}
?>