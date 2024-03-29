<?php

class Block_BlkTopInfo extends Zend_View_Helper_Abstract {

    protected $_employee_info;
    protected $_identity;

    function __construct() {
        $auth = Zend_Auth::getInstance();
        $identity = $auth->getIdentity();
        $employeeModel = new Front_Model_Employees();
        $employeeInfo = $employeeModel->fetchRow('em_id=' . $identity->em_id);
        $this->_employee_info = $employeeInfo;
        $this->_identity = $identity;
    }

    function blkTopInfo() {
        $view = $this->view;
        $arrParam = $view->arrParam;
        require_once (BLOCK_PATH . '/BlkTopInfo/' . TEMPLATE_USED . '/default.php');
    }

}