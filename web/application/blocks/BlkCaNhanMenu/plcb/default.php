<ul class="nav nav-list bs-docs-sidenav">
    <?php
    foreach ($list_menu as $menu_key => $menu_name) {
        echo '<li ' . ($menu_key == $controller_name ? 'class="active"' : '') . '><a href="' . $view->baseUrl('canhan/'.$menu_key) . '"><i class="icon-chevron-right"></i>' . $menu_name . '</a></li>';
    }
    echo '<li><a href="' . $view->baseUrl('tochuccanbo/inluong/index/id/' . $identity->em_id) . '"><i class="icon-chevron-right"></i> Xem bảng lương</a></li>';
    ?>

</ul>