<?php include 'header.php';

    include 'categoryfunctions.php';

    //get id of product from categorypage.php
    $pID = $_GET['id'];

    //get table for selected product
    $queryProduct = "SELECT *
                     FROM product
                     WHERE abbrvName = '$pID'";
    $result = $db->prepare($queryProduct);
    $result->execute();
    $products = $result->fetchAll();
    $result->closeCursor();

?>
<html>
<!--Display details of the product with the specific id-->
<?php foreach ($products as $product) : ?>
    
    <div id="wrap">
    <!--Add picture-->
    <div id="picture">
        <p><img src="images/<?php echo $product['abbrvName'].'.png'; ?>"
            alt="images/<?php echo $product['abbrvName'].'.png'; ?>" class="img-responsive" style="width:100%"/></p>
    </div>

    <!--Add product details-->
    <div id="description">
        <!--Add product name-->
        <h1><?php echo htmlspecialchars($product['p_Name']); ?></h1>
        <h2>
            <!--Add product price-->
            <?php echo '$' . $product['p_Price']; ?></h2>

        <!--Creates form to add product to cart-->
        <form action="#" method="get" id="add_to_cart_form">
            <input type="hidden" name="action" value="add" />
            <!--The value name might need to be changed depending on cart code-->
            <input type="hidden" name="product_id" value="<?php echo $product['abbrvName']; ?>" />
            <b>Quantity:</b>&nbsp;
            <input type="text" name="quantity" value="1" size="3" />
            <input type="submit" class="cartButton" value="Add to Cart" />
        </form><br><br>
        <p>
        <!--Add product description.-->
        <?php echo $product['p_Description'] ?>
        <?php endforeach; ?></p>
    </div>
    </div>

</html>