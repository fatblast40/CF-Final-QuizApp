<?php
require_once('includes/start_session_admin.php');
?>
<?php 
	$errTyp="";
	$errMSG="";
	// validation ADD category
	if(isset($_POST['btn-submit'])) {

		// prevent sql injections/ clear user invalid inputs
		$category = trim($_POST['category']);
		$category = strip_tags($category);
		$category = htmlspecialchars($category);

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
			    $categoryError = "Provided category is already available.";
		   }
		}
		// if there's no error, continue to save in db
		if( $error_category== 0 ) {
			// echo "no error";
			$query_category= "INSERT INTO categories(category) VALUES('$category')";
			$res_category= mysqli_query($con, $query_category);

		if ($res_category) {
				$errTyp = "alert alert-success";
				$errMSG = "Successfully entered! Category available in dropdown now.";
				// echo $errMSG;
				unset($category);
			} else {
				$errTyp = "alert alert-danger";
				$errMSG = "Something went wrong, try again later...";
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
			<form method="POST" class="col-xs-12 col-sm-4 col-sm-offset-4 text-center"> 
				<h3><label class="white">Category Name</label></h3>					
					<input type="text" name="category" id="category" class="form-control">		
				<br>
				<button type="submit" name="btn-submit" class="btn btn-primary">Add Category</button>

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