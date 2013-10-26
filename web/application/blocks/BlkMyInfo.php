<?php
class Block_BlkMyInfo extends Zend_View_Helper_Abstract{
	
	function BlkMyInfo($type, $size)
	{		
		$view  = $this->view;
                $user = $view->data;
                require_once (BLOCK_PATH . '/BlkMyInfo/default.php');
	}
}