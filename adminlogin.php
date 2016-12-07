<?php include 'header.php'; ?>

<!DOCTYPE html>
<!--Creates the Admin Login page. Info posted here
will be sent to adminconfirm.php to check credentials.-->
<html>
	<body>
	
		<h1>Admin Login </h1>
		<form method="POST" action="adminconfirm.php">
		<h4>Username:</h4>
		<input type="text" name="username"><br>
		<h4>Password:</h4>
		<input type="password" name="pass"><br><br>
		<input id="button" type="submit" name="submit" value="Login">
		</form>
		
		<?php include 'footer.php'; ?>

	</body>

</html>
