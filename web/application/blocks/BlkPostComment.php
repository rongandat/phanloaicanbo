<?php
class Block_BlkPostComment extends Zend_View_Helper_Abstract{
	function blkPostComment(){	
		$view  = $this->view;
		$arrParam = $view->arrParam;
                $game_info = $arrParam['game_info'];
                $id = $game_info['id'];
		$auth = Zend_Auth::getInstance();
		$message = '';
		$disable = '';
		$avatar = SITE_URL.'/public/images/no_avatar.jpg'; 
		if (!$auth->hasIdentity()) {
			$message = 'You must login to post a comment! ';
			$disable = 'disabled="disabled"';
		}else{
			$identity = $auth->getIdentity();	
			$avatar = 	$identity->avatarurl;
		}	
		require_once (BLOCK_PATH . '/BlkPostComment/default.php');
	}
}
?>