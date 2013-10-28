<?php
$fullname = trim($employeeInfo->ho);
if (trim($employeeInfo->ten_dem))
    $fullname .= ' ' . trim($employeeInfo->ten_dem);
$fullname .= ' ' . trim($employeeInfo->ten);

$date_last_login = '00:00:0000 00:00:00';
if ($identity->last_login_data) {
    $date_last_login = date('d-m-Y h:i:s', $identity->last_login_data['login_date']);
}
?>

<div class="main-header-right">
    Xin chào: <?php echo trim($fullname); ?><br>
    Đăng nhập lần cuối: <?php echo $date_last_login; ?><br>
    <a href="<?php echo $view->baseUrl('employee/changepass')?>">Đổi mật khẩu</a> - <a href="<?php echo $view->baseUrl('auth/logout')?>">Thoát ra</a>                        
</div>