<?php

class Block_BlkTagsGame extends Zend_View_Helper_Abstract {

    function blkTagsGame() {
        $view = $this->view;
        $arrParam = $view->arrParam;
        $game = $arrParam['game_info'];
        $tags = $game['keywords'];
        $tag_ex = explode(',', $tags);
        require_once (BLOCK_PATH . '/BlkTagsGame/' . TEMPLATE_USED . '/default.php');
    }

}
?>