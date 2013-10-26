<div class="moduletable_ver3">
	<div class="gk_round_t">
		<div class="gk_round_tl"></div>
		<div class="gk_round_tr"></div>
	</div>

	<div class="gk_round_m">
		<div class="gk_round_ml">
			<h3><span><span class="first-word">Categories</span> Games  </span></h3>
			<div class="moduletable_content clearfix">
				<div class="gk_npro_short" style="width: 100%; float: left;">
					<div class="gk_npro_short_ulwrap" style="width: 100%;">
						<ul>
						<?php 
						$i = 0;
						foreach ($listMenu as $value) {
							$nameid = strtolower(str_replace(' ','-',$value['name']));
							echo '<li class="even"><h4>'.
							'<a href="'.SITE_URL.'/cat/'.$nameid.'-'.$value['id'].'-1.html" rel="dofollow" title="'.$value['name'].'">'.$value['name'].'</a>'.
							'</h4></li>';
							if ($i==$numCat) {
								echo '<li><div class="gk_npro_short_interface">'.
								'<span>More in: <a href="'.SITE_URL.'/cat.html" rel="dofollow">All categories</a></span>'.
								'</div></li>';
								break;
							}
							$i++;
						}
						?>		
						</ul>		
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="gk_round_b">
		<div class="gk_round_bl"></div>
		<div class="gk_round_br"></div>
	</div>
</div>

