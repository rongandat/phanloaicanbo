<?php
class Block_BlkFollowSocial extends Zend_View_Helper_Abstract{
	
	function blkFollowSocial()
	{		
		require_once (BLOCK_PATH . '/BlkFollowSocial/default.php');
	}
}