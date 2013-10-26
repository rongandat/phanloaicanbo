<?php
class Block_BlkMyAction extends Zend_View_Helper_Abstract{
	
	function BlkMyAction()
	{		
		$view  = $this->view;
                $user = $view->data;
                require_once (BLOCK_PATH . '/BlkMyAction/default.php');
	}
}