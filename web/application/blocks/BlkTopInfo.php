<?php

class Block_BlkTopInfo extends Zend_View_Helper_Abstract {

    function blkTopInfo() {
        $view = $this->view;
        $arrParam = $view->arrParam;
        $auth = Zend_Auth::getInstance();
        $identity = $auth->getIdentity();        
        $employeeModel = new Front_Model_Employees();        
        $employeeInfo = $employeeModel->fetchRow(array('em_id' => $identity->em_id));        
        require_once (BLOCK_PATH . '/BlkTopInfo/' . TEMPLATE_USED . '/default.php');
    }

}