<div class="moduletable_ver3">
	<div class="gk_round_t">
		<div class="gk_round_tl"></div>
		<div class="gk_round_tr"></div>
	</div>

	<div class="gk_round_m">
		<div class="gk_round_ml">
			<h3><span><span class="first-word">Categories</span> Games  </span></h3>
			<div class="moduletable_content clearfix">
				<?php 
				foreach ($listMenu as $value) {
					$nameid = str_replace(' ','-',$value['name']);
					echo '<p id="categories" class="active"><a href="'.$baseUrl.'/cat/'.$nameid.'-'.$value['id'].'-1.html" title="'.$value['name'].'" rel="dofollow">'.$value['name'].'</a></p>';
				}
				?>
				
			</div>
		</div>
	</div>
	<div class="gk_round_b">
		<div class="gk_round_bl"></div>
		<div class="gk_round_br"></div>
	</div>
</div>

