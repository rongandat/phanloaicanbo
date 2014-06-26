<?php

class Block_BlkCaNhanMenu extends Zend_View_Helper_Abstract {

    function blkCaNhanMenu() {
        $view = $this->view;
        $arrParam = $view->arrParam;
        $auth = Zend_Auth::getInstance();
        $identity = $auth->getIdentity();
        $arrParam = $view->arrParam;
        $list_menu = array(
            'thongbao' => 'Thông báo',
            'thongtin' => 'Thông tin cá nhân',
            'capnhatthongtin' => 'Cập nhật thông tin',
            'xinnghiphep' => 'Xin nghỉ phép',
            'chamcong' => 'Chấm công',
            'khaibaothemgio' => 'Khai báo thêm giờ',
            'thongkethang' => 'Thống kê tháng',
            'danhgiaphanloai' => 'Đánh giá phân loại',
            'doimatkhau' => 'Đổi mật khẩu'
        );
        $controller_name = Zend_Controller_Front::getInstance()->getRequest()->getControllerName();
        require_once (BLOCK_PATH . '/BlkCaNhanMenu/' . TEMPLATE_USED . '/default.php');
    }

}