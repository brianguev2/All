<?php 
	/*Deletes employee from database after admin clicks 
	on link to delete in employeelist.php*/

	//connect to database
	include 'dbh.php';
	global $db;

	//get 'id' of employee from employeelist.php
    $empID = $_GET['id'];

    //query the employee table
	$query = mysqli_query($db, "SELECT * FROM employee");

	//delete employee from employee table	
	mysqli_query($db, "DELETE FROM employee WHERE e_Username = '$empID'");

?>

<html>
<?php include 'header.php' ?>
<!--Confirm that employee was deleted.-->
<body>
	<p>Successfully deleted <?php echo $employees['e_Username']; ?></p>
	<p><a href="employeelist.php">Return to Employee List</a></p>
	<p><a href="adminconfirm.php">Return to Admin Main Page</a></p>
</body>
<?php include 'footer.php' ?>
</html>