<?php include 'header.php';

	/*Displays the employee information available in a
	table. */

	//connect to database
	include 'databaseConnect.php';

    //get tables for employee
    $queryEmployees = "SELECT *
                     FROM employee";
    $result = $db->prepare($queryEmployees);
    $result->execute();
    $employees = $result->fetchAll();
    $result->closeCursor();

?>

<html>
<head>
	<style>
		td
		{
			border-style: inset;
			padding-left: 10px;
			padding-right: 10px;
		}
	</style>
</head>

<body>
	<p><b>The following employee information is in the system:</b></p>

	<table>
	<tbody>
		<tr>
		<td>First Name</td>
		<td>Last Name</td>
		<td>Phone</td>
		<td>Address</td>
		<td>Date of Birth</td>
		<td>Username</td>
		<td>Delete Account</td>
		</tr>

		<!--display info for each employee-->
		<?php foreach ($employees as $employee) : ?>
			<tr>
			<td><?php echo $employee['e_FName']; ?></td>
			<td><?php echo $employee['e_LName']; ?></td>
			<td><?php echo $employee['e_Phone']; ?></td>
			<td><?php echo $employee['e_Address']; ?></td>
			<td><?php echo $employee['e_DOB']; ?></td>
			<td><?php echo $employee['e_Username']; ?></td>
			<!--creates a link which allows admin to delete the employee based on 'id'-->
			<td><a href="deleteemployee.php?id=<?php echo $employee['e_Username']; ?>">Delete</a></td>
			</tr>
		<?php endforeach; ?></p>

	</tbody>
	</table>

</body>
</html>