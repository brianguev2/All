<?php
	session_start();
	session_destroy();
	header("Location: index.php");

	//also added logout to header so user can logout of website
?>