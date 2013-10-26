<?php
class Block_BlkButtonFunction extends Zend_View_Helper_Abstract{
	function blkButtonFunction(){		
		?>
		<script type="text/javascript" src="https://apis.google.com/js/plusone.js"></script>
		<div style="text-align: right; margin-left: 20px; margin-top: -5px;"><g:plusone></g:plusone></div>
	<?php 
	}
}?>