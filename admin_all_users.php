<?php
require_once('includes/start_session_admin.php');
?>


<!DOCTYPE html>
<html>
<head>
	<title>All Users</title>
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
				<a href="home_admin.php">
					<img alt="back_button" src="pictures/back_button.png" id="back_button"/>
				</a>
			</div>		
			<div class="col-xs-6 white text-center margin-top">
                <h1 class="heading_font">All Users</h1>
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
						
						
						
							<div class="col-xs-12">
								<hr>
							</div>
	                </div>
				</div>

				<!-- Table -->

				<div class="col-xs-12 margin-top">
				<div class="table-responsive">
                        <table class="table-hover text-center" id="all_users_table">
                            <thead>
                            	
                                <tr id="white_background">
                                	<th class="text-center"><h5>First<br>Name</h5></th>
                                	<th class="text-center"><h5>Family<br>Name</h5></th>
                                    <!-- <th class="text-center"><h5>E-Mail</h5></th> -->
                                    <?php
										require('query/my_quizzes_categories.php');
						                while ($row_categories  = mysqli_fetch_array($res_categories)){
						                    $category = $row_categories['category'];
						                    $category_id=$row_categories['category_id'];     
						                    echo '

									<th class="text-center"><h5>'.$category.'</h5></th>
						                    ';
						                }

					                ?> 
                                </tr>
                            </thead>
                            <tbody>

                                 <?php 
                        include_once('query/all_users_query.php');
                        while ($row_all_users  = mysqli_fetch_array($res_all_users)){
                        	$all_users_id = $row_all_users['id'];
 							$first_name = $row_all_users['first_name'];
 							$family_name = $row_all_users['family_name'];
 							$email = $row_all_users['email'];


                            echo '
                                <tr>
                                    <td><h4>'.$first_name.'</h4></td>
                                    <td><h4>'.$family_name.'</h4></td>
                                    ';

                            require('query/categories_query.php');
			                while ($row_all_categories  = mysqli_fetch_array($res_all_categories)){

			                    $category = $row_all_categories['category'];
			                    $category_id=$row_all_categories['id'];
			                    $passed_at = $row_all_categories['passed_at'];

			                    

			                   require('query/score_per_cat_per_user.php');
				                while ($row_scores_per_cat_per_user  = mysqli_fetch_array($res_scores_per_cat_per_user)){
				                    $score = $row_scores_per_cat_per_user['scores'];
				       				if ($score>=$passed_at){
				       					// passed
				       					$passed="green_background";
				       				} else {
				       					$passed="red_background";
				       				}
					       				echo'
										<td class="'.$passed.'"><h4>'.($score*100).'%</h4></td>

					       				';
				       				
				                   
				                		
				                }

						    }


                            echo '        
                                    
                                </tr>

                                ';         
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