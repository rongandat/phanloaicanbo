<?php
class Block_BlkAdv extends Zend_View_Helper_Abstract{
	
	function blkAdv($type, $size)
	{		
            include BLOCK_PATH . '/BlkAdv/'.$type.'/'.$size.'.php';
	}
}