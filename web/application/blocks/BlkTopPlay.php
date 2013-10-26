<?php

class Block_BlkTopPlay extends Zend_View_Helper_Abstract {

    function blkTopPlay() {

        $cache = Zend_Registry::get('cache');

        $gameModel = new Front_Model_Games();

        if (!$listTopGames = $cache->load('cache_top_game')) {

            $listTopGame = $gameModel->filterGame(array('game_hot' => 1, 'active' => 1), 'playcount', 'DESC', 24);

            $listTopGame = $listTopGame->toArray();

            $cache->save($listTopGames, 'cache_top_game');
        }
        require_once (BLOCK_PATH . '/BlkTopPlay/' . TEMPLATE_USED . '/default.php');
    }

}
?>