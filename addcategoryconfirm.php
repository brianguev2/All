<?php
  
  /*When the admin goes to create a new category in the
  database, it checks if that category already exists.*/

  //connect to database
  include 'dbh.php';
  global $db;

  if($_SERVER["REQUEST_METHOD"] == "POST")
  {
    //receives user input for category from form in addcategory.php
    $category_name = mysqli_real_escape_string($db, $_POST['category_name']);

    //save input into session which we can echo in the html
    $_SESSION['category_name'] = $category_name;  

    $bool = true;

    //query the category table
    $query = mysqli_query($db, "SELECT * FROM category");

    //displaying all rows from query
    while($row = mysqli_fetch_array($query))
    {
      /*the first category row is passed on to $table_category,
      and so on until the query is finished */
      $table_category = $row['categoryName'];

      //if a category name that was entered matches one in the database
      if($category_name == $table_category)
      {
        $bool = false;

        //tell the user that the category already exists
        print '<script>alert("Category already exists!");</script>';
        //redirects to addcategory.php
        print '<script>window.location.assign("addcategory.php");</script>';
      }

    }

    //if the category does not exist
    if($bool)
    {
      //insert the value to table category
      mysqli_query($db, "INSERT INTO category (categoryName) VALUES ('$category_name')");
      //prompt to let user know addition was succesful
      print '<script>alert("Successully added category!");</script>';
    }
  }
?>

<!DOCTYPE html>
<html>
<?php include 'header.php'; ?>
  <body>
  
      <h1>Category Addition Confirmation </h1><br>
      <h4>Category Name:</h4>
      <?php echo $_SESSION['category_name']; ?><br>
    
    <?php include 'footer.php'; ?>
    
  </body>

</html>