<div class="moduletable_ver3">
	<div class="gk_round_t">
		<div class="gk_round_tl"></div>
		<div class="gk_round_tr"></div>
	</div>

	<div class="gk_round_m">
		<div class="gk_round_ml">
			<h3><span><span class="first-word">Top</span> Members</span></h3>
			<div class="moduletable_content clearfix">
				<div class="gk_npro_short" style="width: 100%; float: left;">
					<div class="gk_npro_short_ulwrap" style="width: 100%;">
						<ul>
                                                    <?php
                                                    $i = 1;
                                                    foreach ($ranking as $val) {
                                                        echo '<li class="even">
                                                            <h4>
                                                                <div class="number2">
                                                                    <p><span>'.$i.'</span><a href="'.SITE_URL.'/u/'.$val['id'].'/'.$val['username'].'.html" title="'.$val['first_name'].' '.$val['last_name'].'" rel="dofollow">'.$val['first_name'].' '.$val['last_name'].'</a></p>
                                                                </div>
                                                                </h4>
                                                                </li>';					
                                                        $i++;
                                                    }
                                                    ?>
						</ul>
                                            <div class="gk_npro_short_interface">
				<span>More in: <a href="<?php echo SITE_URL?>/user/ranking.html" title="Top 100">Top 100</a></span>
			</div>
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

