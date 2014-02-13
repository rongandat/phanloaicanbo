<?php

class Block_BlkDonViMenu extends Zend_View_Helper_Abstract {

    function blkDonViMenu() {
        $view = $this->view;
        $arrParam = $view->arrParam;
        $list_menu = array(
            'thanhvien' => 'Thành viên',
            'duyetnghiphep' => 'Duyệt nghỉ phép',
            'duyetthemgio' => 'Duyệt thêm giờ',
            'duyetchamcong' => 'Duyệt chấm công',
            'duyetphanloai' => 'Duyệt phân loại cán bộ'
        );
        $controller_name = Zend_Controller_Front::getInstance()->getRequest()->getControllerName();
        require_once (BLOCK_PATH . '/BlkDonViMenu/' . TEMPLATE_USED . '/default.php');
    }

}