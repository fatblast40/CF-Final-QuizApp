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
		$class = trim($_POST['class']);
		$class = strip_tags($class);
		$class = htmlspecialchars($class);

		$from = trim($_POST['from']);
		$from = strip_tags($from);
		$from = htmlspecialchars($from);
		$from = date('Y-m-d', strtotime($from));

		$to = trim($_POST['to']);
		$to = strip_tags($to);
		$to = htmlspecialchars($to);
		$to = date('Y-m-d', strtotime($to));

	  // prevent sql injections / clear user invalid inputs
	 	$error_class = 0;	
 
		   // check whether the class exists or not
		   $query_class= "SELECT name FROM classes WHERE name='$class'";
		   $result_class= mysqli_query($con, $query_class);
		   $count_class= mysqli_num_rows($result_class);
		   if($count_class!=0){
			    $error_class= 1;
			    $errTyp = "alert alert-info";
			    $errMSG = "Entered class is already available.";
			    $hidden="hidden";
		   }

		// if there's no error, continue to save in db
		if( $error_class== 0 ) {
			// echo "no error";
			$query_class= "INSERT INTO classes (name, start_date, end_date) VALUES('$class', '$from', '$to')";
			$res_class= mysqli_query($con, $query_class);

		if ($res_class) {
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
							<h3><label class="white">Class Name</label></h3>					
							<input type="text" name="class" id="class" class="form-control" required maxlength="13">
						</div>
					</div>
				</div>
				<div class="col-xs-12 col-sm-4 col-sm-offset-4">
					<div class="row">
						<div class="col-xs-12 col-sm-6 margin-top">
							<h4><label class="white">From</label></h4>					
								 <input required class="form-control text-center" type="text" name="from" id="from">
						</div>
						<div class="col-xs-12 col-sm-6 margin-top">
							<h4><label class="white">To</label></h4>	
								<input required class="form-control text-center" type="text" name="to" id="to">
						</div>
					</div>
				</div>
				

				<div class="col-xs-12 margin-top">
					<button type="submit" name="btn-submit" class="btn btn-primary">Add Class</button>
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
    $( function() {
      $( "#from" ).datepicker();
      $( "#to" ).datepicker();

    } );
  </script>
	 
</body>
</html>
<?php ob_end_flush(); ?>