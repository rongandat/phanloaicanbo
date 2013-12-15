<?php

class Block_BlkFrontThongBao extends Zend_View_Helper_Abstract {

    protected $_employee_info;
    protected $_identity;

    function __construct() {
        $auth = Zend_Auth::getInstance();
        $identity = $auth->getIdentity();        
        $this->_identity = $identity;
    }

    function blkFrontThongBao() {
        $view = $this->view;
        $arrParam = $view->arrParam;
        $thongbaoModel = new Front_Model_ThongBao();
        $list_thong_bao = $thongbaoModel->fetchData(array('tb_to' => $this->_identity->em_id, 'tb_status' => 0));
        require_once (BLOCK_PATH . '/BlkFrontThongBao/' . TEMPLATE_USED . '/default.php');
    }

}