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
			<div class="col-xs-3">
				<a href="home_user.php">
					<img alt="back_button" src="pictures/back_button.png" id="back_button"/>
				</a>
			</div>		
			<div class="col-xs-6 white text-center">
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


				<div class="col-xs-12">
					<p>hello</p>
					<img class="img-circle show_avatar border" src="pictures/avatar1.jpg" alt="avatar" id="avatar_img">

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