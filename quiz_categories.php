<?php
require_once('includes/start_session_user.php');

$categoriesQuery = $con->prepare(<<<'SQL'
SELECT id, category, image FROM categories;
SQL
);
$categoriesQuery->execute();
$categoriesResult = $categoriesQuery->get_result();
?>

<!DOCTYPE html>
<html>
<head>
    <title>Categories</title>
    <?php
require_once('includes/head_tag.php');
    ?>
</head>
<body>
<div id="wrap">
  <div id="main" class="container-fluid clear-top">
    <!-- header -->
    <header class="row shadow" id="header">
            <div class="col-xs-3">
                <a href="home_user.php">
                    <img alt="back_button" src="pictures/back_button.png" id="back_button"/>
                </a>
            </div>      
            <div class="col-xs-6 white text-center">
                <h1 class="heading_font">Menu</h1>
            </div>                      
        <?php
        echo'
            <div class="col-xs-3">
                <a href="logout.php?logout" class="pull-right">         
                    <img class="img-circle show_avatar border" src="'.$user_avatar.'" alt="avatar" id="avatar_img"><br>
                    Sign Out
                </a>
            </div>';
        ?>

    </header>

    <!-- main -->
    <div class="row">
        <main class="col-xs-12">
            <section class="row">
                <div class="col-xs-12 margin-top">
                <!-- add main content here -->
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
            </section>
        </main>
    </div>
<!-- end wrapper to put footer on the bottom of the page -->
  </div>
</div>
    <!-- footer -->
    <?php
require_once('includes/footer.php');
    ?>
     
</body>
</html>
<?php ob_end_flush(); ?>