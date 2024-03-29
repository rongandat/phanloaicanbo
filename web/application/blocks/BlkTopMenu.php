<?php

class Block_BlkTopMenu extends Zend_View_Helper_Abstract {

    function blkTopMenu() {
        $view = $this->view;
        $arrParam = $view->arrParam;
        $auth = Zend_Auth::getInstance();
        $identity = $auth->getIdentity();

        $module_name = Zend_Controller_Front::getInstance()->getRequest()->getModuleName();
        $list_menu = array(
            'front' => array('name' => 'Trang chủ', 'sub' => array()),
            'hethong' => array('name' => 'Hệ thống', 'sub' => array(
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
                    'doimatkhau' => 'Đổi mật khẩu',
                    'inluong' => 'Xem bảng lương 0.5'
                )),
            'donvi' => array('name' => 'Đơn vị', 'sub' => array(
                    'thanhvien' => 'Thành viên',
                    'duyetnghiphep' => 'Duyệt nghỉ phép',
                    'duyetthemgio' => 'Duyệt thêm giờ',
                    'duyetchamcong' => 'Duyệt chấm công',
                    'duyetphanloai' => 'Duyệt phân loại cán bộ',
                    'thongkethang' => 'Thống kê tháng',
                )),
            'taivu' => array('name' => 'Tài vụ', 'sub' => array(
                    'employees' => 'QL hệ số lương & phụ cấp',
                    'hesoluong' => 'QL Lương cơ bản',
                    'heso02' => 'QL Hệ số 0.2',
                    'duyetthemgio' => 'Duyệt thêm giờ',
                    'duyetchamcong' => 'Duyệt chấm công',
                )),
            'tochuccanbo' => array('name' => 'Tổ chức cán bộ', 'sub' => array(
                    'employees' => 'QL Cán bộ',
                    'capnhatthongtin' => 'QL Yêu cầu cập nhật thông tin',
                    'duyetphanloai' => 'Duyệt phân loại cán bộ',
                    'duyetnghiphep' => 'Duyệt nghỉ phép',
                    'yckhenthuong' => 'QL Yêu cầu khen thưởng',
                    'yckyluat' => 'QL Yêu cầu kỷ luật/khiển trách',
                    'khenthuong' => 'QL Khen thưởng',
                    'kyluat' => 'QL kỷ luật/khiển trách',                    
                    'bacluong' => 'QL Bậc lương'                    
                )),
            'danhsach' => array('name' => 'Danh sách', 'sub' => array(
                    'phongban' => 'Lọc theo phòng ban',
                    'chucvu' => 'Lọc theo chức vụ',
                    'bangcap' => 'Lọc theo bằng cấp',
                    'hocham' => 'Lọc theo học hàm',
                    'tinhhuyen' => 'Lọc theo tỉnh',
                    'dantoc' => 'Lọc theo dân tộc',
                    'ngachcongchuc' => 'Lọc theo ngạch công chức',
                    'chungchi' => 'Lọc theo chứng chỉ'
                ))
        );

        require_once (BLOCK_PATH . '/BlkTopMenu/' . TEMPLATE_USED . '/default.php');
    }

}
