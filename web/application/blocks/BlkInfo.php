<?php

class Block_BlkInfo extends Zend_View_Helper_Abstract {

    function blkInfo() {
        $view = $this->view;
        $arrParam = $view->arrParam;
        $baseUrl = $view->baseUrl();
        $game = $arrParam['game_info'];
        $nameid = strtolower(str_replace('_', '-', $game['nameid']));
        require_once (BLOCK_PATH . '/BlkInfo/' . TEMPLATE_USED . '/default.php');
    }

}

?>