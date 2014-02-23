<?php

class Hethong_ChucvucongdoanController extends Zend_Controller_Action {

    protected $_arrParam;
    protected $_page = 1;
    protected $_kw = '';
    protected $_actionMain;

    public function init() {
        $auth = Zend_Auth::getInstance();
        $identity = $auth->getIdentity();

        //kiem tra permission
        $check_permission = $this->_helper->global->checkPermission($identity->group_id, '1016');
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
        $this->view->title = 'Quản lý chức vụ công đoàn - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => 'hethong/layout',
            'layoutPath' => $layoutPath);

        Zend_Layout::startMvc($option);

        $chucvuModel = new Front_Model_ChucVuCongDoan();
        $list_chucvu = $chucvuModel->fetchData(array(), 'cvcdoan_order ASC');

        $paginator = Zend_Paginator::factory($list_chucvu);
        $paginator->setItemCountPerPage(NUM_PER_PAGE);
        $paginator->setCurrentPageNumber($this->_page);
        $this->view->page = $this->_page;
        $this->view->paginator = $paginator;
    }

    public function searchAction() {
        $translate = Zend_Registry::get('Zend_Translate');
        $this->view->title = 'Quản lý chức vụ công đoàn - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => 'hethong/layout',
            'layoutPath' => $layoutPath);
        Zend_Layout::startMvc($option);

        $chucvuModel = new Front_Model_ChucVuCongDoan();
        if ($this->_kw)
            $list_chucvu = $chucvuModel->fetchData(array('keyword' => $this->_kw), 'cvcdoan_order ASC');
        else {
            $this->_redirect('hethong/chucvucongdoan/');
            $list_chucvu = $chucvuModel->fetchData(array(), 'cvcdoan_order ASC');
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
        $this->view->title = 'Quản lý chức vụ công đoàn - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $chucvuModel = new Front_Model_ChucVuCongDoan();
        $error_message = array();
        $success_message = '';
        if ($this->_request->isPost()) {
            $cvcdoan_name = trim($this->_arrParam['cvcdoan_name']);
            $cvcdoan_order = trim($this->_arrParam['cvcdoan_order']);
            $cvcdoan_status = $this->_arrParam['cvcdoan_status'];

            $validator_length = new Zend_Validate_StringLength(array('min' => 2, 'max' => 100));
            if (!is_numeric($cvcdoan_order)) {
                $cvcdoan_order = 0;
            }

            //kiem tra dữ liệu
            if (!$validator_length->isValid($cvcdoan_name)) {
                $error_message[] = 'Tên chức vụ phải bằng hoặc hơn 2 ký tự và nhỏ hơn hoặc bằng 100 ký tự.';
            }

            if (!sizeof($error_message)) {
                $current_time = new Zend_Db_Expr('NOW()');
                $chucvuModel->insert(array(
                    'cvcdoan_name' => $cvcdoan_name,
                    'cvcdoan_status' => $cvcdoan_status,
                    'cvcdoan_order' => $cvcdoan_order,
                    'cvcdoan_date_added' => $current_time,
                    'cvcdoan_date_modified' => $current_time
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
        $this->view->title = 'Quản lý chức vụ công đoàn - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $id = $this->_getParam('id', 0);

        $chucvuModel = new Front_Model_ChucVuCongDoan();
        $error_message = array();
        $success_message = '';

        $cvcdoan_info = $chucvuModel->fetchRow('cvcdoan_id=' . $id);
        if (!$cvcdoan_info) {
            $error_message[] = 'Không tìm thấy thông tin.';
        }

        if ($this->_request->isPost()) {
            $cvcdoan_name = trim($this->_arrParam['cvcdoan_name']);
            $cvcdoan_order = trim($this->_arrParam['cvcdoan_order']);
            $cvcdoan_status = $this->_arrParam['cvcdoan_status'];

            if (!is_numeric($cvcdoan_order)) {
                $cvcdoan_order = 0;
            }
            
            $validator_length = new Zend_Validate_StringLength(array('min' => 4, 'max' => 100));

            //kiem tra dữ liệu
            if (!$validator_length->isValid($cvcdoan_name)) {
                $error_message[] = 'Tên chức vụ phải bằng hoặc hơn 4 ký tự và nhỏ hơn hoặc bằng 100 ký tự.';
            }

            if (!sizeof($error_message)) {
                $current_time = new Zend_Db_Expr('NOW()');
                $chucvuModel->update(array(
                    'cvcdoan_name' => $cvcdoan_name,
                    'cvcdoan_status' => $cvcdoan_status,
                    'cvcdoan_order' => $cvcdoan_order,
                    'cvcdoan_date_modified' => $current_time
                        ), 'cvcdoan_id=' . $id
                );

                $cvcdoan_info->cvcdoan_name = $cvcdoan_name;
                $cvcdoan_info->cvcdoan_status = $cvcdoan_status;
                $cvcdoan_info->cvcdoan_order = $cvcdoan_order;

                $success_message = 'Đã cập nhật thông tin thành công.';
            }
        }


        $this->view->cvcdoan_info = $cvcdoan_info;
        $this->view->success_message = $success_message;
        $this->view->error_message = $error_message;
    }

    public function deleteAction() {

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => 'hethong/layout',
            'layoutPath' => $layoutPath);

        Zend_Layout::startMvc($option);
        $translate = Zend_Registry::get('Zend_Translate');
        $this->view->title = 'Quản lý chức vụ công đoàn - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $id = $this->_getParam('id', 0);

        $chucvuModel = new Front_Model_ChucVuCongDoan();
        $error_message = array();

        $cvcdoan_info = $chucvuModel->fetchRow('cvcdoan_id=' . $id);
        if (!$cvcdoan_info) {
            $error_message[] = 'Không tìm thấy thông tin.';
        }

        if ($this->_request->isPost()) {
            $del = $this->getRequest()->getPost('del');
            if ($del == 'Yes') {
                $id = $this->getRequest()->getPost('id');
                $chucvuModel->delete('cvcdoan_id=' . $id);
            }
            $this->_redirect('hethong/chucvucongdoan/index/page/' . $this->_page);
        }


        $this->view->cvcdoan_info = $cvcdoan_info;
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
        $chucvuModel = new Front_Model_ChucVuCongDoan();
        $chucvuModel->update(array('cvcdoan_status' => $type, 'cvcdoan_date_modified' => $current_time), 'cvcdoan_id=' . $id);
        $this->_redirect('hethong/chucvucongdoan/index/page/' . $this->_page);
    }

    function deleteitemsAction() {
        $this->_helper->layout()->disableLayout();
        $chucvuModel = new Front_Model_ChucVuCongDoan();
        if ($this->_request->isPost()) {
            $item = $this->getRequest()->getPost('cid');
            foreach ($item as $k => $v) {
                $chucvuModel->delete('cvcdoan_id=' . $v);
            }
        }
        $this->_redirect('hethong/chucvucongdoan/index/page/' . $this->_page);
    }

}