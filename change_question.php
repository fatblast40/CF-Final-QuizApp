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
	$FK_categories_old = $row_get_questions['FK_categories'];
	$answers_displayed_old = $row_get_questions['answers_displayed'];

} else {
	header("Location: questions_of_category.php");
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
		$question = trim($_POST['question']);
		$question = strip_tags($question);
		$question = htmlspecialchars($question);

		$category = trim($_POST['category']);
		$category = strip_tags($category);
		$category = htmlspecialchars($category);

		
		$display = trim($_POST['display']);
		$display = strip_tags($display);
		$display = htmlspecialchars($display);


  	
		// if there's no error, continue to save in db (with attr require in input fields I dont need the emtpy() validation in php)

		// question
		$query_question= "UPDATE questions SET question='$question', FK_categories=$category, answers_displayed=$display WHERE questions.id=".$question_id;

		$res_question= mysqli_query($con, $query_question);
		$question_id = mysqli_insert_id($con);


		
		if ($res_question) {
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
	<title>Edit Question</title>
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
				<a href="questions_of_category.php?category_selected=<?php echo $FK_categories_old; ?>">
					<img alt="back_button" src="pictures/back_button.png" id="back_button"/>
				</a>
			</div>		
			<div class="col-xs-6 white text-center margin-top">
                <h1 class="heading_font">Edit Question</h1>
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
					<input type="text" name="question" id="question" class="form-control" required maxlength="200" value="<?php echo $question_old ; ?>">
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


				               		if ($category_id==$FK_categories_old) {

				                    	echo "<option value='".$category_id."' selected='selected
				                    	'>".$category."</option>";
				                    } else {

				                    	echo "<option value='".$category_id."'>".$category."</option>";
				                    }
				              }
				            ?>

				  </select>
			</div>

			<div class="col-xs-12 col-sm-4 col-sm-offset-4 text-center margin-top">
				<h4><label class="white">Number of answers displayed in Quizz</label></h4>	
				<p class="white">(incl. only one right answer)</p>
				<input type="number" id="display" name="display" class="form-control" required min="2" value="<?php echo $answers_displayed_old ; ?>">
			</div>
			
			<div class="col-xs-12 text-center margin-top">
				<button type="submit" name="btn-submit" class="btn btn-primary">Edit Question</button>
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