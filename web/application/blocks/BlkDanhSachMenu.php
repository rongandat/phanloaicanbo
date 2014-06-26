<?php

class Block_BlkDanhSachMenu extends Zend_View_Helper_Abstract {

    function blkDanhSachMenu() {
        $view = $this->view;
        $arrParam = $view->arrParam;
        $auth = Zend_Auth::getInstance();
        $identity = $auth->getIdentity();
        $arrParam = $view->arrParam;
        $list_menu = array(
            'phongban' => 'Lọc theo phòng ban',
            'chucvu' => 'Lọc theo chức vụ',
            'bangcap' => 'Lọc theo bằng cấp',
            'hocham' => 'Lọc theo học hàm',
            'tinhhuyen' => 'Lọc theo tỉnh',
            'dantoc' => 'Lọc theo dân tộc',
            'ngachcongchuc' => 'Lọc theo ngạch công chức',
            'chungchi' => 'Lọc theo chứng chỉ'
        );
        $controller_name = Zend_Controller_Front::getInstance()->getRequest()->getControllerName();
        require_once (BLOCK_PATH . '/BlkDanhSachMenu/' . TEMPLATE_USED . '/default.php');
    }

}