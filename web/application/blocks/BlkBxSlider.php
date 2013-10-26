<?php

class Block_BlkBxSlider extends Zend_View_Helper_Abstract {
    function blkBxSlider() {
        $view = $this->view;
        $cache = Zend_Registry::get('cache');
        if (!$listGame = $cache->load('cache_playlist')) {
            $gamesModel = new Admin_Model_Games();
            $listGame = $gamesModel->fetchGamesSlider(array('game_hot' => 1, 'active' => 1), 'id ASC', 8);
            $cache->save($listGame, 'cache_playlist');
        }
        require_once (BLOCK_PATH . '/BlkBxSlider/' . TEMPLATE_USED . '/default.php');
    }
}