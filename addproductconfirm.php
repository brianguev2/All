<?php

  /*When the admin goes to add a new product in the
  database, it checks if that product already exists.*/

  //connect to database
  include 'dbh.php';
  global $db;

  if($_SERVER["REQUEST_METHOD"] == "POST")
  {
    //receives user input for product from form in addproduct.php
    $category_id = mysqli_real_escape_string($db, $_POST['category_id']);
    $product_name = mysqli_real_escape_string($db, $_POST['name']);
    $product_price = mysqli_real_escape_string($db, $_POST['price']);
    $image_name = mysqli_real_escape_string($db, $_POST['image']);
    $product_quantity = mysqli_real_escape_string($db, $_POST['quantity']);
    $description = mysqli_real_escape_string($db, $_POST['description']);

    //save input into session which we can echo in the html
    $_SESSION['category_id'] = $category_id;  
    $_SESSION['product_name'] = $product_name;  
    $_SESSION['product_price'] = $product_price; 
    $_SESSION['image_name'] = $image_name;
    $_SESSION['product_quantity'] = $product_quantity;
    $_SESSION['description'] = $description;


    $bool = true;

    //query the product table
    $query = mysqli_query($db, "SELECT * FROM product");

    //displaying all rows from query
    while($row = mysqli_fetch_array($query))
    {
      /*the first product row is passed on to $table_products,
      and so on until the query is finished */
      $table_products = $row['p_Name'];

      //if a product name that was entered matches one in the database
      if($product_name == $table_products)
      {
        $bool = false;

        //tell the user that the product already exists
        print '<script>alert("Product already exists!");</script>';
        //redirects to addproduct.php
        print '<script>window.location.assign("addproduct.php");</script>';
      }

    }

    //if the product does not exist
    if($bool)
    {
      //insert the values to table product
      mysqli_query($db, "INSERT INTO product (p_Category, p_Name, p_Price, abbrvName, p_Quantity, p_Description) 
        VALUES ('$category_id', '$product_name', '$product_price', '$image_name', '$product_quantity', '$description')");
      //prompt to let user know addition was succesful
      print '<script>alert("Successully added product!");</script>';
    }
  }
?>

<!DOCTYPE html>
<html>
<!--Page displays details of newly added product.-->
<?php include 'header.php'; ?>
  <body>
  
      <h1>Product Addition Confirmation </h1><br>
      <h4>Category ID:</h4>
      <?php echo $_SESSION['category_id']; ?><br>
      <h4>Product Name:</h4>
      <?php echo $_SESSION['product_name']; ?><br>
      <h4>Product Price:</h4>$
      <?php echo $_SESSION['product_price']; ?><br>
      <h4>Image Name:</h4>
      <?php echo $_SESSION['image_name']; ?><br>
      <h4>Product Quantity:</h4>
      <?php echo $_SESSION['product_quantity']; ?><br>
      <h4>Product Description:</h4>
      <?php echo $_SESSION['description']; ?><br>
    
  <?php include 'footer.php'; ?>

  </body>

</html>