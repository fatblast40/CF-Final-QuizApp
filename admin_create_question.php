<?php
require_once('includes/start_session_admin.php');
?>
<?php 
	$errTyp="";
	$errMSG="";
	$hidden="";
	// validation ADD category
	if(isset($_POST['btn-submit'])) {

		// prevent sql injections/ clear user invalid inputs
		// 
		$question = trim($_POST['question']);
		$question = strip_tags($question);
		$question = htmlspecialchars($question);

		$category = trim($_POST['category']);
		$category = strip_tags($category);
		$category = htmlspecialchars($category);

		$answer1 = trim($_POST['answer1']);
		$answer1 = strip_tags($answer1);
		$answer1 = htmlspecialchars($answer1);

		$answer2 = trim($_POST['answer2']);
		$answer2 = strip_tags($answer2);
		$answer2 = htmlspecialchars($answer2);

		$answer3 = trim($_POST['answer3']);
		$answer3 = strip_tags($answer3);
		$answer3 = htmlspecialchars($answer3);

		$answer4 = trim($_POST['answer4']);
		$answer4 = strip_tags($answer4);
		$answer4 = htmlspecialchars($answer4);

  	
		// if there's no error, continue to save in db (with attr require in input fields I dont need the emtpy() validation in php)

		$query_question= "INSERT INTO questions(question, FK_categories) VALUES('$question', $category)";
		$res_question= mysqli_query($con, $query_question);
		$question_id = mysqli_insert_id($con);


		$query_answers= "INSERT INTO answers(answer, FK_question, correct) VALUES('$answer1', $question_id, 1), ('$answer2', $question_id, 0), ('$answer3', $question_id, 0), ('$answer4', $question_id, 0)";
		$res_answers= mysqli_query($con, $query_answers);

		if ($res_question AND $res_answers) {
				$errTyp = "alert alert-success";
				$errMSG = "Successfully entered!";
				$hidden ="hidden";
				// echo $errMSG;
				unset($category);
			} else {
				$errTyp = "alert alert-danger";
				$errMSG = "Something went wrong, try again later...";
				$hidden ="hidden";
				// echo $errMSG;
			} 
		
	}
?>

<!DOCTYPE html>
<html>
<head>
	<title>Create Question</title>
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
                <h1 class="heading_font">Create Question</h1>
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

				<?php

				require 'includes/alert_box.php';
				?>
			<form method="POST" <?php echo $hidden; ?>>
			<div class="col-xs-12 col-sm-4 col-sm-offset-4 text-center"> 
				<h3><label class="white">Question</label></h3>					
					<input type="text" name="question" id="question" class="form-control" required maxlength="200">
			</div>
			<div class="col-xs-12 col-sm-4 col-sm-offset-4 text-center"> 
				<h3><label class="white">Category</label></h3>					
				<select class="form-control" id="category" name="category">
				          <?php
				             // select all available titles
				            $res_question=mysqli_query($con, "SELECT * FROM categories where id!=0 order by category ASC");
				            
				            
				              while($categoryRow=mysqli_fetch_array($res_question)){
				                $category = $categoryRow['category'];
				                $category_id = $categoryRow['id'];
				                echo "<option value='".$category_id."'>".$category."</option>";
				              }
				            ?>

				  </select>
			</div>
			<div class="col-xs-12 col-sm-8 col-sm-offset-2 text-center margin-top">
				<div class="row">
					<div class="col-xs-6">
						<h4><label class="green">Correct Answer</label></h4>			
						<input type="text" name="answer1" id="answer1" class="form-control" required>
					</div>
					<div class="col-xs-6">
						<h4><label class="red">Wrong Answer</label></h4>			
						<input type="text" name="answer2" id="answer2" class="form-control" required>
					</div>
					<div class="col-xs-6">
						<h4><label class="red">Wrong Answer</label></h4>			
						<input type="text" name="answer3" id="answer3" class="form-control" required>
					</div>
					<div class="col-xs-6">
						<h4><label class="red">Wrong Answer</label></h4>			
						<input type="text" name="answer4" id="answer4" class="form-control" required>
					</div>
				</div>
			</div>
			<div class="col-xs-12 text-center margin-top">
				<button type="submit" name="btn-submit" class="btn btn-primary">Add Question</button>
			</div>
			</form>
			




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