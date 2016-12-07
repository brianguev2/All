<?php include 'header.php'; 

    /*Displays the form which allows the admin to add 
    a new product to the database. The input is then
    passed on to addproductconfirm.php */

    //connect to database
    include 'databaseConnect.php';
    global $db;
    

    //sets default category to be displayed in drop-down to category 1
    $category_id = filter_input(INPUT_GET, 'category_id', FILTER_VALIDATE_INT);
    if ($category_id == NULL || $category_id == FALSE) 
    {
        $category_id = 1;
    }

    //get all categories and print a list of categories
    $queryAllCategories = 'SELECT * FROM category
                           ORDER BY p_Category';

    $statement2 = $db->prepare($queryAllCategories);
    $statement2->execute();
    $categories = $statement2->fetchAll();
    $statement2->closeCursor();

?>


<!DOCTYPE html>
<html>
	<body>
			<h1>Add Product </h1>
			<form method="POST" action="addproductconfirm.php">

            <!--create the drop-down to display the categories available-->
			<h4>Category:</h4>
			<select name="category_id">
        		<?php foreach ($categories as $category) : 
            		if ($category['p_Category'] == $product['p_Category']) 
            		{
                		$selected = 'selected';
            		}

            		else 
            		{
                		$selected = '';
            		}
        		?>
                    <!--the value assigned to each category is their p_Category value from the database-->
            		<option value="<?php echo $category['p_Category']; ?>"<?php echo $selected ?>>
                		<?php echo htmlspecialchars($category['categoryName']); ?>
            		</option>
        		<?php endforeach; ?>
       		</select><br>

			<h4>Name:</h4>
			<input type="text" name="name"><br>
			<h4>Price:</h4>
			<input type="text" name="price"><br>
            <h4>Image filename:</h4>
            <input type="text" name="image"><br><br>
			<h4>Quantity:</h4>
			<input type="text" name="quantity"><br><br>
            <h4>Description:</h4>
            <textarea rows="10" cols="50" name="description"></textarea><br><br>
			<input id="button" type="submit" name="submit" value="Submit">
			</form>
		
        <?php include 'footer.php'; ?>
	</body>

</html>
