<?php

class Block_BlkTopMenu extends Zend_View_Helper_Abstract {

    function blkTopMenu() {
        $view = $this->view;
        $arrParam = $view->arrParam;
        $module_name = Zend_Controller_Front::getInstance()->getRequest()->getModuleName();
        $list_menu = array(
            'front' => array('name' => 'Trang chủ', 'sub' => array()),
            'hethong' => array('name' => 'Hệ thống', 'sub' => array(
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
                    'tinh' => 'QL Tỉnh, Huyện',
                    'ngachcongchuc' => 'QL Ngạch công chức'
            )),
            'canhan' => array('name' => 'Cá nhân', 'sub' => array(
                    'thongbao' => 'Thông báo',
                    'thongtin' => 'Thông tin cá nhân',
                    'capnhatthongtin' => 'Cập nhật thông tin',
                    'xinnghiphep' => 'Xin nghỉ phép',
                    'chamcong' => 'Chấm công',
                    'khaibaothemgio' => 'Khai báo thêm giờ',
                    'thongkethang' => 'Thống kê tháng',
                    'danhgiaphanloai' => 'Đánh giá phân loại',
                    'doimatkhau' => 'Đổi mật khẩu'
            )),
            'donvi' => array('name' => 'Đơn vị', 'sub' => array(
                    'thanhvien' => 'Thành viên',
                    'duyetnghiphep' => 'Duyệt nghỉ phép',
                    'duyetthemgio' => 'Duyệt thêm giờ',
                    'duyetphanloai' => 'Duyệt phân loại cán bộ',                    
                    'thongbao' => 'Thông báo'
            )),
            'tochuccanbo' => array('name' => 'Tổ chức cán bộ', 'sub' => array(
                    'hesoluong' => 'QL Hệ số lương',
                    'employees' => 'QL Cán bộ',
                    'capnhatthongtin' => 'QL Yêu cầu cập nhật thông tin',
                    'duyetphanloai' => 'Duyệt phân loại cán bộ',
                    'duyetthemgio' => 'Duyệt thêm giờ',
                    'yckhenthuong' => 'QL Yêu cầu khen thưởng',
                    'yckyluat' => 'QL Yêu cầu kỷ luật/khiển trách',
                    'thongbao' => 'Thông báo'
            )),
            'thongke' => array('name' => 'Thống kê', 'sub' => array()),
            'inluong' => array('name' => 'In lương', 'sub' => array()),
            'danhsach' => array('name' => 'Danh sách', 'sub' => array())
        );

        require_once (BLOCK_PATH . '/BlkTopMenu/' . TEMPLATE_USED . '/default.php');
    }

}