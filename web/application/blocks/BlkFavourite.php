<?php
class Block_BlkFavourite extends Zend_View_Helper_Abstract{
	
	function blkFavourite($user_id)
	{	
            $flagLogin = false;
            $flagDelete = false;
            $auth = Zend_Auth::getInstance();
            if ($auth->hasIdentity()) {
                $flagLogin = false;
                $identity = $auth->getIdentity();
                $us = $identity->id;
                if($user_id==$us){
                    $flagDelete=true;
                }
            }
            $favouriteModel = new Front_Model_Favourite();
            $listGame = $favouriteModel->uFavourite($user_id);
            if (count($listGame)) {
                require_once (BLOCK_PATH . '/BlkFavourite/default.php');
            }            
	}
}