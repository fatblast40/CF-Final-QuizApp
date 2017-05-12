<?php
require_once('includes/start_session_user.php');

$latestScoreQuery = $con->prepare(<<<'SQL'
SELECT
    passed_at,
    scores, 
    end_timestamp - quizzes.start_timestamp AS duration, 
    category, 
    tries - count(quizzes.id) AS tries_left
FROM categories 
INNER JOIN quizzes ON categories.id = quizzes.FK_categories
WHERE quizzes.scores IS NOT NULL 
AND quizzes.end_timestamp IS NOT NULL 
AND category = ? AND FK_users = ?
GROUP BY categories.id
ORDER BY end_timestamp DESC
;
SQL
);

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
                    <h1 class="heading_font"><?php echo $_GET['category']?></h1>
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
                        <!-- <div class=""> -->
                            <!-- add main content here -->
                            <?php if (!isset($_GET['category'])):?>
                            <div class="text-center white margin-top">
                                <h1>No category was selected.</h1>
                            </div>
                            <?php else:
    $category = $con->real_escape_string($_GET['category']);
    $userId = $con->real_escape_string($_SESSION['user']);

    $latestScoreQuery->bind_param('si', $category, $userId);
    $latestScoreQuery->execute();
    $latestScoreResult = $latestScoreQuery->get_result();
    $latestScoreData = $latestScoreResult->fetch_assoc();
    $hasPassed = $latestScoreData['scores'] >= $latestScoreData['passed_at'];



                                ?>
                            <div class="text-center alert alert-info col-xs-8 col-xs-offset-2 margin-top">
                                <?php if($hasPassed): ?>
                                <h1>Congratulations you did pass,</h1>
                                <h1>you have</h1>
                                <br><br><br>
                                <?php else: ?>
                                    <h1>Sorry you didn't pass,</h1>
                                    <h1>you have</h1>
                                    <br><br><br>
                                <?php endif; ?>

                                <h1 class="<?php echo $hasPassed ? 'text-success' : 'text-danger'?>">
                                    <?php echo 100*$latestScoreData['scores'].'%'?>
                                </h1>
                            </div>
                            <?php endif;?>
                        
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