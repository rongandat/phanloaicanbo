<?php

class Hethong_NghileController extends Zend_Controller_Action {

    protected $_arrParam;
    protected $_page = 1;
    protected $_kw = '';
    protected $_actionMain;

    public function init() {
        $auth = Zend_Auth::getInstance();
        $identity = $auth->getIdentity();

        //kiem tra permission
        $check_permission = $this->_helper->global->checkPermission($identity->group_id, '1019');
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
        $this->view->title = 'Quản lý các ngày nghỉ lễ - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => 'hethong/layout',
            'layoutPath' => $layoutPath);

        Zend_Layout::startMvc($option);

        $date = new Zend_Date();
        $nam = $this->_getParam('nam', $date->toString('Y'));

        $nghileModel = new Front_Model_NghiLe();
        $list_ngay_nghi = $nghileModel->fetchByYear($nam);

        $paginator = Zend_Paginator::factory($list_ngay_nghi);
        $paginator->setItemCountPerPage(NUM_PER_PAGE);
        $paginator->setCurrentPageNumber($this->_page);
        $this->view->page = $this->_page;
        $this->view->paginator = $paginator;
        $this->view->nam = $nam;
    }

    public function addAction() {

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => 'hethong/layout',
            'layoutPath' => $layoutPath);

        Zend_Layout::startMvc($option);
        $translate = Zend_Registry::get('Zend_Translate');
        $this->view->title = 'Quản lý các ngày nghỉ lễ - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $nghileModel = new Front_Model_NghiLe();
        $error_message = array();
        $success_message = '';
        if ($this->_request->isPost()) {
            $nn_name = trim($this->_arrParam['nn_name']);
            $nn_status = $this->_arrParam['nn_status'];

            $ngay_bat_dau = $this->_arrParam['nn_tu_ngay'];
            $ngay_ket_thuc = $this->_arrParam['nn_den_ngay'];

            $validator_length = new Zend_Validate_StringLength(array('min' => 2, 'max' => 100));

            //kiem tra dữ liệu
            if (!$validator_length->isValid($nn_name)) {
                $error_message[] = 'Tên ngày nghỉ lễ phải bằng hoặc hơn 2 ký tự và nhỏ hơn hoặc bằng 100 ký tự.';
            }

            if (!$ngay_bat_dau) {
                $error_message[] = 'Ngày bắt đầu không được để trống.';
            }

            if (!$ngay_ket_thuc) {
                $error_message[] = 'Ngày kết thúc không được để trống.';
            }

            if (!sizeof($error_message)) {
                $ngay_bat_dau = str_replace('/', '-', $ngay_bat_dau);
                $ngay_bat_dau = date('Y-m-d', strtotime($ngay_bat_dau));

                $ngay_ket_thuc = str_replace('/', '-', $ngay_ket_thuc);
                $ngay_ket_thuc = date('Y-m-d', strtotime($ngay_ket_thuc));

                $nghileModel->insert(array(
                    'nn_name' => $nn_name,
                    'nn_status' => $nn_status,
                    'nn_tu_ngay' => $ngay_bat_dau,
                    'nn_den_ngay' => $ngay_ket_thuc
                        )
                );
                $success_message = 'Đã thêm ngày nghỉ lễ mới thành công.';
            }
        }
        $this->view->success_message = $success_message;
        $this->view->error_message = $error_message;
    }

    public function editAction() {

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => 'hethong/layout',
            'layoutPath' => $layoutPath);

        Zend_Layout::startMvc($option);
        $translate = Zend_Registry::get('Zend_Translate');
        $this->view->title = 'Quản lý các ngày nghỉ lễ - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $id = $this->_getParam('id', 0);

        $nghileModel = new Front_Model_NghiLe();
        $error_message = array();
        $success_message = '';

        $nghi_le_info = $nghileModel->fetchRow('nn_id=' . $id);
        if (!$nghi_le_info) {
            $error_message[] = 'Không tìm thấy thông tin.';
        }

        if ($this->_request->isPost()) {
            $nn_name = trim($this->_arrParam['nn_name']);
            $nn_status = $this->_arrParam['nn_status'];

            $ngay_bat_dau = $this->_arrParam['nn_tu_ngay'];
            $ngay_ket_thuc = $this->_arrParam['nn_den_ngay'];

            $validator_length = new Zend_Validate_StringLength(array('min' => 2, 'max' => 100));

            //kiem tra dữ liệu
            if (!$validator_length->isValid($nn_name)) {
                $error_message[] = 'Tên ngày nghỉ lễ phải bằng hoặc hơn 2 ký tự và nhỏ hơn hoặc bằng 100 ký tự.';
            }

            if (!$ngay_bat_dau) {
                $error_message[] = 'Ngày bắt đầu không được để trống.';
            }

            if (!$ngay_ket_thuc) {
                $error_message[] = 'Ngày kết thúc không được để trống.';
            }

            if (!sizeof($error_message)) {
                $ngay_bat_dau = str_replace('/', '-', $ngay_bat_dau);
                $ngay_bat_dau = date('Y-m-d', strtotime($ngay_bat_dau));

                $ngay_ket_thuc = str_replace('/', '-', $ngay_ket_thuc);
                $ngay_ket_thuc = date('Y-m-d', strtotime($ngay_ket_thuc));

                $nghileModel->update(array(
                    'nn_name' => $nn_name,
                    'nn_status' => $nn_status,
                    'nn_tu_ngay' => $ngay_bat_dau,
                    'nn_den_ngay' => $ngay_ket_thuc
                        ), 'nn_id=' . $id
                );

                $nghi_le_info = $nghileModel->fetchRow('nn_id=' . $id);
                $success_message = 'Đã cập nhật thông tin thành công.';
            }
        }


        $this->view->nn_info = $nghi_le_info;
        $this->view->success_message = $success_message;
        $this->view->error_message = $error_message;
    }

    public function deleteAction() {

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => 'hethong/layout',
            'layoutPath' => $layoutPath);

        Zend_Layout::startMvc($option);
        $translate = Zend_Registry::get('Zend_Translate');
        $this->view->title = 'Quản lý các ngày nghỉ lễ - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $id = $this->_getParam('id', 0);

        $nghileModel = new Front_Model_NghiLe();
        $error_message = array();

        $nn_info = $nghileModel->fetchRow('nn_id=' . $id);
        if (!$nn_info) {
            $error_message[] = 'Không tìm thấy thông tin.';
        }

        if ($this->_request->isPost()) {
            $del = $this->getRequest()->getPost('del');
            if ($del == 'Yes') {
                $id = $this->getRequest()->getPost('id');
                $nghileModel->delete('nn_id=' . $id);
            }
            $this->_redirect('hethong/nghile/index/page/' . $this->_page);
        }


        $this->view->nn_info = $nn_info;
        $this->view->error_message = $error_message;
    }

    function changestatusAction() {
        $this->_helper->layout()->disableLayout();
        $type = $this->_request->getParam('status', 1);
        $id = $this->_request->getParam('id', 0);
        if ($type > 0) {
            $type = 1;
        } else {
            $type = 0;
        }
        $current_time = new Zend_Db_Expr('NOW()');
        $nghileModel = new Front_Model_NghiLe();
        $nghileModel->update(array('nn_status' => $type), 'nn_id=' . $id);
        $this->_redirect('hethong/nghile/index/page/' . $this->_page);
    }

    function deleteitemsAction() {
        $this->_helper->layout()->disableLayout();
        $nghileModel = new Front_Model_NghiLe();
        if ($this->_request->isPost()) {
            $item = $this->getRequest()->getPost('cid');
            foreach ($item as $k => $v) {
                $nghileModel->delete('nn_id=' . $v);
            }
        }
        $this->_redirect('hethong/nghile/index/page/' . $this->_page);
    }

}