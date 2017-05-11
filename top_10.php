<?php
require_once('includes/start_session_user.php');
?>
<?php 
	$errTyp="";
	$errMSG="";
	$hidden="";
	$highlight="";
	$passed="";


	if(isset($_GET['selected_category_id'])){



		$selected_category_id = $_GET['selected_category_id'];

		$query_category_name = "
		    SELECT category, t1.scores 
		    FROM quizzes AS t1
		    LEFT JOIN categories ON categories.id=t1.FK_categories
		    JOIN users ON users.id = t1.FK_users
		    LEFT JOIN quizzes AS t2
		      ON t1.FK_users = t2.FK_users 
		            AND t1.start_timestamp < t2.start_timestamp
		    WHERE t2.FK_users IS NULL 
		    and t1.fk_categories LIKE '".$selected_category_id."' and t1.FK_users=".$user_id
		    ;

		$res_category_name = mysqli_query($con, $query_category_name);
		$row_category_name  = mysqli_fetch_array($res_category_name);
		$category_name_selected = $row_category_name['category'];
		$scores_selected = $row_category_name['scores'];
		// $count_category_name = mysqli_num_rows($res_category_name);


	} else {
		// $selected_category_id = '%';
		$selected_category_id = '-1';
		$category_name_selected = "Pick a category from above";
		$scores_selected ="";
	}

?>

<!DOCTYPE html>
<html>
<head>
	<title>Top 10</title>
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
                <h1 class="heading_font">Top 10</h1>
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
				<!-- add main content here -->
				<!-- choose category -->
				<div class="col-xs-12 text-center margin-top">
					<div class="row">
						
							<!-- <a href="top_10.php" class="">
								<div class="col-xs-6 col-sm-3 col-md-2">
									<div class="wrapper2 text-center">
	 									<h3>All</h3>
	 								</div>
								</div>
							</a> -->
							<?php
								require_once('query/my_quizzes_categories.php');
				                while ($row_categories  = mysqli_fetch_array($res_categories)){
				                    $category = $row_categories['category'];
				                    $category_id=$row_categories['category_id'];
				                    if ($selected_category_id==$category_id){
				                    	$highlight="highlight";
				                    } else {
				                    	$highlight="";
				                    }
				                    
				                    echo '

							<a href="top_10.php?selected_category_id='.$category_id.'" class="">
	 							<div class="col-xs-6 col-sm-3 col-md-2">
									<div class="wrapper2 text-center" id="'.$highlight.'">
	 									<h3>'.$category.'</h3>
	 								</div>
								</div>
		 					</a>
				                    ';
				                }

			                ?>
							<div class="col-xs-12">
								<hr>
							</div>
	                </div>
				</div>

				<!-- Table -->

				<div class="col-xs-10 col-xs-offset-1 col-sm-6 col-sm-offset-3 margin-top">
                        <table class="table-hover text-center" >
                            <thead  id="white_background">
                                <tr id="first_row_table" class="white">
                                	<th colspan="4" class="text-center"><h2><?php echo $category_name_selected;  ?></h2></th>
                                </tr>
                                <?php

                                	if(isset($_GET['selected_category_id'])){
                                	echo'
                                <tr id="first_row_table" class="white">
                                	<th colspan="4" class="text-center"><h3>Your Score: '.($scores_selected*100).'%</h3></th>
                                </tr>
                                	';
                                	}
                                 ?>
                                <tr>
                                	<th class="text-center"><h3>Rank</h3></th>
                                	<th class="text-center"><h3>User</h3></th>
                                    <th class="text-center"><h3>Score</h3></th>
                                    <th class="text-center"><h3>Date</h3></th>  
                                </tr>
                            </thead>
                            <tbody>

                                 <?php 
                        include_once('query/ranking_query.php');
                        $rank=1;
                        while (($row_ranking  = mysqli_fetch_array($res_ranking)) AND ($rank <11)){
                        	
 							$name = $row_ranking['nickname'];
 							$first_name = $row_ranking['first_name'];
 							$family_name = $row_ranking['family_name'];
                            $score=$row_ranking['scores'];
                            $time_stamp=$row_ranking['start_timestamp'];
                            $passed_at=$row_ranking['passed_at'];
                            // $ranking = $row_ranking['rank'];

                            if ($score>=$passed_at){
                            	// passed
                            	$passed="green_background";
                            } else {
                            	$passed="red_background";
                            }

                            echo '
                                <tr>
                                    <td  class="'.$passed.'"><h4>'.$rank.'</h4></td>
                                    <td><h4>'.$first_name.' '.$family_name.'</h4></td>
                                    <td><h4>'.number_format($score*100).'%</h4></td>
                                    <td><h4>'.$time_stamp.'</h4></td>
                                </tr>

                                ';      
                         $rank++;   
                        }
                        ?>
                                
                            </tbody>
                        </table>
                       

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