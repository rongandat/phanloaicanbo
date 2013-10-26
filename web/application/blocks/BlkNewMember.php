<?php
class Block_BlkNewMember extends Zend_View_Helper_Abstract{
	
	function blkNewMember($limit=10)
	{		
            $memberModel = new User_Model_Accounts();
            $newMembers = $memberModel->fetchNewUser(array(), 'date_created', 'DESC', $limit);
            $newMembers = $newMembers->toArray();
            require_once (BLOCK_PATH . '/BlkNewMembers/'.  TEMPLATE_USED .'/default.php');
	}
}