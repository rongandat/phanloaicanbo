<?php
$fullname = trim($this->_employee_info->em_ho);
$fullname .= ' ' . trim($this->_employee_info->em_ten);

$date_last_login = '00:00:0000 00:00:00';
if ($this->_identity->last_login_data) {
    $date_last_login = date('d-m-Y h:i:s', $this->_identity->last_login_data['login_date']);
}
?>            

<h5>Thông tin cá nhân</h5>
<div class="main-content-box">                     
    Họ tên:  <em><?php echo trim($fullname); ?></em><br>
    Ngày sinh: <em><?php echo date('d-m-Y', strtotime($this->_employee_info->em_ngay_sinh)); ?></em><br>
    Chức vụ: <em><?php echo $view->viewGetChucVuName($this->_employee_info->em_chuc_vu); ?></em><br>
    Phòng ban: <em><?php echo $view->viewGetPhongBanName($this->_employee_info->em_phong_ban); ?></em><br>
    Địa chỉ: <em><?php echo $this->_employee_info->em_dia_chi . ', ' . $view->viewGetHuyenName($this->_employee_info->em_dia_chi_huyen) . ', ' . $view->viewGetTinhName($this->_employee_info->em_dia_chi_tinh); ?></em><br>                      
    <abbr title="Phone">P:</abbr><em><?php echo $this->_employee_info->em_home_phone . ' - ' . $this->_employee_info->em_phone; ?></em>
</div>