<?php

class Block_BlkSliderHotGame extends Zend_View_Helper_Abstract {

    function blkSliderHotGame() {
        $view = $this->view;
        $cache = Zend_Registry::get('cache');
        if (!$listGame = $cache->load('cache_playlist')) {
            $gamesModel = new Admin_Model_Games();
            $listGame = $gamesModel->fetchGames(array('game_hot' => 1, 'active' => 1), 'id DESC', 10);
            $cache->save($listGame, 'cache_playlist');
        }
        require_once (BLOCK_PATH . '/BlkSliderHotGame/' . TEMPLATE_USED . '/default.php');
    }

}