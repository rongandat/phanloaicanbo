							<div class="moduletable">
								<div class="gk_round_t">
									<div class="gk_round_tl"></div>
									<div class="gk_round_tr"></div>
								</div>
				
								<div class="gk_round_m">
									<div class="gk_round_ml">
										<div class="moduletable_content clearfix">
											<div class="gk_tab gk_tab-style1 clearfix-tabs" id="tabmix1">
												<div class="gk_tab_wrap-style1 clearfix-tabs" style="">
				
													<ul class="gk_tab_ul-style1">
														<li class="active"><span>Members</span></li>
														<li><span>Game Award</span></li>
														<li><span>Top Comments</span></li>
													</ul>
					
													<div class="gk_tab_container0-style1" style="height: 300px;">
														<div class="gk_tab_container1-style1 clearfix-tabs" style="height: 300px;">
															<div class="gk_tab_container2-style1 clearfix-tabs" style="width: 2168px; ">
					
																<div class="gk_tab_item-style1" style="height: 300px; width: 542px; ">
																	<div class="gk_tab_item_space">
			
																		<div class="gk_js_members_main" id="gk_js_members1" style="width:542px;">
																			<div class="gk_js_content" style="width:472px;">
																				<div class="gk_js_content_wrap">
																					<div class="gk_js_members" style="display: block; ">
																						<div class="gk_js_members_scroll1" style="width:472px;">		
																							<div class="gk_js_members_scroll2">	
																								<?php 
																									$i=0;
																									foreach ($newestMB as $key =>$value) {
																										if ($i%3==0) {
																											echo '<div class="gk_js_members_wrap" style="width:472px;">';
																										}
																								?>
																										<div class="gk_js_member" style="width:157px;">
																											<div class="gk_js_member_wrap">
																												<a href="<?php echo $baseUrl.'/user/info-'.$value['id'].'.html';?>" class="gk_js_avatar">
																													<?php 
																													if($value['avatarurl']!=''){
																														echo '<img src="'.$value['avatarurl'].'" width="143" height="143" alt="'.$value['first_name'].' '.$value['last_name'].'">';
																													}else{
																														echo '<img src="'.$baseUrl.'/images/login-members.png'.'" width="143" height="143" alt="'.$value['first_name'].' '.$value['last_name'].'">';
																													}																													
																													?>
																												</a>
																												<div class="gk_js_member_name">
																													<span>
																													<?php 
																													$name = '';
																													$old_name = $value['first_name'];
																													for ($index = 0; $index < strlen($old_name); $index++) {
																														$name.=$old_name[$index];
																														if ($index>12) {
																															$name.=' ...';
																															break;
																														}
																													}
																													echo $name;
																													?>
																													</span>
																												</div>
																												<div class="gk_js_since">
																													<span>Member since:</span>
																													<span>
																														<?php 
																														$sd = new Zend_Date($value['date_created'], 'MM/dd/yyyy hh:mm:ss');
																														echo $sd->toString("yyyy-MM-dd hh:mm");
																														?>
																													</span>
																												</div>	
																												<div class="gk_js_lastonline">
																													<span>Last online:</span>
																													<span>
																														<?php 
																														$ld = new Zend_Date($value['last_login'], 'MM/dd/yyyy hh:mm:ss');
																														echo $ld->toString("yyyy-MM-dd hh:mm");
																														?>
																													</span>
																												</div>
																												<div class="gk_js_profileviews">
																													<span>0</span>
																												</div>
																											</div>
																										</div>
																								<?php 																		
																										if ($i%3==2) {
																											echo '<div class="clearfix"></div>';
																											echo '</div>';																			
																										}
																										$i++;
																									}
																								?>							
																							</div>
																						</div>
					
																						<div class="gk_js_interface" style="width: 92px; float: none; ">
																							<div class="clearfix">
																								<span class="gk_js_prev">«</span>
																								<span class="gk_js_page active">1</span>
																								<span class="gk_js_page">2</span>
																								<span class="gk_js_page">3</span>
																								<span class="gk_js_next">»</span>
																							</div>
																						</div>			
																					</div>


																					<div class="gk_js_members" style="display: none; ">
																						<div class="gk_js_members_scroll1" style="width:472px;">		
																							<div class="gk_js_members_scroll2">	
																								<?php 
																									$i=0;
																									foreach ($newestMB as $key =>$value) {
																										if ($i%3==0) {
																											echo '<div class="gk_js_members_wrap" style="width:472px;">';
																										}
																								?>
																										<div class="gk_js_member" style="width:157px;">
																											<div class="gk_js_member_wrap">
																												<a href="<?php echo $baseUrl.'/user/info-'.$value['id'].'.html';?>" class="gk_js_avatar">
																													<?php 
																													if($value['avatarurl']!=''){
																														echo '<img src="'.$value['avatarurl'].'" width="143" height="143" alt="'.$value['first_name'].' '.$value['last_name'].'">';
																													}else{
																														echo '<img src="'.$baseUrl.'/images/login-members.png'.'" width="143" height="143" alt="'.$value['first_name'].' '.$value['last_name'].'">';
																													}																													
																													?>
																													
																												</a>
																												<div class="gk_js_member_name">
																													<span>
																													<?php 
																													$name = '';
																													$old_name = $value['first_name'];
																													for ($index = 0; $index < strlen($old_name); $index++) {
																														$name.=$old_name[$index];
																														if ($index>12) {
																															$name.=' ...';
																															break;
																														}
																													}
																													echo $name;
																													?>
																													</span>
																												</div>
																												<div class="gk_js_since">
																													<span>Member since:</span>
																													<span>
																														<?php 
																														$sd = new Zend_Date($value['date_created'], 'MM/dd/yyyy hh:mm:ss');
																														echo $sd->toString("yyyy-MM-dd hh:mm");
																														?>
																													</span>
																												</div>	
																												<div class="gk_js_lastonline">
																													<span>Last online:</span>
																													<span>
																														<?php 
																														$ld = new Zend_Date($value['last_login'], 'MM/dd/yyyy hh:mm:ss');
																														echo $ld->toString("yyyy-MM-dd hh:mm");
																														?>
																													</span>
																												</div>
																												<div class="gk_js_profileviews">
																													<span>0</span>
																												</div>
																											</div>
																										</div>
																								<?php 																		
																										if ($i%3==2) {
																											echo '<div class="clearfix"></div>';
																											echo '</div>';																			
																										}
																										$i++;
																									}
																								?>							
																							</div>
																						</div>
					
																						<div class="gk_js_interface" style="width: 92px; float: none; ">
																							<div class="clearfix">
																								<span class="gk_js_prev">«</span>
																								<span class="gk_js_page active">1</span>
																								<span class="gk_js_page">2</span>
																								<span class="gk_js_page">3</span>
																								<span class="gk_js_next">»</span>
																							</div>
																						</div>			
																					</div>

																					<div class="gk_js_members" style="display: none; ">
																						<div class="gk_js_members_scroll1" style="width:472px;">		
																							<div class="gk_js_members_scroll2">	
																								<?php 
																									$i=0;
																									foreach ($topPL as $key =>$value) {
																										if ($i%3==0) {
																											echo '<div class="gk_js_members_wrap" style="width:472px;">';
																										}
																								?>
																										<div class="gk_js_member" style="width:157px;">
																											<div class="gk_js_member_wrap">
																												<a href="<?php echo $baseUrl.'/user/info-'.$value['id'].'.html';?>" class="gk_js_avatar">
																													<?php 
																													if($value['avatarurl']!=''){
																														echo '<img src="'.$value['avatarurl'].'" width="143" height="143" alt="'.$value['first_name'].' '.$value['last_name'].'">';
																													}else{
																														echo '<img src="'.$baseUrl.'/images/login-members.png'.'" width="143" height="143" alt="'.$value['first_name'].' '.$value['last_name'].'">';
																													}																													
																													?>
																												</a>
																												<div class="gk_js_member_name">
																													<span>
																													<?php 
																													$name = '';
																													$old_name = $value['first_name'];
																													for ($index = 0; $index < strlen($old_name); $index++) {
																														$name.=$old_name[$index];
																														if ($index>12) {
																															$name.=' ...';
																															break;
																														}
																													}
																													echo $name;
																													?>
																													</span>
																												</div>
																												<div class="gk_js_since">
																													<span>Member since:</span>
																													<span>
																														<?php 
																														$sd = new Zend_Date($value['date_created'], 'MM/dd/yyyy hh:mm:ss');
																														echo $sd->toString("yyyy-MM-dd hh:mm");
																														?>
																													</span>
																												</div>	
																												<div class="gk_js_lastonline">
																													<span>Last online:</span>
																													<span>
																														<?php 
																														$ld = new Zend_Date($value['last_login'], 'MM/dd/yyyy hh:mm:ss');
																														echo $ld->toString("yyyy-MM-dd hh:mm");
																														?>
																													</span>
																												</div>
																												<div class="gk_js_profileviews">
																													<span>0</span>
																												</div>
																											</div>
																										</div>
																								<?php 																		
																										if ($i%3==2) {
																											echo '<div class="clearfix"></div>';
																											echo '</div>';																			
																										}
																										$i++;
																									}
																								?>							
																							</div>
																						</div>
					
																						<div class="gk_js_interface" style="width: 92px; float: none; ">
																							<div class="clearfix">
																								<span class="gk_js_prev">«</span>
																								<span class="gk_js_page active">1</span>
																								<span class="gk_js_page">2</span>
																								<span class="gk_js_page">3</span>
																								<span class="gk_js_next">»</span>
																							</div>
																						</div>			
																					</div>
																					
																					<div class="gk_js_overlay" style="display: block; visibility: hidden; zoom: 1; opacity: 0; "></div>
																				</div>	
																			</div>
																			<div class="gk_js_tabs" style="width:70px;">
																				<div class="gk_js_tabs_wrap">
																					<div class="gk_js_tab active"><span>Newest</span></div>
																					<div class="gk_js_tab"><span>HOT</span></div>
																					<div class="gk_js_tab"><span>Top Play</span></div>
																				</div>
																			</div>			
																		</div>
																		<script type="text/javascript">
																			try{$Gavick;}catch(e){$Gavick = {};}
																			$Gavick["gk_js_members-gk_js_members1"] = {
																				"animationType" : Fx.Transitions.Cubic.easeOut,
																				"animationSpeed" : 500	};
																		</script>		
																	</div>
																</div>
																
																<div class="gk_tab_item-style1" style="height: 300px; width: 542px; ">
																	<div class="gk_tab_item_space">
			
																		<div class="gk_js_members_main" id="gk_js_members1" style="width:542px;">
																			<div class="gk_js_content" style="width:472px;">
																				<div class="gk_js_content_wrap">
																					<div class="gk_js_members" style="display: block; ">
																						<div class="gk_js_members_scroll1" style="width:472px;">		
																							<div class="gk_js_members_scroll2">	
																								<?php 
																									$i=0;
																									foreach ($listHotGame as $key =>$value) {
																										if ($i%3==0) {
																											echo '<div class="gk_js_members_wrap" style="width:472px;">';
																										}
																								?>
																										<div class="gk_js_member" style="width:157px;">
																											<div class="gk_js_member_wrap">
																												<a href="<?php echo $baseUrl.'/games/play/'.$value['nameid'].'-'.$value['id'].'-'.$this->getIDCat($value['id']).'.html'?>" class="gk_js_avatar">
																													<img src="<?php echo $value['source_image'];?>" width="143" height="143" alt="<?php echo $value['name']?>">
																												</a>
																												<div class="gk_js_member_name">
																													<span>
																													<?php 
																													$name = '';
																													$old_name = $value['name'];
																													for ($index = 0; $index < strlen($old_name); $index++) {
																														$name.=$old_name[$index];
																														if ($index>12) {
																															$name.=' ...';
																															break;
																														}
																													}
																													echo $name;
																													?>
																													</span>
																												</div>
																												<div class="gk_js_since">
																													<span></span>
																													<span>
																														<?php 
																														//$sd = new Zend_Date($value['date_created'], 'MM/dd/yyyy hh:mm:ss');
																														//echo $sd->toString("yyyy-MM-dd hh:mm");
																														?>
																													</span>
																												</div>	
																												<div class="gk_js_lastonline">
																													<span>Plays:</span>
																													<span>
																														<?php 																														
																														//$ld = new Zend_Date($value['last_login'], 'MM/dd/yyyy hh:mm:ss');
																														//echo $ld->toString("yyyy-MM-dd hh:mm");
																														?>
																													</span>
																												</div>
																												<div class="gk_js_profileviews">
																													<span><?php echo $value['playcount'];?></span>
																												</div>
																											</div>
																										</div>
																								<?php 																		
																										if ($i%3==2) {
																											echo '<div class="clearfix"></div>';
																											echo '</div>';																			
																										}
																										$i++;
																									}
																								?>							
																							</div>
																						</div>
					
																						<div class="gk_js_interface" style="width: 92px; float: none; ">
																							<div class="clearfix">
																								<span class="gk_js_prev">«</span>
																								<span class="gk_js_page active">1</span>
																								<span class="gk_js_page">2</span>
																								<span class="gk_js_page">3</span>
																								<span class="gk_js_next">»</span>
																							</div>
																						</div>			
																					</div>
																					<div class="gk_js_overlay" style="display: block; visibility: hidden; zoom: 1; opacity: 0; "></div>
																				</div>	
																			</div>
																			<div class="gk_js_tabs" style="width:70px;">
																				<div class="gk_js_tabs_wrap">
																					<div class="gk_js_tab active"><span>TOP</span></div>
																				</div>
																			</div>			
																		</div>
																			
																	</div>
																</div>															
																
																<div class="gk_tab_item-style1" style="height: 300px; width: 542px; ">
																	<div class="gk_tab_item_space">
																		<div class="videocomments">
																			<ul>
																				<li style="background: none; padding: 5px 0; border-bottom: solid 1px #ccc;">
																					
																					<div style="margin-left: 42px;line-height: normal;">
																						<span style="display: block;margin-top: 3px;">No content</span>
																					</div>
																					<div style="clear: both;"></div>
																				</li>
																			</ul>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
			
												<div class="gk_tab_button_next-style1"></div>
												<div class="gk_tab_button_prev-style1"></div>
											</div>
											<div class="clearfix-tabs"></div>

										</div>
									</div>
								</div>
				
								<div class="gk_round_b">
									<div class="gk_round_bl"></div>
									<div class="gk_round_br"></div>
								</div>
							</div>