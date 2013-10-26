													<?php        		
       													foreach ($listTopGame as $key => $val){
       														$nameid = str_replace('_','-',$val['nameid']);
       												?>	
	       												<li id="<?php echo $val['id'];?>">
	
															<div>
																<a href="<?php echo $baseUrl.'/games/info/'.$nameid.'.html'?>" title="<?php echo $val['name'];?>">
																	<img src="<?php echo $val['source_image'];?>" alt="<?php echo $val['name'];?>" class="mod_topmemebrs_avatar">
																</a>
															</div>
																		
															<div>
																<?php 
																$name = '';
																$old_name = $val['name'];
																for ($index = 0; $index < strlen($old_name); $index++) {
																	$name.=$old_name[$index];
																	if ($index>12) {
																		$name.=' ...';
																		break;
																	}
																}
																?>
																<a href="<?php echo $baseUrl.'/games/info/'.$nameid.'.html'?>"><?php echo $name;?></a>
															</div>
	
															<div><small>Plays: <?php echo $val['playcount'];?></small></div>
															<div style="clear: left;"></div>
														</li>
       												<?php 
       													}
       												?>