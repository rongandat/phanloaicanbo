<?php

class Block_BlkHethongMenu extends Zend_View_Helper_Abstract {

    function blkHethongMenu() {
        $view = $this->view;
        $arrParam = $view->arrParam;
        $list_menu = array(
            'users' => 'QL Tài khoản',
            'groups' => 'QL Nhóm, Phân quyền',
            'phongban' => 'QL Phòng ban',
            'chucvu' => 'QL Chức vụ',
            'holidays' => 'QL Ngày công',
            'tieuchi' => 'QL Tiêu chí đánh giá cán bộ',
            'ketqua' => 'QL Đánh giá kết quả công việc',
            'bangcap' => 'QL Bằng cấp',
            'chungchi' => 'QL Chứng chỉ',
            'hocham' => 'QL Học hàm',
            'dantoc' => 'QL Dân tộc',
            'tinh' => 'QL Tỉnh, Huyện',
            'ngachcongchuc' => 'QL Ngạch công chức',
            'chucvudoan' => 'QL Chức vụ đoàn',
            'chucvudang' => 'QL Chức vụ đảng',
            'chucvucongdoan' => 'QL Chức vụ công đoàn',
            'quanlynhanuoc' => 'QL Quản lý nhà nước',
            'lyluanchinhtri' => 'QL Lý luận chính trị',
            'nghile' => 'QL Ngày nghỉ lễ'
        );
        $controller_name = Zend_Controller_Front::getInstance()->getRequest()->getControllerName();
        require_once (BLOCK_PATH . '/BlkHethongMenu/' . TEMPLATE_USED . '/default.php');
    }

}