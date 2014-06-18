<?php

class Tochuccanbo_YckyluatController extends Zend_Controller_Action {

    protected $_arrParam;
    protected $_page = 1;
    protected $_kw = '';
    protected $_actionMain;

    public function init() {
        $auth = Zend_Auth::getInstance();
        $identity = $auth->getIdentity();

        //kiem tra permission
        $check_permission = $this->_helper->global->checkPermission($identity->group_id, '4008');
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
        $this->view->title = 'Duyệt đề xuất kỷ luật/khiển trách - ' . $translate->_('TEXT_DEFAULT_TITLE');
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

        $kyluatModel = new Front_Model_KyLuat();
        $list_ky_luat = $kyluatModel->fetchByDatePTCCB("$nam-$thang-01 00:00:00", "$nam-$thang-31 23:59:59");
        $this->view->list_ky_luat = $list_ky_luat;
        $this->view->thang = $thang;
        $this->view->nam = $nam;
    }

    function jqkyluatAction() {
        $this->_helper->layout()->disableLayout();
        $kyluatModel = new Front_Model_KyLuat();
        if ($this->_request->isPost()) {
            $data = array();
            $auth = Zend_Auth::getInstance();
            $identity = $auth->getIdentity();
            $from_id = $identity->em_id;

            $kl_id = $this->_arrParam['kl_id'];
            $kl_date_day = $this->_arrParam['kl_date_day'];
            $kl_date_month = $this->_arrParam['kl_date_month'];
            $kl_date_year = $this->_arrParam['kl_date_year'];
            $kl_ly_do = trim($this->_arrParam['kl_ly_do']);
            $kl_chi_tiet = trim($this->_arrParam['kl_chi_tiet']);
            $kl_money = trim($this->_arrParam['kl_money']);
            $current_time = new Zend_Db_Expr('NOW()');

            if (!is_numeric($kl_money)) {
                $kl_money = 0;
            }
            $date_khen_thuong = date_create($kl_date_year . '-' . $kl_date_month . '-' . $kl_date_day);
            $data['kl_can_bo_to_chuc'] = $from_id;
            $data['kl_status'] = 1;
            $data['kl_ptccb_viewed'] = 1;
            $data['kl_date'] = date_format($date_khen_thuong, "Y-m-d H:iP");
            $data['kl_ly_do'] = $kl_ly_do;
            $data['kl_chi_tiet'] = $kl_chi_tiet;
            $data['kl_money'] = $kl_money;
            $data['kl_date_modified'] = $current_time;
            $success_message = $kyluatModel->update($data, "kl_id=$kl_id");
            if ($success_message) {
                $thongbao_model = new Front_Model_ThongBao();
                $row_content = $kyluatModel->fetchRow("kl_id=$kl_id");
                $data = array();
                $data['tb_from'] = 0;
                $data['tb_to'] = $row_content->kl_em_id;
                $data['tb_tieu_de'] = '[Kỷ luật/Khiển trách] ' . $kl_ly_do;
                $data['tb_noi_dung'] = $kl_chi_tiet;
                $data['tb_status'] = 0;
                $data['tb_date_added'] = $current_time;
                $data['tb_date_modified'] = $current_time;
                $thongbao_model->insert($data);
            }


            $this->view->success_message = $success_message;
        }
    }

    public function jqupdatestatusAction() {
        $this->_helper->layout()->disableLayout();
        $process_status = 0;
        if ($this->_request->isPost()) {
            $auth = Zend_Auth::getInstance();
            $identity = $auth->getIdentity();
            $from_id = $identity->em_id;

            $kl_id = $this->_arrParam['kl_id'];
            $kl_status = $this->_arrParam['kl_status'];
            if ($kl_status > 1) {
                $kl_status = 1;
            }
            if ($kl_status < 0) {
                $kl_status = 0;
            }
            $process_status = 1;
            $current_time = new Zend_Db_Expr('NOW()');
            $kyluatModel = new Front_Model_KyLuat();
            $process_status = $kyluatModel->update(array('kl_can_bo_to_chuc' => $from_id, 'kl_ptccb_viewed' => 1, 'kl_status' => $kl_status, 'kl_date_modified' => $current_time), "kl_id=$kl_id");
            if ($process_status) {
                if ($kl_status) {
                    $thongbao_model = new Front_Model_ThongBao();
                    $row_content = $kyluatModel->fetchRow("kl_id= $kl_id");
                    $data = array();
                    $data['tb_from'] = 0;
                    $data['tb_to'] = $row_content->kl_em_id;
                    $data['tb_tieu_de'] = '[Kỷ luật/Khiển trách] ' . $row_content->kl_ly_do;
                    $data['tb_noi_dung'] = $row_content->kl_chi_tiet;
                    $data['tb_status'] = 0;
                    $data['tb_date_added'] = $current_time;
                    $data['tb_date_modified'] = $current_time;
                    $thongbao_model->insert($data);
                }
            }
        }
        $this->view->process_status = $process_status;
    }

    public function updatestatusAction() {
        $this->_helper->layout()->disableLayout();
        $process_status = 0;
        if ($this->_request->isPost()) {
            $auth = Zend_Auth::getInstance();
            $identity = $auth->getIdentity();
            $from_id = $identity->em_id;

            $thang = $this->_request->getParam('thang', 0);
            $nam = $this->_request->getParam('nam', 0);

            $kl_status = $this->_request->getParam('status', 0);
            if ($kl_status > 1) {
                $kl_status = 1;
            }
            if ($kl_status < 0) {
                $kl_status = 0;
            }
            $process_status = 1;
            $current_time = new Zend_Db_Expr('NOW()');
            $kyluatModel = new Front_Model_KyLuat();
            $item = $this->getRequest()->getPost('cid');
            foreach ($item as $k => $v) {
                $process_status = $kyluatModel->update(array('kl_can_bo_to_chuc' => $from_id, 'kl_ptccb_viewed' => 1, 'kl_status' => $kl_status, 'kl_date_modified' => $current_time), "kl_id=$v");
                if ($process_status) {
                    if ($kl_status) {
                        $thongbao_model = new Front_Model_ThongBao();
                        $row_content = $kyluatModel->fetchRow("kl_id=$v");
                        $data = array();
                        $data['tb_from'] = 0;
                        $data['tb_to'] = $row_content->kl_em_id;
                        $data['tb_tieu_de'] = '[Kỷ luật/Khiển trách] ' . $row_content->kl_ly_do;
                        $data['tb_noi_dung'] = $row_content->kl_chi_tiet;
                        $data['tb_status'] = 0;
                        $data['tb_date_added'] = $current_time;
                        $data['tb_date_modified'] = $current_time;
                        $thongbao_model->insert($data);
                    }
                }
            }
            $this->_redirect('tochuccanbo/yckyluat/index/thang/' . $thang . '/nam/' . $nam);
        }
    }

}