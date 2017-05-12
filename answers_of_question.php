<?php
require_once('includes/start_session_admin.php');
?>
<?php 

	if(isset($_GET['question_selected'])){

		$question_id=$_GET['question_selected'];
		$query_get_questions = "SELECT * FROM `questions` where questions.id=".$question_id;


		$res_get_questions = mysqli_query($con, $query_get_questions);
		$row_get_questions  = mysqli_fetch_array($res_get_questions);
		$question_old = $row_get_questions['question'];
		$category_id = $row_get_questions['FK_categories'];

	} else {
		header("Location: questions_of_category.php");
	  	exit;

	}


 ?>

 <?php 

 	$errTyp="";
	$errMSG="";
	$hidden="";
 	if(isset($_GET['answer_selected'])){

		$answer_id=$_GET['answer_selected'];


		// $query_answers = "delete FROM `answers` where answers.FK_question=".$question_id;
		// $res_delete_answers = mysqli_query($con, $query_answers);

		$query_delete_answer = "delete FROM `answers` where answers.id=".$answer_id;
		$res_delete_answer = mysqli_query($con, $query_delete_answer);
		if ($res_delete_answer) {
				$errTyp = "alert alert-success";
				$errMSG = "Successfully deleted!";
				$hidden="hidden";
				// echo $errMSG;
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
	<title>Edit Answer</title>
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
				<a href="questions_of_category.php?category_selected=<?php echo $category_id; ?>">
					<img alt="back_button" src="pictures/back_button.png" id="back_button"/>
				</a>
			</div>		
			<div class="col-xs-6 white text-center margin-top">
                <h1 class="heading_font">Edit Answer</h1>
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

				<div class="col-xs-12">
                        <table class="table-hover text-center" >
                            <thead>

                            	<tr id="first_row_table" class="white">
                                	<th colspan="5" class="text-center"><h3>Click on an answer to change it or <input class="btn btn-success btn-display_games" type="submit" data-href="add_answer.php?question_selected=<?php echo $question_id;?>"  value="add a new answer here"></h3></th>
                                	
                                </tr>
                            	<tr id="first_row_table" class="white">
                                	<th colspan="5" class="text-center"><h3><?php echo $question_old;?></h3></th>
                                	
                                </tr>
                            	
                                <tr id="white_background">
                                	<th class="text-center"><h3>Answer</h3></th>
                                	<th class="text-center"><h3>Correct</h3></th>
                                    <th class="text-center"><h3>Delete</h3></th>
                                </tr>
                            </thead>
                            <tbody>

                                 <?php 
                        include ('query/answers_query.php');
			                while ($row_all_answers = mysqli_fetch_array($res_all_answers)){

			                    $answer_id=$row_all_answers['id'];
			                    $answer=$row_all_answers['answer'];
			                    $correct=$row_all_answers['correct'];

			                    if ($correct==1) {
			                    	$correct="Correct";
			                    } else {
			                    	$correct="Incorrect";
			                    }
			                    


                            echo '
								<a href="change_answer.php?answer_selected='.$answer_id.'">
	                                <tr>
	                                    <td class="clickable-row text-left padding-left" data-href="change_answer.php?answer_selected='.$answer_id.'"><h4>'.$answer.'</h4></td>
	                                    <td class="clickable-row" data-href="change_answer.php?answer_selected='.$answer_id.'"><h4>'.$correct.'</h4></td>
	                                    
	                                    <td><h4><input class="btn btn-danger btn-display_games" type="submit" data-href="answers_of_question.php?question_selected='.$question_id.'&answer_selected='.$answer_id.'"  value="Delete"></h4></td>
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