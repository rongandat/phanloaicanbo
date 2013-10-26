<?php 
class Block_BlkAddFriends extends Zend_View_Helper_Abstract{
	
	function blkAddFriends($user_id)
	{	
            $flagShow = false;
            $auth = Zend_Auth::getInstance();
            if ($auth->hasIdentity()) {
                $identity = $auth->getIdentity();
                $us = $identity->id;
                if($user_id==$us){
                    $flagShow=true;
                }
            }            
            if ($flagShow) {
                $friendModel = new User_Model_Friend();
                $listRequest = $friendModel->getFriend($user_id, null, null, null,2);
                if(count($listRequest)){
                    require_once (BLOCK_PATH . '/BlkAddFriends/default.php');
                }
            }            
	}
}