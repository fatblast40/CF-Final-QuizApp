<?php
require_once('includes/start_session_admin.php');
?>
<?php 

	if(isset($_GET['category_selected'])){

		$category_id=$_GET['category_selected'];
		$query_get_categories = "SELECT * FROM `categories` where categories.id=".$category_id;


		$res_get_categories = mysqli_query($con, $query_get_categories);
		$row_get_categories  = mysqli_fetch_array($res_get_categories);
		$category_old = $row_get_categories['category'];

	} else {
		header("Location: admin_all_questions.php");
	  	exit;

	}


 ?>

 <?php 

 	$errTyp="";
	$errMSG="";
	$hidden="";
 	if(isset($_GET['question_selected'])){

		$question_id=$_GET['question_selected'];


		// $query_answers = "delete FROM `answers` where answers.FK_question=".$question_id;
		// $res_delete_answers = mysqli_query($con, $query_answers);

		$query_delete_question = "delete FROM `questions` where questions.id=".$question_id;
		$res_delete_question = mysqli_query($con, $query_delete_question);
		if ($res_delete_question) {
				$errTyp = "alert alert-success";
				$errMSG = "Successfully deleted!";
				$hidden="hidden";
				// echo $errMSG;
				unset($category);
			} else {
				$errTyp = "alert alert-danger";
				$errMSG = "Something went wrong, try again later...";
				$hidden="hidden";
				// echo $errMSG;
			}

	} 


 ?>




<!DOCTYPE html>
<html>
<head>
	<title>Edit Questions</title>
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
				<a href="admin_all_questions.php">
					<img alt="back_button" src="pictures/back_button.png" id="back_button"/>
				</a>
			</div>		
			<div class="col-xs-6 white text-center margin-top">
                <h1 class="heading_font">Edit Questions</h1>
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
						
					<?php 

					require 'includes/alert_box.php';
					 ?>		
				<!-- Table -->

				<div class="col-xs-12 margin-top">
                        <table class="table-hover text-center" >
                            <thead>
                            	<tr id="first_row_table" class="white">
                                	<th colspan="5" class="text-center"><h3>Click on a Question to change it</h3></th>
                                	
                                </tr>
                                <tr id="white_background">
                                	<th class="text-center"><h3>Question</h3></th>
                                	<th class="text-center"><h3>Category</h3></th>
                                	<th class="text-center"><h3>Answers<br>displayed</h3></th>
                                    <th class="text-center"><h3>Answers</h3></th>
                                    <th class="text-center"><h3>Delete</h3></th>
                                </tr>
                            </thead>
                            <tbody>

                                 <?php 
                        include ('query/questions_query.php');
			                while ($row_all_questions = mysqli_fetch_array($res_all_questions)){

			                    $category = $row_all_questions['category'];
			                    $question_id=$row_all_questions['question_id'];
			                    $question=$row_all_questions['question'];
			                    $answers_displayed=$row_all_questions['answers_displayed'];
			                    


                            echo '
								<a href="change_question.php?question_selected='.$question_id.'">
	                                <tr>
	                                    <td class="clickable-row text-left padding-left" data-href="change_question.php?question_selected='.$question_id.'"><h4>'.$question.'</h4></td>
	                                    <td class="clickable-row" data-href="change_question.php?question_selected='.$question_id.'"><h4>'.$category.'</h4></td>
	                                    <td class="clickable-row" data-href="change_question.php?question_selected='.$question_id.'"><h4>'.$answers_displayed.'</h4></td>
	                                    
	                                    <td><h4><input class="btn btn-info btn-display_games" type="submit" data-href="answers_of_question.php?question_selected='.$question_id.'"  value="Answers"></h4></td>
	                                    <td><h4><input class="btn btn-danger btn-display_games" type="submit" data-href="questions_of_category.php?category_selected='.$category_id.'&question_selected='.$question_id.'"  value="Delete"></h4></td>
	                                </tr>
                                </a>

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
			jQuery(document).ready(function($) {
			    $(".clickable-row").click(function() {
			        window.location = $(this).data("href");
			    });

			    $(".btn-display_games").click(function() {
			        window.location = $(this).data("href");
			    });
			});



				 	
	 </script>
</body>
</html>
<?php ob_end_flush(); ?>