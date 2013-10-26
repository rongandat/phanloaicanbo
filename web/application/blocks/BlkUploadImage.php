<?php
class Block_BlkUploadImage extends Zend_View_Helper_Abstract{
	function blkUploadImage(){
		$view  = $this->view;		
		require_once (BLOCK_PATH . '/BlkUploadImage/default.php');
	}
}