<?php

class Block_BlkTopMenu extends Zend_View_Helper_Abstract {

    function blkTopMenu() {
        $view = $this->view;
        $arrParam = $view->arrParam;
        $module_name = Zend_Controller_Front::getInstance()->getRequest()->getModuleName();
        require_once (BLOCK_PATH . '/BlkTopMenu/' . TEMPLATE_USED . '/default.php');
    }

}