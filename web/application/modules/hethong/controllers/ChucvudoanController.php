<?php

class Hethong_ChucvudoanController extends Zend_Controller_Action {

    protected $_arrParam;
    protected $_page = 1;
    protected $_kw = '';
    protected $_actionMain;

    public function init() {
        $auth = Zend_Auth::getInstance();
        $identity = $auth->getIdentity();

        //kiem tra permission
        $check_permission = $this->_helper->global->checkPermission($identity->group_id, '1014');
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
        $this->view->title = 'Quản lý chức vụ đoàn - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => 'hethong/layout',
            'layoutPath' => $layoutPath);

        Zend_Layout::startMvc($option);

        $chucvuModel = new Front_Model_ChucVuDoan();
        $list_chucvu = $chucvuModel->fetchData(array(), 'cvdoan_order ASC');

        $paginator = Zend_Paginator::factory($list_chucvu);
        $paginator->setItemCountPerPage(NUM_PER_PAGE);
        $paginator->setCurrentPageNumber($this->_page);
        $this->view->page = $this->_page;
        $this->view->paginator = $paginator;
    }

    public function searchAction() {
        $translate = Zend_Registry::get('Zend_Translate');
        $this->view->title = 'Quản lý chức vụ đoàn - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => 'hethong/layout',
            'layoutPath' => $layoutPath);
        Zend_Layout::startMvc($option);

        $chucvuModel = new Front_Model_ChucVuDoan();
        if ($this->_kw)
            $list_chucvu = $chucvuModel->fetchData(array('keyword' => $this->_kw), 'cvdoan_order ASC');
        else {
            $this->_redirect('hethong/chucvudoan/');
            $list_chucvu = $chucvuModel->fetchData(array(), 'cvdoan_order ASC');
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
        $this->view->title = 'Quản lý chức vụ đoàn - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $chucvuModel = new Front_Model_ChucVuDoan();
        $error_message = array();
        $success_message = '';
        if ($this->_request->isPost()) {
            $cvdoan_name = trim($this->_arrParam['cvdoan_name']);
            $cvdoan_order = trim($this->_arrParam['cvdoan_order']);
            $cvdoan_status = $this->_arrParam['cvdoan_status'];

            $validator_length = new Zend_Validate_StringLength(array('min' => 2, 'max' => 100));
            if (!is_numeric($cvdoan_order)) {
                $cvdoan_order = 0;
            }

            //kiem tra dữ liệu
            if (!$validator_length->isValid($cvdoan_name)) {
                $error_message[] = 'Tên chức vụ phải bằng hoặc hơn 2 ký tự và nhỏ hơn hoặc bằng 100 ký tự.';
            }

            if (!sizeof($error_message)) {
                $current_time = new Zend_Db_Expr('NOW()');
                $chucvuModel->insert(array(
                    'cvdoan_name' => $cvdoan_name,
                    'cvdoan_status' => $cvdoan_status,
                    'cvdoan_order' => $cvdoan_order,
                    'cvdoan_date_added' => $current_time,
                    'cvdoan_date_modified' => $current_time
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
        $this->view->title = 'Quản lý chức vụ đoàn - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $id = $this->_getParam('id', 0);

        $chucvuModel = new Front_Model_ChucVuDoan();
        $error_message = array();
        $success_message = '';

        $cvdoan_info = $chucvuModel->fetchRow('cvdoan_id=' . $id);
        if (!$cvdoan_info) {
            $error_message[] = 'Không tìm thấy thông tin.';
        }

        if ($this->_request->isPost()) {
            $cvdoan_name = trim($this->_arrParam['cvdoan_name']);
            $cvdoan_order = trim($this->_arrParam['cvdoan_order']);
            $cvdoan_status = $this->_arrParam['cvdoan_status'];

            if (!is_numeric($cvdoan_order)) {
                $cvdoan_order = 0;
            }
            
            $validator_length = new Zend_Validate_StringLength(array('min' => 4, 'max' => 100));

            //kiem tra dữ liệu
            if (!$validator_length->isValid($cvdoan_name)) {
                $error_message[] = 'Tên chức vụ phải bằng hoặc hơn 4 ký tự và nhỏ hơn hoặc bằng 100 ký tự.';
            }

            if (!sizeof($error_message)) {
                $current_time = new Zend_Db_Expr('NOW()');
                $chucvuModel->update(array(
                    'cvdoan_name' => $cvdoan_name,
                    'cvdoan_status' => $cvdoan_status,
                    'cvdoan_order' => $cvdoan_order,
                    'cvdoan_date_modified' => $current_time
                        ), 'cvdoan_id=' . $id
                );

                $cvdoan_info->cvdoan_name = $cvdoan_name;
                $cvdoan_info->cvdoan_status = $cvdoan_status;
                $cvdoan_info->cvdoan_order = $cvdoan_order;

                $success_message = 'Đã cập nhật thông tin thành công.';
            }
        }


        $this->view->cvdoan_info = $cvdoan_info;
        $this->view->success_message = $success_message;
        $this->view->error_message = $error_message;
    }

    public function deleteAction() {

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => 'hethong/layout',
            'layoutPath' => $layoutPath);

        Zend_Layout::startMvc($option);
        $translate = Zend_Registry::get('Zend_Translate');
        $this->view->title = 'Quản lý chức vụ đoàn - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $id = $this->_getParam('id', 0);

        $chucvuModel = new Front_Model_ChucVuDoan();
        $error_message = array();

        $cvdoan_info = $chucvuModel->fetchRow('cvdoan_id=' . $id);
        if (!$cvdoan_info) {
            $error_message[] = 'Không tìm thấy thông tin.';
        }

        if ($this->_request->isPost()) {
            $del = $this->getRequest()->getPost('del');
            if ($del == 'Yes') {
                $id = $this->getRequest()->getPost('id');
                $chucvuModel->delete('cvdoan_id=' . $id);
            }
            $this->_redirect('hethong/chucvudoan/index/page/' . $this->_page);
        }


        $this->view->cvdoan_info = $cvdoan_info;
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
        $chucvuModel = new Front_Model_ChucVuDoan();
        $chucvuModel->update(array('cvdoan_status' => $type, 'cvdoan_date_modified' => $current_time), 'cvdoan_id=' . $id);
        $this->_redirect('hethong/chucvudoan/index/page/' . $this->_page);
    }

    function deleteitemsAction() {
        $this->_helper->layout()->disableLayout();
        $chucvuModel = new Front_Model_ChucVuDoan();
        if ($this->_request->isPost()) {
            $item = $this->getRequest()->getPost('cid');
            foreach ($item as $k => $v) {
                $chucvuModel->delete('cvdoan_id=' . $v);
            }
        }
        $this->_redirect('hethong/chucvudoan/index/page/' . $this->_page);
    }

}