<?php

class Tochuccanbo_YckhenthuongController extends Zend_Controller_Action {

    protected $_arrParam;
    protected $_page = 1;
    protected $_kw = '';
    protected $_actionMain;

    public function init() {
        $auth = Zend_Auth::getInstance();
        $identity = $auth->getIdentity();

        //kiem tra permission
        $check_permission = $this->_helper->global->checkPermission($identity->group_id, '1001');
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
        $this->view->title = 'Duyệt đề xuất khen thưởng - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => '1_column/layout',
            'layoutPath' => $layoutPath);
        Zend_Layout::startMvc($option);

        $auth = Zend_Auth::getInstance();
        $identity = $auth->getIdentity();
        $em_id = $identity->em_id;

        $date = time();
        $thang = $this->_getParam('thang', date('m', $date));
        $nam = $this->_getParam('nam', date('Y', $date));

        $khenthuongModel = new Front_Model_KhenThuong();
        $list_khen_thuong = $khenthuongModel->fetchByDatePTCCB("$nam-$thang-01 00:00:00", "$nam-$thang-31 23:59:59");
        $this->view->list_khen_thuong = $list_khen_thuong;
        $this->view->thang = $thang;
        $this->view->nam = $nam;
    }

    public function jqupdatestatusAction() {
        $this->_helper->layout()->disableLayout();
        $new_status = 'Đã duyệt';
        $process_status = 0;
        if ($this->_request->isPost()) {
            $xnp_id = $this->_arrParam['xnp_id'];
            $xnp_status = $this->_arrParam['xnp_status'];
            if ($xnp_status > 1) {
                $xnp_status = 1;
            }
            if ($xnp_status < 0) {
                $xnp_status = -1;
            }
            $process_status = 1;
            $xnpModel = new Front_Model_XinNghiPhep();
            $process_status = $xnpModel->update(array('xnp_don_vi_status' => $xnp_status), "xnp_id=$xnp_id and xnp_ptccb_status<0");
            if ($process_status) {
                if (!$xnp_status) {
                    $new_status = 'Không duyệt';
                }
            }
        }
        $this->view->new_status = $new_status;
        $this->view->process_status = $process_status;
    }

    function jqkhenthuongAction() {
        $this->_helper->layout()->disableLayout();
        $khenthuongModel = new Front_Model_KhenThuong();
        if ($this->_request->isPost()) {
            $data = array();
            $auth = Zend_Auth::getInstance();
            $identity = $auth->getIdentity();
            $from_id = $identity->em_id;

            $kt_id = $this->_arrParam['kt_id'];
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
            $data['kt_can_bo_to_chuc'] = $from_id;
            $data['kt_status'] = 1;
            $data['kt_ptccb_viewed'] = 1;
            $data['kt_date'] = date_format($date_khen_thuong, "Y-m-d H:iP");
            $data['kt_ly_do'] = $kt_ly_do;
            $data['kt_chi_tiet'] = $kt_chi_tiet;
            $data['kt_money'] = $kt_money;
            $data['kt_date_modified'] = $current_time;
            $success_message = $khenthuongModel->update($data, "kt_id=$kt_id");
            if ($success_message) {
                $thongbao_model = new Front_Model_ThongBao();
                $row_content = $khenthuongModel->fetchRow(array('kt_id' => $kt_id));
                $data = array();
                $data['tb_from'] = 0;
                $data['tb_to'] = $row_content->kt_em_id;
                $data['tb_tieu_de'] = '[Khen Thưởng] ' . $kt_ly_do;
                $data['tb_noi_dung'] = $kt_chi_tiet;
                $data['tb_status'] = 0;
                $data['tb_date_added'] = $current_time;
                $data['tb_date_modified'] = $current_time;
                $thongbao_model->insert($data);
            }


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

    public function jqktupdatestatusAction() {
        $this->_helper->layout()->disableLayout();
        $process_status = 0;
        if ($this->_request->isPost()) {
            $auth = Zend_Auth::getInstance();
            $identity = $auth->getIdentity();
            $from_id = $identity->em_id;

            $kt_id = $this->_arrParam['kt_id'];
            $kt_status = $this->_arrParam['kt_status'];
            if ($kt_status > 1) {
                $kt_status = 1;
            }
            if ($kt_status < 0) {
                $kt_status = 0;
            }
            $process_status = 1;
            $current_time = new Zend_Db_Expr('NOW()');
            $khenthuongModel = new Front_Model_KhenThuong();
            $process_status = $khenthuongModel->update(array('kl_can_bo_to_chuc' => $from_id, 'kt_status' => $kt_status, 'kl_date_modified' => $current_time), "kt_id=$kt_id");
            if ($process_status) {
                if ($kt_status) {
                    $thongbao_model = new Front_Model_ThongBao();
                    $row_content = $khenthuongModel->fetchRow(array('kt_id' => $kt_id));
                    $data = array();
                    $data['tb_from'] = 0;
                    $data['tb_to'] = $row_content->kt_em_id;
                    $data['tb_tieu_de'] = '[Khen Thưởng] ' . $row_content->kt_ly_do;
                    $data['tb_noi_dung'] = $row_content->kt_chi_tiet;
                    $data['tb_status'] = 0;
                    $data['tb_date_added'] = $current_time;
                    $data['tb_date_modified'] = $current_time;
                    $thongbao_model->insert($data);
                }
            }
        }
        $this->view->process_status = $process_status;
    }

}