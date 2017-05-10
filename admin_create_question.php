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

		$correct_answers = trim($_POST['correct_answers']);
		$correct_answers = strip_tags($correct_answers);
		$correct_answers = htmlspecialchars($correct_answers);
		$correct_answers = preg_replace( "/[\r\n]+/", "\n", $correct_answers);
		// creating an array with all the correct answers
		$correct_answers = preg_split("/(\r\n|\n|\r)/", $correct_answers);


		$wrong_answers = trim($_POST['wrong_answers']);
		$wrong_answers = strip_tags($wrong_answers);
		$wrong_answers = htmlspecialchars($wrong_answers);
		$wrong_answers = preg_replace( "/[\r\n]+/", "\n", $wrong_answers);
		// creating an array with all the wrong answers
		$wrong_answers = preg_split("/(\r\n|\n|\r)/", $wrong_answers);

		$display = trim($_POST['display']);
		$display = strip_tags($display);
		$display = htmlspecialchars($display);


  	
		// if there's no error, continue to save in db (with attr require in input fields I dont need the emtpy() validation in php)

		// question
		$query_question= "INSERT INTO questions(question, FK_categories, id_string, answers_displayed) VALUES('$question', $category, UUID(), $display)";
		$res_question= mysqli_query($con, $query_question);
		$question_id = mysqli_insert_id($con);


		foreach ($correct_answers as $correct_answer) {
			$query_answers= "INSERT INTO answers(answer, FK_question, correct, id_string) VALUES('$correct_answer', $question_id, 1, UUID())";
			$res_answers= mysqli_query($con, $query_answers);
		}

		foreach ($wrong_answers as $wrong_answer) {
			$query_answers= "INSERT INTO answers(answer, FK_question, correct, id_string) VALUES('$wrong_answer', $question_id, 0, UUID())";
			$res_answers= mysqli_query($con, $query_answers);
		}

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
			<div class="col-xs-12 text-center">
				<div class="row">
					<div class="col-xs-12 col-sm-4 col-sm-offset-2 text-center margin-top">
						<h4><label class="green">Correct Answers</label></h4>
						<p class="white">(separate answers with a line break)</p>			
						<textarea id="correct_answers" name="correct_answers" class="form-control" required></textarea>
					</div>
					<div class="col-xs-12 col-sm-4 text-center margin-top">
						<h4><label class="red">Wrong Answers</label></h4>
						<p class="white">(separate answers with a line break)</p>			
						<textarea id="wrong_answers" name="wrong_answers" class="form-control" required></textarea>
					</div>
				</div>
			</div>
			<div class="col-xs-12 col-sm-4 col-sm-offset-4 text-center margin-top">
				<h4><label class="white">Number of answers displayed in Quizz</label></h4>	
				<p class="white">(incl. only one right answer)</p>
				<input type="number" id="display" name="display" class="form-control" required min="2">
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
	<script>
		// autogrowing of textarea
$('textarea').on('paste input', autogrow);
// $('textarea').load(autogrow); doesnt work anyways


    function autogrow () {
    if ($(this).outerHeight() > this.scrollHeight){
        $(this).height(1)
    }
    while ($(this).outerHeight() < this.scrollHeight + parseFloat($(this).css("borderTopWidth")) + parseFloat($(this).css("borderBottomWidth"))){
        $(this).height($(this).height() + 1)
    }
};
	</script> 
</body>
</html>
<?php ob_end_flush(); ?>