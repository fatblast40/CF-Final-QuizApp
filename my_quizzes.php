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
            <div class="col-xs-6 white text-center margin-top">
                <h1 class="heading_font">My Quizzes</h1>
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
                    
            
                   <!--  <form class="col-xs-6" action="quizzes_per_category.php?category_id='.$category_id.'">
                        <div class="wrapper text-center">
                            <h2>'.$category.'</h2>
                            <h4>Games Played: '.$games_played.'</h4>
                            <h4>Average Score: '.$average_score.'</h4>
                        </div>
                    </form>  -->   
                <?php 
                require_once('query/my_quizzes_categories.php');
                while ($row_categories  = mysqli_fetch_array($res_categories)){
                    $category = $row_categories['category'];
                    $category_id=$row_categories['category_id'];
                    $average_score=$row_categories['average_score'];
                    $games_played=$row_categories['games_played'];
                    echo '
                        
                    
                
                    <a class="col-xs-6 col-sm-3 margin-top a_category" href="quizzes_per_category.php?category_id='.$category_id.'">
                        <div class="panel panel-primary" id="category_panel" >
                            <div class="text-center panel-heading" id="category_header">
                                <h3>'.$category.'</h3>
                            </div>

                            <div class="panel-body text-center">
                                <h4><b>Games Played </b><br><br>'.$games_played.'</h4>
                                <h4><b>Average Score </b><br><br>'.number_format($average_score*100).'%</h4>
                            </div>
                        </div>
                    </a>
                    ';
                }
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