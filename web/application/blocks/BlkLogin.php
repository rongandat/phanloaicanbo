<?php
class Block_BlkLogin extends Zend_View_Helper_Abstract{
	function blkLogin(){?>				
			<div class="moduletable_ver2">
				<div class="gk_round_t">
					<div class="gk_round_tl"></div>
					<div class="gk_round_tr"></div>
				</div>

				<div class="gk_round_m">
					<div class="gk_round_ml">					
						<h3><span><span class="first-word">Members</span> Login</span></h3>
											
						<div class="moduletable_content clearfix">
							<form action="<?php echo SITE_URL.'/user/signin.html';?>" method="post" name="login" id="form-login">
								<fieldset class="input">
									<label for="modlgn_username">Username<br>
										  <input id="username" type="text" name="username" class="inputbox" alt="username" size="18">
									</label>
									<label for="modlgn_passwd">Password<br>
										  <input id="password" type="password" name="password" class="inputbox" size="18" alt="password">
									</label>
												<input id="modlgn_remember" type="checkbox" name="remember" class="inputbox" value="yes" alt="Remember Me">
									<label for="modlgn_remember">Remember Me            </label>
												<p class="mod_login_button">
									<input type="submit" name="Submit" class="button" value="Login"></p>
								</fieldset>
		  
								<ul class="js_forgot">
									<li>
									<a href="<?php echo SITE_URL.'/user/fpass.html';?>">
										Forgot your password?</a>
									</li>
									<li>
										<a href="<?php echo SITE_URL.'/user/signup.html';?>">
										Create new account</a>
									</li>
								</ul>
								<input type="hidden" name="option" value="com_user">
								<input type="hidden" name="task" value="login">
								<input type="hidden" name="return" value="L2pvb21sYTE1L25vdjIwMDkv">
								<input type="hidden" name="a90201fb21dc46e09cff1c53ea5faa5b" value="1">
							</form>
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