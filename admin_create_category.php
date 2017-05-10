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
		$category = trim($_POST['category']);
		$category = strip_tags($category);
		$category = htmlspecialchars($category);

		$tries = trim($_POST['tries']);
		$tries = strip_tags($tries);
		$tries = htmlspecialchars($tries);

		$number_questions = trim($_POST['number_questions']);
		$number_questions = strip_tags($number_questions);
		$number_questions = htmlspecialchars($number_questions);

		$passed = trim($_POST['passed']);
		$passed = strip_tags($passed);
		$passed = htmlspecialchars($passed);
		$passed = $passed/100;

	  // prevent sql injections / clear user invalid inputs
	 	$error_category = 0;	
	  	if(empty($category)){
		   $error_category = 1;
		   $categoryError = "Please enter a category.";
		   $errMSG = "Please enter a category.";
	  	} else {
		   // check whether the genre exist or not
		   $query_category= "SELECT category FROM categories WHERE category='$category'";
		   $result_category= mysqli_query($con, $query_category);
		   $count_category= mysqli_num_rows($result_category);
		   if($count_category!=0){
			    $error_category= 1;
			    $errTyp = "alert alert-info";
			    $errMSG = "Provided category is already available.";
			    $hidden="hidden";
		   }
		}


		// if there's no error, continue to save in db
		if( $error_category== 0 ) {
			// echo "no error";
			$query_category= "INSERT INTO categories(category, amount_questions, tries, passed_at) VALUES('$category', $number_questions, $tries, $passed)";
			$res_category= mysqli_query($con, $query_category);

		if ($res_category) {
				$errTyp = "alert alert-success";
				$errMSG = "Successfully entered!";
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
	}
?>

<!DOCTYPE html>
<html>
<head>
	<title>Create Category</title>
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
                <h1 class="heading_font">Create Category</h1>
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
			<form method="POST" class="text-center" <?php echo $hidden; ?>>
				<div class="col-xs-12">
					<div class="row">
						<div class="col-xs-12 col-sm-4 col-sm-offset-4">
							<h3><label class="white">Category Name</label></h3>					
							<input type="text" name="category" id="category" class="form-control" required>
						</div>
					</div>
				</div>
				<div class="col-xs-12 col-sm-4 margin-top">
					<h4><label class="white">Number of Tries</label></h4>					
						<input type="number" name="tries" id="tries" class="form-control" required>
				</div>
				<div class="col-xs-12 col-sm-4 margin-top">
					<h4><label class="white">Questions/Quizz</label></h4>	
						<input type="number" name="number_questions" id="number_questions" class="form-control" required>
				</div>
				<div class="col-xs-12 col-sm-4 margin-top">
					<h4><label class="white">Passed at x%</label></h4>	
						<input type="number" name="passed" id="passed" class="form-control" required placeholder="Please enter a full number" max="100">
				</div>

				<div class="col-xs-12 margin-top">
					<button type="submit" name="btn-submit" class="btn btn-primary">Add Category</button>
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