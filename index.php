<?php
	session_start();
?>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Login</title>
<link rel="stylesheet" type="text/css href="style.css">
</head>
<body>


<form action="login.php" method="POST">
	<input type="text" name="uid" placeholder="Username"><br>
	<input type="password" name="pwd" placeholder="Password"><br>
	<button type="submit">LOGIN</button>
</form>


<?php
	if(isset($_SESSION['id'])) 
	{	
		echo $_SESSION['id'];
	} 
	else
	{ 
		echo "You are not logged in!";
	}
?>

	<br><br>
	
	
	<form action="logout.php" >
		<button>LOG OUT </button>
	</form>
</body>
</html>