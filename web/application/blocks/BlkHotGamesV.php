<?php
class Block_BlkHotGamesV extends Zend_View_Helper_Abstract{
	function blkHotGamesV(){
            $view  = $this->view;
            $cache = Zend_Registry::get('cache');       
            if(!$listGame = $cache->load('cache_hot_game_v')) {
                $gameModel = new Front_Model_Games();
		$listGame = $gameModel->fetchTopAllGames('id DESC',16);
		$listGame=$listGame->toArray();
                $cache->save($listGame, 'cache_hot_game_v');
            }                  
            require_once (BLOCK_PATH . '/BlkHotGamesV/default.php');
	}
}