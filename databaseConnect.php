<?php

//Connect to database using PDO 
$dsn = 'mysql:host=localhost;dbname=rojasg5_bobmusic_db';
$username = 'cyan_username';
$password = 'cyan_password';

try 
{
    $db = new PDO($dsn, $username, $password);
} 
catch (PDOException $e) 
{
    $error_message = $e->getMessage();
    echo '<p>Not connected to database</p>';
    exit();
}

?>