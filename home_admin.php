<?php
require_once('includes/start_session_admin.php');
?>


<!DOCTYPE html>
<html>
<head>
	<title>Admin Menu</title>
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
				<h1 class="heading_font">Admin Menu</h1>
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
				
				<div class="col-xs-12  col-sm-8 col-sm-offset-2 margin-top">
					<div class="row">
					<!-- create category -->
						<a href="admin_create_category.php">
							<div class="col-xs-6">
								<div class="wrapper text-center">
									<h2>Create Category</h2>
								</div>
							</div>
						</a>
						<!-- create question -->
						<a href="admin_create_question.php">
							<div class="col-xs-6">
								<div class="wrapper text-center">
									<h2>Create Question</h2>
								</div>
							</div>
						</a>
						<!-- create class -->
						<a href="admin_create_class.php">
							<div class="col-xs-6">
								<div class="wrapper text-center">
									<h2>Create Class</h2>
								</div>
							</div>
						</a>
						<!-- all users -->
						<a href="admin_all_users.php">
							<div class="col-xs-6">
								<div class="wrapper text-center">
									<h2>All Users</h2>
								</div>
							</div>
						</a>
						<!-- Ranking -->
						<a href="admin_ranking.php">
							<div class="col-xs-6">
								<div class="wrapper text-center">
									<h2>Ranking</h2>
								</div>
							</div>
						</a>
						<!-- All Questions -->
						<a href="admin_all_questions.php">
							<div class="col-xs-6">
								<div class="wrapper text-center">
									<h2>Make Changes</h2>
								</div>
							</div>
						</a>
						<!-- User View -->
						<a href="home_user.php">
							<div class="col-xs-6">
								<div class="wrapper text-center">
									<h2>User View</h2>
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