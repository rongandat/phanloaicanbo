<?php
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
        'canhan' => 'Thông tin cá nhân',
        'capnhatthongtin' => 'Cập nhật thông tin',
        'xinnghiphep' => 'Xin nghỉ phép',
        'chamcong' => 'Chấm công',
        'khaibaothemgio' => 'Khai báo thêm giờ',
        'thongkethang' => 'Thống kê tháng',
        'danhgiaphanloai' => 'Đánh giá phân loại',
        'doimatkhau' => 'Đổi mật khẩu'
    )),
    
    'donvi' => array('name' => 'Đơn vị', 'sub' => array()),
    'tochuccanbo' => array('name' => 'Tổ chức cán bộ', 'sub' => array(
            'employees' => 'QL Cán bộ'
    )),
    'thongke' => array('name' => 'Thống kê', 'sub' => array()),
    'inluong' => array('name' => 'In lương', 'sub' => array()),
    'danhsach' => array('name' => 'Danh sách', 'sub' => array())
);
?>


<div class="navbar main-content-menu">   
    <ul class="nav">
        <?php
        foreach ($list_menu as $menu_key => $menu_data) {
            if (sizeof($menu_data['sub'])) {
                echo '<li ' . ($menu_key == $module_name ? 'class="active dropdown"' : 'class="dropdown"') . '><a href="' . $view->baseUrl($menu_key) . '" id="' . $menu_key . '"  class="dropdown-toggle" role="button" data-toggle="dropdown">' . $menu_data['name'] . ' <b class="caret"></b></a>
                <ul id="' . $menu_key . '" class="dropdown-menu" aria-labelledby="' . $menu_key . '">';
                foreach ($menu_data['sub'] as $sub_key => $sub_name) {
                    echo '<li><a href="' . $view->baseUrl($menu_key . '/' . $sub_key) . '">' . $sub_name . '</a></li>';
                }
                echo '</ul>                
            </li>';
            } else {
                echo '<li ' . ($menu_key == $module_name ? 'class="active dropdown"' : 'class="dropdown"') . '><a href="' . $view->baseUrl($menu_key) . '">' . $menu_data['name'] . '</a></li>';
            }
        }
        ?>        
    </ul>
</div>