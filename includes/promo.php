		<?php
require_once('query/promo_days_coming_up.php');
		?>


<div class="col-xs-12 promo margin-top shadow <?php echo $hide; ?>">
	<div class="row   background_bc1"  >
		
		<div class="co-xs-12 col-sm-7 color_bc3 " id="promo_text">
			<h3 class="brandfont">PROMOTION UPCOMING!</h3>
			<h5>Get a 20% discount for all rides departing on
			</h5>
			<ul class="list-inline"> 
			<?php 
				while($row_promo_day = mysqli_fetch_array($res_promo_day)){
					$promo_day = $row_promo_day['event'];
					echo '<li>'.$promo_day.'</li>';
				}
			?> 
			</ul>
		</div>
		<div class="hidden-xs col-sm-5 promo_subdiv" >
			<img src="pictures/promo.jpg" alt="promo" id="promo_image" class="img-rounded pull-right hidden-xs">
		</div>
	</div>
</div>