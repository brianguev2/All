<?php include 'header.php'; 

    //connect to database
    include 'databaseConnect.php';
    global $db;

    //sets default if no set category_id
    $category_id = filter_input(INPUT_GET, 'category_id', FILTER_VALIDATE_INT);
    if ($category_id == NULL || $category_id == FALSE) 
    {
        $category_id = 1;
    }

    //get name for selected category
    $queryCategory = 'SELECT * FROM category
                          WHERE p_Category = :category_id';
    $statement1 = $db->prepare($queryCategory);
    $statement1->bindValue(':category_id', $category_id);
    $statement1->execute();
    $category = $statement1->fetch();
    $category_name = $category['categoryName'];
    $statement1->closeCursor();

    //get products for selected category
    $queryProducts = 'SELECT * FROM product
                  WHERE p_Category = :category_id
                  ORDER BY p_ID';
 
    $statement3 = $db->prepare($queryProducts);
    $statement3->bindValue(':category_id', $category_id);
    $statement3->execute();
    $products = $statement3->fetchAll();
    $statement3->closeCursor();


    //get all categories and print a list of categories
    $queryAllCategories = 'SELECT * FROM category
                           ORDER BY p_Category';

    $statement2 = $db->prepare($queryAllCategories);
    $statement2->execute();
    $categories = $statement2->fetchAll();
    $statement2->closeCursor();
 
?>
<main>
    <h1 class="top">Product Manager</h1>
    <p>To edit a product, select the product name.</p>
    <p>To add a product, select the "Add Product" link below.</p>
    <?php if (count($products) == 0) : ?>
        <p>There are no products for this category.</p>
    <?php else : ?>
        <h1>
        <!--When the user selects a category from the drop-down it should
        change to show the products that are available for that category.
        Work in progress.-->
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
                    <option value="<?php echo $category['p_Category']; ?>"<?php echo $selected ?>>
                        <?php echo htmlspecialchars($category['categoryName']); ?>
                    </option>
                <?php endforeach; ?>
            </select><br><br>
        </h1>

            <!--When the user selects a product it should take them to a page
            that allows them to edit product details.
            Work in progress.-->
            <?php foreach ($products as $product) : ?>
            <p>
                <a href="product_edit.php?id=<?php echo $product['abbrvName']; ?>">
                    <?php echo htmlspecialchars($product['p_Name']); ?>
                </a>
            </p>
            <?php endforeach; ?>
    <?php endif; ?>

    <!--Adds links for other functionality.-->
    <h1>Links</h1>
    <p><a href="addproduct.php">Add Product</a></p>
    <p><a href="addcategory.php">Add Category</a></p>

    <?php include 'footer.php'; ?>

</main>