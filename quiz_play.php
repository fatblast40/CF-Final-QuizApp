<?php
require_once('includes/start_session_user.php');

$categoriesQuery = $con->prepare(<<<'SQL'
SELECT category, image, tries, count(qui.id) AS tried, categories.tries - count(qui.id) AS tries_left FROM categories
LEFT JOIN (SELECT * FROM quizzes WHERE FK_users = ?) as qui ON qui.FK_categories = categories.id
WHERE category = ?
GROUP BY categories.id
;
SQL
);
$categoriesQuery->bind_param('is', $_SESSION['user'], $_GET['category']);
$categoriesQuery->execute();
$categoriesResult = $categoriesQuery->get_result();
$categoryData = $categoriesResult->fetch_assoc();

if ((int)$categoryData['tries_left'] <= 0) {
    header('Location: quiz_categories.php');
    exit();
}
?>

    <!DOCTYPE html>
    <html>
    <head>
        <title><?php echo $_GET['category']?></title>
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
                    <a href="#" id="back_link">
                        <img alt="back_button" src="pictures/back_button.png" id="back_button"/>
                    </a>
                </div>
                <div class="col-xs-6 white text-center margin-top">
                    <h1 class="heading_font"><?php echo $_GET['category']?></h1>
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

            <div class="row">
        <div class="col-xs-12" id="quiz-prompt"></div>
    </div>

    <div class="row">
        <div class="col-xs-12" id="message-box"></div>
    </div>
</div>


<script src="scripts/quiz.js" type="application/javascript"></script>
<!-- end wrapper to put footer on the bottom of the page -->
</div>
<!-- footer -->
<?php
require_once('includes/footer.php');
?>

</body>
</html>
<?php ob_end_flush(); ?>