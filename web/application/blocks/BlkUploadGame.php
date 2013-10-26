<?php
class Block_BlkUploadGame extends Zend_View_Helper_Abstract{
	function blkUploadGame(){
		$view  = $this->view;		
		require_once (BLOCK_PATH . '/BlkUploadGame/default.php');
	}
}