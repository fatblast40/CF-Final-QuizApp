<?php
require_once('includes/start_session_admin.php');
?>
<?php 

if(isset($_GET['answer_selected'])){

	$answer_id=$_GET['answer_selected'];
	$query_get_answers = "SELECT * FROM `answers` where answers.id=".$answer_id;


	$res_get_answers = mysqli_query($con, $query_get_answers);
	$row_get_answers  = mysqli_fetch_array($res_get_answers);
	$answer_old = $row_get_answers['answer'];
	$correct_old = $row_get_answers['correct'];
	$question_id = $row_get_answers['FK_question'];

	if ($correct_old==1){
		$correct ="checked";
		$incorrect="";
	} else {
		$correct ="";
		$incorrect="checked";
	}

} else {
	header("Location: answers_of_question.php");
  	exit;

}


 ?>
<?php 
	$errTyp="";
	$errMSG="";
	$hidden="";
	// validation ADD category
	if(isset($_POST['btn-submit'])) {

		// prevent sql injections/ clear user invalid inputs
		// 
		$answer = trim($_POST['answer']);
		$answer = strip_tags($answer);
		$answer = htmlspecialchars($answer);

		$correct = trim($_POST['correct']);
		$correct = strip_tags($correct);
		$correct = htmlspecialchars($correct);

		


  	
		// if there's no error, continue to save in db (with attr require in input fields I dont need the emtpy() validation in php)

		// answer
		$query_answers= "UPDATE answers SET answer='$answer', correct=$correct WHERE answers.id=".$answer_id;

		$res_answers= mysqli_query($con, $query_answers);


		
		if ($res_answers) {
				$errTyp = "alert alert-success";
				$errMSG = "Successfully edited!";
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
				<a href="answers_of_question.php?question_selected=<?php echo $question_id; ?>">
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

				<?php

				require 'includes/alert_box.php';
				?>
			<form method="POST" <?php echo $hidden; ?>>
				<div class="col-xs-12 col-sm-4 col-sm-offset-4 text-center"> 
					<h3><label class="white">Answer</label></h3>					
						<input type="text" name="answer" id="answer" class="form-control" required maxlength="200" value="<?php echo $answer_old ; ?>">
				</div>
				<div class="col-xs-12 col-sm-4 col-sm-offset-4 text-center white"> 
					<h3><label class="white">Correct or Incorrect</label></h3>					
					<label class="radio-inline"><input type="radio" name="correct" value="1" <?php echo $correct;?>>Correct</label>
					<label class="radio-inline"><input type="radio" name="correct" value="0" <?php echo $incorrect;?> >Incorrect</label>
				</div>

				
				
				<div class="col-xs-12 text-center margin-top">
					<button type="submit" name="btn-submit" class="btn btn-primary">Edit Answer</button>
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