
<!doctype html>
<html lang="en">
<?php require_once 'includes/head_tag.php'?>
<?php require_once 'dbconnect.php'?>
<?php
$categoriesQuery = $con->prepare(<<<'SQL'
SELECT id, category, image FROM categories;
SQL
);
$categoriesQuery->execute();
$categoriesResult = $categoriesQuery->get_result();

?>
<body>
<div class="container">

    <?php
    $categories = [[
            'id' => 0,
            'category' => 'mixed',
            'image' => 'mixed_category.png'
    ]];
    while ($category = $categoriesResult->fetch_assoc()) {
        $categories[] = $category;
    }

    foreach ($categories as $key => $category):
    if ($key%4 == 0):
    ?>
    <div class="row">
        <?php
        endif;
        ?>
        <div class="col-xs-6 col-md-3">
            <a href="quiz_play.php?category=<?php echo $category['id']?>">
            <div class="panel panel-primary">
                <div class="panel-heading text-center">
                    <h3><?php echo $category['category']?></h3>
                </div>

                <div class="panel-body text-center">
                    <img src="pictures/<?php echo $category['image']?>" class="img-responsive">
                </div>
            </div>
            </a>
        </div>
        <?php
        if ($key%4 == 3 || $key >= count($categories)):
        ?>
    </div>
    <?php
    endif;
    endforeach;
    ?>


</div>

</body>
</html>
