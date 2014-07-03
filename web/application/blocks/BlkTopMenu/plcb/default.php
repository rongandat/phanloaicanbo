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

                if ($menu_key == 'taivu') {
                    echo '<li><a href="' . $view->baseUrl('taivu/tinhluong/auto05/') . '">Tính lương 0.5</a></li>';
                    echo '<li><a href="' . $view->baseUrl('taivu/tinhluong/auto03/') . '">Tính lương 0.3</a></li>';
                    echo '<li><a href="' . $view->baseUrl('taivu/tinhluong/auto02/') . '">Tính lương 0.2</a></li>';
                    echo '<li><a href="' . $view->baseUrl('taivu/inluong/intheophong/') . '">In bảng lương 0.5</a></li>';
                    echo '<li><a href="' . $view->baseUrl('taivu/inluong/heso03/') . '">In bảng lương 0.3</a></li>';
                    echo '<li><a href="' . $view->baseUrl('taivu/inluong/heso02/') . '">In bảng lương 0.2</a></li>';
                }
                if ($menu_key == 'canhan') {
                    echo '<li><a href="' . $view->baseUrl('canhan/inluong/heso03/') . '">Xem bảng lương 0.3</a></li>';
                    echo '<li><a href="' . $view->baseUrl('canhan/inluong/heso02/') . '">Xem bảng lương 0.2</a></li>';
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