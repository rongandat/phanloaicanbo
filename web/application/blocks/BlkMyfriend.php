<?php

class Block_BlkMyfriend extends Zend_View_Helper_Abstract {

    function blkMyfriend($count) {
        $view = $this->view;
        $arrParam = $view->arrParam;
        $baseUrl = $view->baseUrl();
        $friendModel = new User_Model_Friend();
        $friends = $friendModel->getFriend($arrParam['user_id'], null, $count, 0);
        $countFriend = $friendModel->countFriend($arrParam['user_id']);
        require_once (BLOCK_PATH . '/BlkMyfriend/default.php');
    }

}

?>