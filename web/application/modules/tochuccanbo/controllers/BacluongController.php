<?php

class Tochuccanbo_BacluongController extends Zend_Controller_Action {

    protected $_arrParam;
    protected $_page = 1;
    protected $_kw = '';
    protected $_actionMain;

    public function init() {
        $auth = Zend_Auth::getInstance();
        $identity = $auth->getIdentity();

        //kiem tra permission
        $check_permission = $this->_helper->global->checkPermission($identity->group_id, '4012');
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
        $this->view->title = 'Quản lý bậc lương - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => '1_column/layout',
            'layoutPath' => $layoutPath);
        Zend_Layout::startMvc($option);

        $bacluongModel = new Front_Model_BacLuong();
        $list_bacluong = $bacluongModel->fetchAll();
        $this->view->list_bac_luong = $list_bacluong;
    }

    public function jqupdatestatusAction() {
        $this->_helper->layout()->disableLayout();
        $process_status = 0;
        if ($this->_request->isPost()) {
            $bl_id = $this->_arrParam['id'];
            $bl_status = $this->_arrParam['status'];
            if ($bl_status > 1) {
                $bl_status = 1;
            }
            if ($bl_status < 0) {
                $bl_status = 0;
            }
            $current_time = new Zend_Db_Expr('NOW()');
            $bacluongModel = new Front_Model_BacLuong();
            $process_status = $bacluongModel->update(array('bl_status' => $bl_status, 'bl_date_modified' => $current_time), "bl_id=$bl_id");
        }
    }

    public function updatestatusAction() {
        $this->_helper->layout()->disableLayout();
        $process_status = 0;
        if ($this->_request->isPost()) {
            $bl_id = $this->_arrParam['bl_id'];
            $bl_status = $this->_arrParam['bl_status'];
            if ($bl_status > 1) {
                $bl_status = 1;
            }
            if ($bl_status < 0) {
                $bl_status = 0;
            }
            $current_time = new Zend_Db_Expr('NOW()');
            $khenthuongModel = new Front_Model_KhenThuong();
            $item = $this->getRequest()->getPost('cid');
            foreach ($item as $k => $v) {
                $process_status = $khenthuongModel->update(array('bl_can_bo_to_chuc' => $from_id, 'bl_ptccb_viewed' => 1, 'bl_status' => $bl_status, 'bl_date_modified' => $current_time), "bl_id=$v");
                if ($process_status) {
                    if ($bl_status) {
                        $thongbao_model = new Front_Model_ThongBao();
                        $row_content = $khenthuongModel->fetchRow(array('bl_id' => $v));
                        $data = array();
                        $data['tb_from'] = 0;
                        $data['tb_to'] = $row_content->bl_em_id;
                        $data['tb_tieu_de'] = '[Khen Thưởng] ' . $row_content->bl_ly_do;
                        $data['tb_noi_dung'] = $row_content->bl_chi_tiet;
                        $data['tb_status'] = 0;
                        $data['tb_date_added'] = $current_time;
                        $data['tb_date_modified'] = $current_time;
                        $thongbao_model->insert($data);
                    }
                }
            }
            $this->_redirect('tochuccanbo/khenthuong/index/thang/' . $thang . '/nam/' . $nam);
        }
    }

}