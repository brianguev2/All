<?php

//connect to database using mysqli
$db = mysqli_connect("localhost", "cyan_username", "cyan_password", "rojasg5_bobmusic_db");

if(!$db) 
{
    die("Connection failed: ".mysqli_connect_error());
}
?>
