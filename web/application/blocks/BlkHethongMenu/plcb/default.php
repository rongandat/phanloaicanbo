<?php
$list_menu = array(
    'front' => 'Trang chủ',
    'index' => 'Hệ thống',
    'canhan' => 'Cá nhân',
    'donvi' => 'Đơn vị',
    'tochuccanbo' => 'Tổ chức cán bộ',
    'thongke' => 'Thống kê',
    'inluong' => 'In lương',
    'danhsach' => 'Danh sách'
);
?>

<ul class="nav nav-list bs-docs-sidenav">
    <?php
    foreach ($list_menu as $menu_key => $menu_name) {
        echo '<li ' . ($menu_key == $controller_name ? 'class="active"' : '') . '><a href="' . $view->baseUrl('hethong/'.$menu_key) . '"><i class="icon-chevron-right"></i>' . $menu_name . '</a></li>';
    }
    ?>

</ul>