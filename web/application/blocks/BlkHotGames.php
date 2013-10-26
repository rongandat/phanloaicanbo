<?php
class Block_BlkHotGames extends Zend_View_Helper_Abstract{
	function blkHotGames(){
            $view  = $this->view;	
            $cache = Zend_Registry::get('cache');       
            if(!$listGame = $cache->load('cache_hot_game')) {
                $gamesModel = new Admin_Model_Games();
                $listGame = $gamesModel->fetchGames(array('game_hot'=>1, 'active'=>1));
                $listGame=$listGame->toArray();
                $cache->save($listGame, 'cache_hot_game');
            }            
            require_once (BLOCK_PATH . '/BlkHotGames/default.php');
	}
}