<?php
class Block_BlkUploadGameSource extends Zend_View_Helper_Abstract{
	function blkUploadGameSource(){
		$view  = $this->view;		
		require_once (BLOCK_PATH . '/BlkUploadGameSource/default.php');
	}
}