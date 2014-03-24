<?php

class Hethong_QuanlynhanuocController extends Zend_Controller_Action {

    protected $_arrParam;
    protected $_page = 1;
    protected $_kw = '';
    protected $_actionMain;

    public function init() {
        $auth = Zend_Auth::getInstance();
        $identity = $auth->getIdentity();

        //kiem tra permission
        $check_permission = $this->_helper->global->checkPermission($identity->group_id, '1017');
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
        $this->view->title = 'Quản lý nhà nước - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => 'hethong/layout',
            'layoutPath' => $layoutPath);

        Zend_Layout::startMvc($option);

        $quanlynhanuocModel = new Front_Model_QuanLyNhaNuoc();
        $list_quanlynhanuoc = $quanlynhanuocModel->fetchData(array(), 'qlnn_order ASC');

        $paginator = Zend_Paginator::factory($list_quanlynhanuoc);
        $paginator->setItemCountPerPage(NUM_PER_PAGE);
        $paginator->setCurrentPageNumber($this->_page);
        $this->view->page = $this->_page;
        $this->view->paginator = $paginator;
    }

    public function searchAction() {
        $translate = Zend_Registry::get('Zend_Translate');
        $this->view->title = 'Quản lý nhà nước - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => 'hethong/layout',
            'layoutPath' => $layoutPath);
        Zend_Layout::startMvc($option);

        $quanlynhanuocModel = new Front_Model_QuanLyNhaNuoc();
        if ($this->_kw)
            $list_quanlynhanuoc = $quanlynhanuocModel->fetchData(array('keyword' => $this->_kw), 'qlnn_order ASC');
        else {
            $this->_redirect('hethong/quanlynhanuoc/');
            $list_quanlynhanuoc = $quanlynhanuocModel->fetchData(array(), 'qlnn_order ASC');
        }

        $paginator = Zend_Paginator::factory($list_quanlynhanuoc);
        $paginator->setItemCountPerPage(NUM_PER_PAGE);
        $paginator->setCurrentPageNumber($this->_page);
        $this->view->page = $this->_page;
        $this->view->paginator = $paginator;
    }

    public function addAction() {

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => 'hethong/layout',
            'layoutPath' => $layoutPath);

        Zend_Layout::startMvc($option);
        $translate = Zend_Registry::get('Zend_Translate');
        $this->view->title = 'Quản lý nhà nước - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $quanlynhanuocModel = new Front_Model_QuanLyNhaNuoc();
        $error_message = array();
        $success_message = '';
        if ($this->_request->isPost()) {
            $qlnn_name = trim($this->_arrParam['qlnn_name']);
            $qlnn_order = trim($this->_arrParam['qlnn_order']);
            $qlnn_status = $this->_arrParam['qlnn_status'];

            $validator_length = new Zend_Validate_StringLength(array('min' => 2, 'max' => 100));
            if (!is_numeric($qlnn_order)) {
                $qlnn_order = 0;
            }

            //kiem tra dữ liệu
            if (!$validator_length->isValid($qlnn_name)) {
                $error_message[] = 'Tên phải bằng hoặc hơn 2 ký tự và nhỏ hơn hoặc bằng 100 ký tự.';
            }

            if (!sizeof($error_message)) {
                $current_time = new Zend_Db_Expr('NOW()');
                $quanlynhanuocModel->insert(array(
                    'qlnn_name' => $qlnn_name,
                    'qlnn_status' => $qlnn_status,
                    'qlnn_order' => $qlnn_order,
                    'qlnn_date_added' => $current_time,
                    'qlnn_date_modified' => $current_time
                        )
                );
                $success_message = 'Đã thêm mới thành công.';
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
        $this->view->title = 'Quản lý nhà nước - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $id = $this->_getParam('id', 0);

        $quanlynhanuocModel = new Front_Model_QuanLyNhaNuoc();
        $error_message = array();
        $success_message = '';

        $qlnn_info = $quanlynhanuocModel->fetchRow('qlnn_id=' . $id);
        if (!$qlnn_info) {
            $error_message[] = 'Không tìm thấy thông tin.';
        }

        if ($this->_request->isPost()) {
            $qlnn_name = trim($this->_arrParam['qlnn_name']);
            $qlnn_order = trim($this->_arrParam['qlnn_order']);
            $qlnn_status = $this->_arrParam['qlnn_status'];

            if (!is_numeric($qlnn_order)) {
                $qlnn_order = 0;
            }
            
            $validator_length = new Zend_Validate_StringLength(array('min' => 4, 'max' => 100));

            //kiem tra dữ liệu
            if (!$validator_length->isValid($qlnn_name)) {
                $error_message[] = 'Tên phải bằng hoặc hơn 4 ký tự và nhỏ hơn hoặc bằng 100 ký tự.';
            }

            if (!sizeof($error_message)) {
                $current_time = new Zend_Db_Expr('NOW()');
                $quanlynhanuocModel->update(array(
                    'qlnn_name' => $qlnn_name,
                    'qlnn_status' => $qlnn_status,
                    'qlnn_order' => $qlnn_order,
                    'qlnn_date_modified' => $current_time
                        ), 'qlnn_id=' . $id
                );

                $qlnn_info->qlnn_name = $qlnn_name;
                $qlnn_info->qlnn_status = $qlnn_status;
                $qlnn_info->qlnn_order = $qlnn_order;

                $success_message = 'Đã cập nhật thông tin thành công.';
            }
        }


        $this->view->qlnn_info = $qlnn_info;
        $this->view->success_message = $success_message;
        $this->view->error_message = $error_message;
    }

    public function deleteAction() {

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => 'hethong/layout',
            'layoutPath' => $layoutPath);

        Zend_Layout::startMvc($option);
        $translate = Zend_Registry::get('Zend_Translate');
        $this->view->title = 'Quản lý nhà nước - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $id = $this->_getParam('id', 0);

        $quanlynhanuocModel = new Front_Model_QuanLyNhaNuoc();
        $error_message = array();

        $qlnn_info = $quanlynhanuocModel->fetchRow('qlnn_id=' . $id);
        if (!$qlnn_info) {
            $error_message[] = 'Không tìm thấy thông tin.';
        }

        if ($this->_request->isPost()) {
            $del = $this->getRequest()->getPost('del');
            if ($del == 'Yes') {
                $id = $this->getRequest()->getPost('id');
                $quanlynhanuocModel->delete('qlnn_id=' . $id);
            }
            $this->_redirect('hethong/quanlynhanuoc/index/page/' . $this->_page);
        }


        $this->view->qlnn_info = $qlnn_info;
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
        $quanlynhanuocModel = new Front_Model_QuanLyNhaNuoc();
        $quanlynhanuocModel->update(array('qlnn_status' => $type, 'qlnn_date_modified' => $current_time), 'qlnn_id=' . $id);
        $this->_redirect('hethong/quanlynhanuoc/index/page/' . $this->_page);
    }

    function deleteitemsAction() {
        $this->_helper->layout()->disableLayout();
        $quanlynhanuocModel = new Front_Model_QuanLyNhaNuoc();
        if ($this->_request->isPost()) {
            $item = $this->getRequest()->getPost('cid');
            foreach ($item as $k => $v) {
                $quanlynhanuocModel->delete('qlnn_id=' . $v);
            }
        }
        $this->_redirect('hethong/quanlynhanuoc/index/page/' . $this->_page);
    }

}