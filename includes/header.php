

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

		    	</div>
	    	</div>
		</div>
</header>
