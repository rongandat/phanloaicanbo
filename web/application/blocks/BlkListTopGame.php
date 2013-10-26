<?php
class Block_BlkListTopGame extends Zend_View_Helper_Abstract{
	
	function blkListTopGame($numOfGame=10)
	{
		$view  = $this->view;
		$arrParam = $view->arrParam;
		$cid = $arrParam['cid'];
                $cache = Zend_Registry::get('cache');       
                if(!$listTopGame = $cache->load('cache_list_top_game')) {
                    $gameModel = new Front_Model_Games();
                    $listTopGame = $gameModel->fetchTopAllGames('playcount DESC',$numOfGame);
                    $listTopGame = $listTopGame->toArray();
                    $cache->save($listTopGame, 'cache_list_top_game');
                }		
		require_once (BLOCK_PATH . '/BlkListTopGame/default.php');
	}
}