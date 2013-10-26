<?php

class Block_BlkNewGame extends Zend_View_Helper_Abstract {
    function blkNewGame() {
        $cache = Zend_Registry::get('cache');
        $gameModel = new Front_Model_Games();
        if (!$new_game = $cache->load('cache_new_game')) {
            $gameModel = new Front_Model_Games();
            $new_game = $gameModel->fetchTopAllGames('id DESC', 24);
            $new_game = $new_game->toArray();
            $cache->save($new_game, 'cache_new_game');
        }        
        require_once (BLOCK_PATH . '/BlkNewGame/'.TEMPLATE_USED.'/default.php');
    }

}
?>