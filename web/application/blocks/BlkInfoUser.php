<?php
class Block_BlkInfoUser extends Zend_View_Helper_Abstract{
	function blkInfoUser(){
		$view = $this->view;
		$arrParam = $view->arrParam;
		$baseUrl = $view->baseUrl();
		$authAdapter = Zend_Auth::getInstance();
		$identity = $authAdapter->getIdentity();	
		$avatar = 	$identity->avatarurl;
		echo $avatar;
		//echo $identity->isadmin;?>
		
			<div class="moduletable_ver2">
				<div class="gk_round_t">
					<div class="gk_round_tl"></div>
					<div class="gk_round_tr"></div>
				</div>

				<div class="gk_round_m">
					<div class="gk_round_ml">					
						<h3><span><span class="first-word">Members</span> Menu</span></h3>
											
						<div class="moduletable_content clearfix">						
							<p style="margin-top: 0px;">Welcome: <span style="font-weight: bold; color: lime;"><?php echo $identity->last_name;?></span></p>
	  						<p style="text-align: center; padding: 0; margin-top: 0; margin-bottom: 0px;">
	  						<?php 
	  						if($avatar !=''){
	  							echo '<img src="'.$avatar.'" height="70px" width="80px" style="border: 1px solid #ffffff; "></img>';
	  						}else{
	  							echo '<img src="'.SITE_URL.'/images/login-members.png'.'" height="70px" width="80px" style="border: 1px solid #ffffff; "></img>';	  							
	  						}
	  						?>
	  						
	  						
	  						</p>
							<ul class="js_forgot" style="padding-top: 0; margin-top: 0;">														
								<li>
									<a href="<?php echo SITE_URL.'/my-info.html';?>">
									My information</a>
								</li>
								<li>
								<a href="<?php echo SITE_URL.'/user/change-info.html';?>">
									Change info</a>
								</li>		
								<li>
								<a href="<?php echo SITE_URL.'/user/change-pass.html';?>">
									Change password</a>
								</li>								
								<li>									
									Favorites
								</li>
								<li>
									<a href="<?php echo SITE_URL.'/user/logout.html';?>">
									Log out</a>
								</li>
							</ul>
							<input type="hidden" name="option" value="com_user">
							<input type="hidden" name="task" value="login">
							<input type="hidden" name="return" value="L2pvb21sYTE1L25vdjIwMDkv">
							<input type="hidden" name="a90201fb21dc46e09cff1c53ea5faa5b" value="1">
						</div>
					</div>
				</div>

				<div class="gk_round_b">
					<div class="gk_round_bl"></div>
					<div class="gk_round_br"></div>
				</div>
			</div>
	<?php }
}
?>