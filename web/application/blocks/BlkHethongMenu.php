<?php

class Block_BlkHethongMenu extends Zend_View_Helper_Abstract {

    function blkHethongMenu() {
        $view = $this->view;
        $arrParam = $view->arrParam;
        $controller_name = Zend_Controller_Front::getInstance()->getRequest()->getControllerName();
        require_once (BLOCK_PATH . '/BlkHethongMenu/' . TEMPLATE_USED . '/default.php');
    }

}