<?php
class Block_BlkTopBlock extends Zend_View_Helper_Abstract{
	
	function getIDCat($idGame){
		$cat_game = new Admin_Model_CatGame();
		$cat = $cat_game->fetchRow('game_id='.$idGame);
		return $cat['cat_id'];
	}
	
	function blkTopBlock(){
		$view = $this->view;
		$arrParam = $view->arrParam;
		$baseUrl = $view->baseUrl();		
		$memberModel = new User_Model_Accounts();
		$newestMB = $memberModel->fetchNewUser(array('active'=>1), 'date_created', 'DESC',9);
		$newestMB = $newestMB->toArray(); 
		$topOL = $memberModel->fetchNewUser(array('active'=>1), 'count_online', 'DESC',9);
		$topOL = $topOL->toArray();
		$topPL = $memberModel->fetchNewUser(array('active'=>1), 'count_plays', 'DESC',9);
		$topPL = $topPL->toArray();
		
		$hotGame = new Front_Model_Games();
		$listHotGame = $hotGame->filterGame(array('game_hot'=>1,'active'=>1),'date_created','DESC',9);
		$listHotGame = $listHotGame->toArray();
		require_once (BLOCK_PATH . '/BlkTopBlock/default.php');
	}
}
?>