<?php

class Hethong_ChucvudangController extends Zend_Controller_Action {

    protected $_arrParam;
    protected $_page = 1;
    protected $_kw = '';
    protected $_actionMain;

    public function init() {
        $auth = Zend_Auth::getInstance();
        $identity = $auth->getIdentity();

        //kiem tra permission
        $check_permission = $this->_helper->global->checkPermission($identity->group_id, '1012');
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
        $this->view->title = 'Quản lý chức vụ đảng - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => 'hethong/layout',
            'layoutPath' => $layoutPath);

        Zend_Layout::startMvc($option);

        $chucvuModel = new Front_Model_ChucVuDang();
        $list_chucvu = $chucvuModel->fetchData(array(), 'cvdang_order ASC');

        $paginator = Zend_Paginator::factory($list_chucvu);
        $paginator->setItemCountPerPage(NUM_PER_PAGE);
        $paginator->setCurrentPageNumber($this->_page);
        $this->view->page = $this->_page;
        $this->view->paginator = $paginator;
    }

    public function searchAction() {
        $translate = Zend_Registry::get('Zend_Translate');
        $this->view->title = 'Quản lý chức vụ đảng - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => 'hethong/layout',
            'layoutPath' => $layoutPath);
        Zend_Layout::startMvc($option);

        $chucvuModel = new Front_Model_ChucVuDang();
        if ($this->_kw)
            $list_chucvu = $chucvuModel->fetchData(array('keyword' => $this->_kw), 'cvdang_order ASC');
        else {
            $this->_redirect('hethong/chucvudang/');
            $list_chucvu = $chucvuModel->fetchData(array(), 'cvdang_order ASC');
        }

        $paginator = Zend_Paginator::factory($list_chucvu);
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
        $this->view->title = 'Quản lý chức vụ đảng - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $chucvuModel = new Front_Model_ChucVuDang();
        $error_message = array();
        $success_message = '';
        if ($this->_request->isPost()) {
            $cvdang_name = trim($this->_arrParam['cvdang_name']);
            $cvdang_order = trim($this->_arrParam['cvdang_order']);
            $cvdang_status = $this->_arrParam['cvdang_status'];

            $validator_length = new Zend_Validate_StringLength(array('min' => 2, 'max' => 100));
            if (!is_numeric($cvdang_order)) {
                $cvdang_order = 0;
            }

            //kiem tra dữ liệu
            if (!$validator_length->isValid($cvdang_name)) {
                $error_message[] = 'Tên chức vụ phải bằng hoặc hơn 2 ký tự và nhỏ hơn hoặc bằng 100 ký tự.';
            }

            if (!sizeof($error_message)) {
                $current_time = new Zend_Db_Expr('NOW()');
                $chucvuModel->insert(array(
                    'cvdang_name' => $cvdang_name,
                    'cvdang_status' => $cvdang_status,
                    'cvdang_order' => $cvdang_order,
                    'cvdang_date_added' => $current_time,
                    'cvdang_date_modified' => $current_time
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
        $this->view->title = 'Quản lý chức vụ đảng - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $id = $this->_getParam('id', 0);

        $chucvuModel = new Front_Model_ChucVuDang();
        $error_message = array();
        $success_message = '';

        $cvdang_info = $chucvuModel->fetchRow('cvdang_id=' . $id);
        if (!$cvdang_info) {
            $error_message[] = 'Không tìm thấy thông tin.';
        }

        if ($this->_request->isPost()) {
            $cvdang_name = trim($this->_arrParam['cvdang_name']);
            $cvdang_order = trim($this->_arrParam['cvdang_order']);
            $cvdang_status = $this->_arrParam['cvdang_status'];

            if (!is_numeric($cvdang_order)) {
                $cvdang_order = 0;
            }
            
            $validator_length = new Zend_Validate_StringLength(array('min' => 4, 'max' => 100));

            //kiem tra dữ liệu
            if (!$validator_length->isValid($cvdang_name)) {
                $error_message[] = 'Tên chức vụ phải bằng hoặc hơn 4 ký tự và nhỏ hơn hoặc bằng 100 ký tự.';
            }

            if (!sizeof($error_message)) {
                $current_time = new Zend_Db_Expr('NOW()');
                $chucvuModel->update(array(
                    'cvdang_name' => $cvdang_name,
                    'cvdang_status' => $cvdang_status,
                    'cvdang_order' => $cvdang_order,
                    'cvdang_date_modified' => $current_time
                        ), 'cvdang_id=' . $id
                );

                $cvdang_info->cvdang_name = $cvdang_name;
                $cvdang_info->cvdang_status = $cvdang_status;
                $cvdang_info->cvdang_order = $cvdang_order;

                $success_message = 'Đã cập nhật thông tin thành công.';
            }
        }


        $this->view->cvdang_info = $cvdang_info;
        $this->view->success_message = $success_message;
        $this->view->error_message = $error_message;
    }

    public function deleteAction() {

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => 'hethong/layout',
            'layoutPath' => $layoutPath);

        Zend_Layout::startMvc($option);
        $translate = Zend_Registry::get('Zend_Translate');
        $this->view->title = 'Quản lý chức vụ đảng - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $id = $this->_getParam('id', 0);

        $chucvuModel = new Front_Model_ChucVuDang();
        $error_message = array();

        $cvdang_info = $chucvuModel->fetchRow('cvdang_id=' . $id);
        if (!$cvdang_info) {
            $error_message[] = 'Không tìm thấy thông tin.';
        }

        if ($this->_request->isPost()) {
            $del = $this->getRequest()->getPost('del');
            if ($del == 'Yes') {
                $id = $this->getRequest()->getPost('id');
                $chucvuModel->delete('cvdang_id=' . $id);
            }
            $this->_redirect('hethong/chucvudang/index/page/' . $this->_page);
        }


        $this->view->cvdang_info = $cvdang_info;
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
        $chucvuModel = new Front_Model_ChucVuDang();
        $chucvuModel->update(array('cvdang_status' => $type, 'cvdang_date_modified' => $current_time), 'cvdang_id=' . $id);
        $this->_redirect('hethong/chucvudang/index/page/' . $this->_page);
    }

    function deleteitemsAction() {
        $this->_helper->layout()->disableLayout();
        $chucvuModel = new Front_Model_ChucVuDang();
        if ($this->_request->isPost()) {
            $item = $this->getRequest()->getPost('cid');
            foreach ($item as $k => $v) {
                $chucvuModel->delete('cvdang_id=' . $v);
            }
        }
        $this->_redirect('hethong/chucvudang/index/page/' . $this->_page);
    }

}