<?php
require_once('includes/start_session_user.php');
?>

<?php

?>
<!DOCTYPE html>
<html>
<head>
	<title>Menu</title>
	<?php
require_once('includes/head_tag.php');
	?>
</head>
<body>
<div id="wrap">
  <div id="main" class="container-fluid clear-top">
	<!-- header -->
	<header class="row shadow" id="header">
			<!-- <div class="col-xs-3">
				<a href="home_user.php">
					<img alt="back_button" src="pictures/back_button.png" id="back_button"/>
				</a>
			</div>	 -->	
			<div class="col-xs-6 col-xs-offset-3 white text-center">
				<h1 class="heading_font">Menu</h1>
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
				<div class="col-xs-12" id="play_line">
					<hr>
				</div>
				<a href="quiz_categories.php" id="play">
					<div class="col-xs-8 col-xs-offset-2 text-center margin-top left_round_side" id="play_button">
						<h1 >PLAY!</h1>		
					</div>
				</a>
				<div class="col-xs-12  col-sm-8 col-sm-offset-2">
					<div class="row">
					<!-- my quizzes -->
						<a href="my_quizzes.php">
							<div class="col-xs-6">
								<div class="wrapper text-center">
									<h2>My Quizzes</h2>
								</div>
							</div>
						</a>
						<!-- Statistics -->
						<a href="my_statistics.php">
							<div class="col-xs-6">
								<div class="wrapper text-center">
									<h2>My Statistics</h2>
								</div>
							</div>
						</a>
						<!-- Top 10 -->
						<a href="top_10.php">
							<div class="col-xs-6">
								<div class="wrapper text-center">
									<h2>Top 10</h2>
								</div>
							</div>
						</a>
						<!-- Change personal data -->
						<a href="change_personal_data.php">
							<div class="col-xs-6">
								<div class="wrapper text-center">
									<h2>Change Personal Data</h2>
								</div>
							</div>
						</a>
					</div>
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
	 
</body>
</html>
<?php ob_end_flush(); ?>