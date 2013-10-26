<?php
class Block_BlkURanking extends Zend_View_Helper_Abstract{
	
	function blkURanking($user_id)
	{	
            $pointModel = new Front_Model_Point();
            $points = $pointModel->fetchRow('member_id='.$user_id);        
            if ($points) {
                require_once (BLOCK_PATH . '/BlkURanking/default.php');
            }            
	}
}