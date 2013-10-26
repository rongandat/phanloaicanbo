<?php
class Block_BlkAddthis extends Zend_View_Helper_Abstract{
	
	function blkAddthis()
	{	
            require_once (BLOCK_PATH . '/BlkAddthis/' . TEMPLATE_USED . '/default.php');       
	}
}