<?php
class Block_BlkAllAdv extends Zend_View_Helper_Abstract{
	
	function blkAllAdv($type, $size)
	{		
		require_once (BLOCK_PATH . '/BlkAllAdv/default.php');
	}
}