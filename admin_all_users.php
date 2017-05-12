<?php
require_once('includes/start_session_admin.php');
?>
<?php 
	if(isset($_GET['class_id'])){
		$selected_class_id=$_GET['class_id'];
	} 
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
				<!-- pick a class -->
				<div class="col-xs-12 margin-top">
					<div class="row">
						<div class="col-xs-12 col-sm-2">

					<label class="white">Pick a Class</label>
					<select class="form-control" id="class" name="class">
				          	<option value='5'>TESTEST</option>"			  
					<?php 

						require_once('query/all_classes_query.php');
				                while ($row_classes  = mysqli_fetch_array($res_classes)){
				                    $class = $row_classes['name'];
				                    $class_id = $row_classes['id'];
				                    $from = $row_classes['from'];
				                    $from = strtotime($from);
				                    $from = date('Y-m-d',$from);
				                    $to = $row_classes['to'];
				                    $to = strtotime($to);
				                    $to = date('Y-m-d',$to);

				                    if(isset($_GET['class_id'])){

				                    	if ($class_id==$selected_class_id) {

					                    	echo "<option value='".$class_id."' selected='selected
					                    	'>".$class."</option>";
					                    } else {

					                    	echo "<option value='".$class_id."'>".$class."</option>";
					                    }

									} else {
					                    if ((date('Y-m-d') >= $from) AND (date('Y-m-d') <= $to)) {
					                    	$selected_class_id=$class_id;
					                    	echo "<option value='".$class_id."' selected='selected
					                    	'>".$class."</option>";
					                    } else {

					                    	echo "<option value='".$class_id."'>".$class."</option>";
					                    }
				                	}
				                }


					 ?>

					</select>

					
						</div>
					</div>
					<hr>
				</div>

				<!-- Table -->

				<div class="col-xs-12 margin-top">
				<div class="table-responsive">
                        <table class="table-hover text-center" id="all_users_table">
                            <thead>
                            	
                                <tr id="white_background">
                                	<th class="text-center"></th>
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
 							$avatar = $row_all_users['avatar'];


                            echo '
                                <tr>
                                	<td><img src="'.$avatar.'" class="img-circle all_users_img" alt="'.$first_name.' '.$family_name.'"></td>
                                    <td><h4>'.$first_name.'</h4></td>
                                    <td><h4>'.$family_name.'</h4></td>
                                    ';

                            require('query/categories_query.php');
			                while ($row_all_categories  = mysqli_fetch_array($res_all_categories)){

			                    $category1 = $row_all_categories['category'];
			                    $category_id=$row_all_categories['id'];
			                    $passed_at = $row_all_categories['passed_at'];



			                   require('query/score_per_cat_per_user.php');
			                   if ($count_scores_per_cat_per_user>0){
					                while ($row_scores_per_cat_per_user  = mysqli_fetch_array($res_scores_per_cat_per_user)){
					                    $score = $row_scores_per_cat_per_user['scores'];
					                    $category = $row_scores_per_cat_per_user['category'];

					                    if($score<0 || $score>100){
					                    	echo'
											<td class=""><h4>('.$score.')</h4></td>

						       				';
					                    } else {
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
				                } else {
				                	echo'
											<td class=""><h4></h4></td>

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
	<script>
	 	var selectClassDOM = $('select[name="class"]');
	 	selectClassDOM.change(function(){
	 		var selectedClass = selectClassDOM.val()
	 		location.href="admin_all_users.php?class_id="+selectedClass;
	 	});

	</script>
</body>
</html>
<?php ob_end_flush(); ?>