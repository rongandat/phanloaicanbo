<div class="moduletable_ver3">
	<div class="gk_round_t">
		<div class="gk_round_tl"></div>
		<div class="gk_round_tr"></div>
	</div>

	<div class="gk_round_m">
		<div class="gk_round_ml">
			<h3><span><span class="first-word">Top</span> Games  </span></h3>
			<div class="moduletable_content clearfix">
				<?php 
				foreach ($listTopGame as $val) {
					$nameid = strtolower(str_replace('_','-',$val['nameid']));
					echo '<p class="polllevel">'.
					'<a href="'.SITE_URL.'/games/info/'.$nameid.'.html" rel="dofollow" title="'.$val['name'].'"><label>'.$val['name'].'</label></a>'.
					'</p>';
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

