<?php
require_once('includes/start_session_user.php');

$categoriesQuery = $con->prepare(<<<'SQL'
SELECT category, image, tries, count(quizzes.id) AS tried, categories.tries - count(quizzes.id) AS tries_left FROM categories
LEFT JOIN quizzes ON categories.id = quizzes.FK_categories
GROUP BY categories.id
;
SQL
);

$userId = $con->real_escape_string($_SESSION['user']);
$categoriesQuery->bind_param('i', $userId);
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
                <div class="col-xs-6 white text-center margin-top">
                    <h1 class="heading_font">Pick a Category</h1>
                </div>
                <?php
                echo '
            <div class="col-xs-3">
                <a href="logout.php?logout" class="pull-right">         
                    <img class="img-circle show_avatar border" src="' . $user_avatar . '" alt="avatar" id="avatar_img"><br>
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
                            <div class="row">

                            <!-- add main content here -->
                            <?php
                            $categories = [];
                            while ($category = $categoriesResult->fetch_assoc()) {
                                $category['tries_left'] = max(0, $category['tries_left']);
                                $categories[] = $category;
                            }

                            foreach ($categories as $key => $category):

                                ?>
                                <div class="col-xs-6 col-sm-4 col-md-3 col-xl-2">
                                    <?php if ($category['tries_left'] > 0): ?>
                                    <a href="quiz_play.php?category=<?php echo $category['category'] ?>"
                                       class="a_category">
                                        <?php endif;?>
                                        <div class="panel panel-primary" id="category_panel">
                                            <div class="text-left panel-heading" id="category_header">
                                                <div>
                                                    <h3>
                                                        <span class="tries-countdown pull-right label label-primary">
                                                            <?php echo $category['tries_left'] ?>
                                                        </span>
                                                    </h3>
                                                    <h3><?php echo $category['category'] ?></h3>

                                                </div>
                                            </div>

                                            <div class="panel-body">
                                                <img src="pictures/<?php echo $category['image'] ?>"
                                                     class="img-responsive">

                                            </div>
                                        </div>
                                        <?php if ($category['tries_left'] > 0): ?>

                                    </a>
                                    <?php endif;?>

                                </div>
                                <?php

                            endforeach;
                            ?>
                            </div>


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