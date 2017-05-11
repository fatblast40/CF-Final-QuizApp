<?php
require_once('includes/start_session_admin.php');
?>



<!DOCTYPE html>
<html>
<head>
	<title>Edit Categories</title>
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
                <h1 class="heading_font">Edit Categories</h1>
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
				<!-- choose category -->
				<div class="col-xs-12 text-center margin-top">
					<div class="row">
						
							
				<!-- Table -->

				<div class="col-xs-10 col-xs-offset-1 col-sm-6 col-sm-offset-3 margin-top">
                        <table class="table-hover text-center" >
                            <thead>
                            	<tr id="first_row_table" class="white">
                                	<th colspan="5" class="text-center"><h3>Click on a Category to change it</h3></th>
                                	
                                </tr>
                                <tr id="white_background">
                                	<th class="text-center"><h3>Category</h3></th>
                                	<th class="text-center"><h3>Questions/<br>Quiz</h3></th>
                                	<th class="text-center"><h3>Tries</h3></th>
                                    <th class="text-center"><h3>Passed at</h3></th>
                                    <th class="text-center"><h3>Questions</h3></th>
                                </tr>
                            </thead>
                            <tbody>

                                 <?php 
                        include ('query/categories_query.php');
			                while ($row_all_categories = mysqli_fetch_array($res_all_categories)){

			                    $category = $row_all_categories['category'];
			                    $category_id=$row_all_categories['id'];
			                    $questions=$row_all_categories['amount_questions'];
			                    $tries=$row_all_categories['tries'];
			                    $passed_at = $row_all_categories['passed_at'];


                            echo '
								<a href="change_category.php?category_selected='.$category_id.'">
	                                <tr>
	                                    <td class="clickable-row" data-href="change_category.php?category_selected='.$category_id.'"><h4>'.$category.'</h4></td>
	                                    <td class="clickable-row" data-href="change_category.php?category_selected='.$category_id.'"><h4>'.$questions.'</h4></td>
	                                    <td class="clickable-row" data-href="change_category.php?category_selected='.$category_id.'"><h4>'.$tries.'</h4></td>
	                                    <td class="clickable-row" data-href="change_category.php?category_selected='.$category_id.'"><h4>'.($passed_at*100).'%</h4></td>
	                                    <td><h4><input class="btn btn-info btn-display_games" type="submit" data-href="questions_of_category.php?category_selected='.$category_id.'"  value="Questions"></h4></td>
	                                </tr>
                                </a>

                                ';      
                          
                        }
                        ?>
                                
                            </tbody>
                        </table>
                       

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
	 <script>
			jQuery(document).ready(function($) {
			    $(".clickable-row").click(function() {
			        window.location = $(this).data("href");
			    });

			    $(".btn-display_games").click(function() {
			        window.location = $(this).data("href");
			    });
			});



				 	
	 </script>
</body>
</html>
<?php ob_end_flush(); ?>