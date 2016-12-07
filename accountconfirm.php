<?php

  /*When the admin goes to create an admin account, it
    checks that the username and email have not already 
    been used. If not, it sucessfully creates the admin account.*/

  //connect to database
  include 'dbh.php';
  global $db;

  //receives user input from form in createaccount.php
  if($_SERVER["REQUEST_METHOD"] == "POST")
  {
    $first_name = mysqli_real_escape_string($db, $_POST['firstname']);
    $last_name = mysqli_real_escape_string($db, $_POST['lastname']);
    $email_address = mysqli_real_escape_string($db, $_POST['email']);
    $user_name = mysqli_real_escape_string($db, $_POST['username']);
    $password = mysqli_real_escape_string($db, $_POST['pass']);

    //save input into session which we can echo in the html
    $_SESSION['first_name'] = $first_name;  
    $_SESSION['last_name'] = $last_name;  
    $_SESSION['email_address'] = $email_address; 
    $_SESSION['user_name'] = $user_name;

    $bool = true;

    //query the admins table
    $query = mysqli_query($db, "SELECT * FROM admins");

    //displaying all rows from query
    while($row = mysqli_fetch_array($query))
    {
      /*the first username row is passed on to $table_username,
      and so on until the query is finished */
      $table_username = $row['admin_Username'];

      //checks if there are any matching fields
      if($user_name == $table_username)
      {
        $bool = false;
        //tell the user that the username has been taken
        print '<script>alert("Username has been taken!");</script>';
        //redirects to createaccount.php
        print '<script>window.location.assign("createaccount.php");</script>';
      }

      /*the first email row is passed on to $table_email,
      and so on until the query is finished */
      $table_email = $row['admin_Email'];

      //checks if there are any matching fields
      if($email_address == $table_email)
      {
        $bool = false;
        //tell the user that the email has been taken
        print '<script>alert("Email has already been used!");</script>';
        //redirects to createaccount.php
        print '<script>window.location.assign("createaccount.php");</script>';
      }
    }

    //if there are no conflicts of username or email
    if($bool)
    {
      //insert the values to table admins
      mysqli_query($db, "INSERT INTO admins (admin_FName, admin_LName, admin_Email, admin_Username, admin_Password) 
        VALUES ('$first_name', '$last_name', '$email_address', '$user_name', '$password')");
      //prompt to let user know registration was succesful
      print '<script>alert("Successully registered!");</script>';
    }
  }
?>

<!DOCTYPE html>
<html>
<?php include 'header.php'; ?>
  <body>
  
      <h1>Admin Account Confirmation </h1><br>
      <h4>First Name:</h4>
      <?php echo $_SESSION['first_name']; ?><br>
      <h4>Last Name:</h4>
      <?php echo $_SESSION['last_name']; ?><br>
      <h4>Email:</h4>
      <?php echo $_SESSION['email_address']; ?><br>
      <h4>Username:</h4>
      <?php echo $_SESSION['user_name']; ?><br>
    
      <?php include 'footer.php'; ?>

  </body>

</html>