<?php
$list_menu = array(
    'front' => 'Trang chủ',
    'hethong' => 'Hệ thống',
    'canhan' => 'Cá nhân',
    'donvi' => 'Đơn vị',
    'tochuccanbo' => 'Tổ chức cán bộ',
    'thongke' => 'Thống kê',
    'inluong' => 'In lương',
    'danhsach' => 'Danh sách'
);
?>


<div class="navbar main-content-menu">   
    <ul class="nav">
        <?php
        foreach ($list_menu as $menu_key => $menu_name) {
            echo '<li ' . ($menu_key == $module_name ? 'class="active"' : '') . '><a href="' . $view->baseUrl($menu_key) . '">' . $menu_name . '</a></li>';
        }
        ?>        
    </ul>
</div>