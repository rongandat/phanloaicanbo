<?php
class Block_BlkLikeBox extends Zend_View_Helper_Abstract{
	
	function blkLikeBox($width=207)
	{
	?>		
		<div class="moduletable_ver3" style="background-color: white;">
			<div class="fb-like-box" data-href="http://www.facebook.com/pages/gameangrybirds/102078819898122" data-width="<?php echo $width;?>" data-show-faces="true" data-border-color="#E0E0E0" data-stream="false" data-header="true"></div>
		</div>	
	<?php 
	}
}