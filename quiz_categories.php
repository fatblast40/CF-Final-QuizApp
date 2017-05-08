
<!doctype html>
<html lang="en">
<?php require_once 'includes/head_tag.php'?>
<?php require_once 'dbconnect.php'?>
<?php
$categoriesQuery = $con->prepare(<<<'SQL'
SELECT category, image FROM categories;
SQL
);
$categoriesQuery->execute();
$categoriesResult = $categoriesQuery->get_result();

?>
<body>
<div class="container">

    <?php
    $categories = [];
    while ($category = $categoriesResult->fetch_assoc()) {
        $categories = $category;
    }

    foreach ($categories as $key => $category):
    if ($key%4 == 0):
    ?>
    <div class="row">
        <?php
        endif;
        ?>
        <div class="col-xs-6 col-md-3">
            <div class="panel panel-primary">
                <div class="panel-heading text-center">
                    <h3 class="text-primary"><?php $category['category']?></h3>
                </div>

                <div class="panel-body text-center">
                    <img src="pictures/<?php  $category['image']?>">
                </div>
            </div>
        </div>
        <?php
        if ($key%4 == 1 || $key <= count($categories)):
        ?>
    </div>
    <?php
    endif;
    endforeach;
    ?>


</div>

</body>
</html>
