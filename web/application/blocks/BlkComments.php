<?php

class Block_BlkComments extends Zend_View_Helper_Abstract {

    function blkComments() {
        $view = $this->view;
        $arrParam = $view->arrParam;
        $baseUrl = $view->baseUrl();
        $game = $arrParam['game_info'];
        $nameid = strtolower(str_replace('_', '-', $game['nameid']));
        require_once (BLOCK_PATH . '/BlkComments/' . TEMPLATE_USED . '/default.php');
    }

}

?>