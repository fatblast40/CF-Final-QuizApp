<?php
require_once('includes/start_session_user.php');

$category_id=$_GET['category_id'];
$res_category_name = mysqli_query($con, "select category from categories where id=".$category_id);
$category=mysqli_fetch_array($res_category_name)['category'];
// $row_category_name  = mysqli_fetch_array($res_categories);
// $category=$row_categories['category'];
?>

<!DOCTYPE html>
<html>
<head>
    <title><?php echo $category; ?> Quizzes</title>
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
                <a href="my_quizzes.php">
                    <img alt="back_button" src="pictures/back_button.png" id="back_button"/>
                </a>
            </div>      
            <div class="col-xs-6 white text-center margin-top">
                <h1 class="heading_font"><?php echo $category; ?> Quizzes</h1>
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

                     <div class="col-xs-10 col-xs-offset-1 col-sm-6 col-sm-offset-3 margin-top">
                        <table class="table-hover text-center">
                            <thead>
                                <tr>
                                    <th class="text-center"><h3>Scores</h3></th>
                                    <th class="text-center"><h3>Date</h3></th>  
                                </tr>
                            </thead>
                            <tbody>

                                 <?php 
                        include_once('query/quizzes_per_category_query.php');
                        while ($row_category  = mysqli_fetch_array($res_categories)){
                            $category_id=$row_category['category_id'];
                            $score=$row_category['scores'];
                            $time_stamp=$row_category['time_stamp'];
                            echo '
                                <tr>
                                    <td><h4>'.number_format($score*100).'%</h4></td>
                                    <td><h4>'.$time_stamp.'</h4></td>
                                </tr>

                                ';      
                            
                        }
                        ?>
                                
                            </tbody>
                        </table>
                       

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