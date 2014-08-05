<?php

class Donvi_ThanhvienController extends Zend_Controller_Action {

    protected $_arrParam;
    protected $_page = 1;
    protected $_kw = '';
    protected $_actionMain;

    public function init() {
        $auth = Zend_Auth::getInstance();
        $identity = $auth->getIdentity();

        //kiem tra permission
        $check_permission = $this->_helper->global->checkPermission($identity->group_id, '3001');
        if (!$check_permission) {
            $this->_redirect('index/permission/');
            exit();
        }
        $this->_arrParam = $this->_request->getParams();
        $this->_kw = $this->_arrParam['kw'];
        $this->_arrParam['page'] = $this->_request->getParam('page', 1);
        if ($this->_arrParam['page'] == '' || $this->_arrParam['page'] <= 0) {
            $this->_arrParam['page'] = 1;
        }
        $this->_page = $this->_arrParam['page'];
        $this->view->arrParam = $this->_arrParam;
    }

    public function indexAction() {
        $translate = Zend_Registry::get('Zend_Translate');
        $this->view->title = 'Danh sách thành viên - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => 'donvi/layout',
            'layoutPath' => $layoutPath);
        Zend_Layout::startMvc($option);

        $auth = Zend_Auth::getInstance();
        $identity = $auth->getIdentity();
        $em_id = $identity->em_id;

        $emModel = new Front_Model_Employees();
        $phongbanModel = new Front_Model_Phongban();
        $my_info = $emModel->fetchRow('em_id=' . $em_id . ' and em_status=1');

        $phong_ban_id = $list_phongban = $phong_ban = Array();
        if ($my_info) {
            $phong_ban_id[] = $my_info->em_phong_ban;
            $list_phongban = $phongbanModel->fetchDataStatus($my_info->em_phong_ban, $phong_ban);
        }

        if (sizeof($list_phongban)) {
            foreach ($list_phongban as $phong_ban_info) {
                $phong_ban_id[] = $phong_ban_info->pb_parent;
            }
        }
        //$phong_ban_id = implode(',', $phong_ban_id);
        $list_nhan_vien = $emModel->getListNhanVienTheoChucVu($phong_ban_id);
        $this->view->list_nhan_vien = $list_nhan_vien;
    }

    function jqkhenthuongAction() {
        $this->_helper->layout()->disableLayout();
        $khenthuongModel = new Front_Model_KhenThuong();
        if ($this->_request->isPost()) {
            $data = array();
            $auth = Zend_Auth::getInstance();
            $identity = $auth->getIdentity();
            $from_id = $identity->em_id;

            $em_id = $this->_arrParam['em_id'];
            $kt_date_day = $this->_arrParam['kt_date_day'];
            $kt_date_month = $this->_arrParam['kt_date_month'];
            $kt_date_year = $this->_arrParam['kt_date_year'];
            $kt_ly_do = trim($this->_arrParam['kt_ly_do']);
            $kt_chi_tiet = trim($this->_arrParam['kt_chi_tiet']);
            $kt_money = trim($this->_arrParam['kt_money']);
            $current_time = new Zend_Db_Expr('NOW()');

            if (!is_numeric($kt_money)) {
                $kt_money = 0;
            }
            $date_khen_thuong = date_create($kt_date_year . '-' . $kt_date_month . '-' . $kt_date_day);

            $data['kt_don_vi'] = $from_id;
            $data['kt_can_bo_to_chuc'] = 0;
            $data['kt_status'] = 0;
            $data['kt_em_id'] = $em_id;
            $data['kt_date'] = date_format($date_khen_thuong, "Y-m-d H:iP");
            $data['kt_ly_do'] = $kt_ly_do;
            $data['kt_chi_tiet'] = $kt_chi_tiet;
            $data['kt_money'] = $kt_money;
            $data['kt_date_added'] = $current_time;
            $data['kt_date_modified'] = $current_time;
            $success_message = $khenthuongModel->insert($data);

            /* $thongbao_model = new Front_Model_ThongBao();

              $data = array();
              $data['tb_from'] = 0;
              $data['tb_to'] = $em_id;
              $data['tb_tieu_de'] = '[Khen Thưởng] ' . $kt_ly_do;
              $data['tb_noi_dung'] = $kt_chi_tiet;
              $data['tb_status'] = 0;
              $data['tb_date_added'] = $current_time;
              $data['tb_date_modified'] = $current_time;
              $thongbao_model->insert($data); */

            $this->view->success_message = $success_message;
        }
    }

    function jqkyluatAction() {
        $this->_helper->layout()->disableLayout();
        $kyluatModel = new Front_Model_KyLuat();
        if ($this->_request->isPost()) {
            $data = array();
            $auth = Zend_Auth::getInstance();
            $identity = $auth->getIdentity();
            $from_id = $identity->em_id;

            $em_id = $this->_arrParam['em_id'];
            $kl_date_day = $this->_arrParam['kl_date_day'];
            $kl_date_month = $this->_arrParam['kl_date_month'];
            $kl_date_year = $this->_arrParam['kl_date_year'];
            $kl_ly_do = trim($this->_arrParam['kl_ly_do']);
            $kl_money = trim($this->_arrParam['kl_money']);
            $kl_chi_tiet = trim($this->_arrParam['kl_chi_tiet']);
            $current_time = new Zend_Db_Expr('NOW()');
            $date_ky_luat = date_create($kl_date_year . '-' . $kl_date_month . '-' . $kl_date_day);
            if (!is_numeric($kl_money)) {
                $kl_money = 0;
            }
            
            $data['kl_don_vi'] = $from_id;
            $data['kl_can_bo_to_chuc'] = 0;
            $data['kl_status'] = 0;
            $data['kl_em_id'] = $em_id;
            $data['kl_money'] = $kl_money;
            $data['kl_date'] = date_format($date_ky_luat, "Y-m-d H:iP");
            $data['kl_ly_do'] = $kl_ly_do;
            $data['kl_chi_tiet'] = $kl_chi_tiet;
            $data['kl_date_added'] = $current_time;
            $data['kl_date_modified'] = $current_time;
            $success_message = $kyluatModel->insert($data);

            /* $thongbao_model = new Front_Model_ThongBao();
              $data = array();
              $data['tb_from'] = 0;
              $data['tb_to'] = $em_id;
              $data['tb_tieu_de'] = '[Kỷ luật/khiển trách] ' . $kl_ly_do;
              $data['tb_noi_dung'] = $kl_chi_tiet;
              $data['tb_status'] = 0;
              $data['tb_date_added'] = $current_time;
              $data['tb_date_modified'] = $current_time;
              $thongbao_model->insert($data);
             */

            $this->view->success_message = $success_message;
        }
    }

}