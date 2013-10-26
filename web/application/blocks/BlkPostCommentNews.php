<?php
class Block_BlkPostCommentNews extends Zend_View_Helper_Abstract{
	function blkPostCommentNews(){	
		$view  = $this->view;
		$arrParam = $view->arrParam;
                $news_info = $arrParam['news_info'];
                $id = $news_info['id'];
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
		require_once (BLOCK_PATH . '/BlkPostCommentNews/default.php');
	}
}
?>