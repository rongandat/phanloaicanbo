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
            'holidays' => 'QL Ngày nghỉ lễ',
            'tieuchi' => 'QL Tiêu chí đánh giá cán bộ',
            'ketqua' => 'QL Đánh giá kết quả công việc',
            'bangcap' => 'QL Bằng cấp',
            'chungchi' => 'QL Chứng chỉ',
            'hocham' => 'QL Học hàm',
            'dantoc' => 'QL Dân tộc',
            'tinh' => 'QL Tỉnh, Huyện'
        );
        $controller_name = Zend_Controller_Front::getInstance()->getRequest()->getControllerName();
        require_once (BLOCK_PATH . '/BlkHethongMenu/' . TEMPLATE_USED . '/default.php');
    }

}