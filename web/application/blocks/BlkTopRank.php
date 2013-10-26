<?php
class Block_BlkTopRank extends Zend_View_Helper_Abstract{
	
	function blkTopRank($limit=10)
	{		
            $memberModel = new User_Model_Accounts();
            $ranking = $memberModel->ranking($limit);
            $ranking = $ranking->toArray();
            require_once (BLOCK_PATH . '/BlkTopRank/default.php');
	}
}