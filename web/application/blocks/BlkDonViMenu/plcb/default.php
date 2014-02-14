<ul class="nav nav-list bs-docs-sidenav">
    <?php
    foreach ($list_menu as $menu_key => $menu_name) {
        echo '<li ' . ($menu_key == $controller_name ? 'class="active"' : '') . '><a href="' . $view->baseUrl('donvi/'.$menu_key) . '"><i class="icon-chevron-right"></i>' . $menu_name . '</a></li>';
    }
    ?>

</ul>