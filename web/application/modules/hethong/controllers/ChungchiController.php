<?php

class Hethong_ChungchiController extends Zend_Controller_Action {

    protected $_arrParam;
    protected $_page = 1;
    protected $_kw = '';
    protected $_actionMain;

    public function init() {
        $auth = Zend_Auth::getInstance();
        $identity = $auth->getIdentity();

        //kiem tra permission
        $check_permission = $this->_helper->global->checkPermission($identity->group_id, '1008');
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
        $this->view->title = 'Quản lý chứng chỉ - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => 'hethong/layout',
            'layoutPath' => $layoutPath);

        Zend_Layout::startMvc($option);

        $chungchiModel = new Front_Model_Chungchi();
        $list_chungchi = $chungchiModel->fetchData(array(), 'cc_order ASC');

        $paginator = Zend_Paginator::factory($list_chungchi);
        $paginator->setItemCountPerPage(NUM_PER_PAGE);
        $paginator->setCurrentPageNumber($this->_page);
        $this->view->page = $this->_page;
        $this->view->paginator = $paginator;
    }

    public function searchAction() {
        $translate = Zend_Registry::get('Zend_Translate');
        $this->view->title = 'Quản lý chứng chỉ - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => 'hethong/layout',
            'layoutPath' => $layoutPath);
        Zend_Layout::startMvc($option);

        $chungchiModel = new Front_Model_Chungchi();
        if ($this->_kw)
            $list_chungchi = $chungchiModel->fetchData(array('keyword' => $this->_kw), 'cc_order ASC');
        else {
            $this->_redirect('hethong/chungchi/');
            $list_chungchi = $chungchiModel->fetchData(array(), 'cc_order ASC');
        }

        $paginator = Zend_Paginator::factory($list_chungchi);
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
        $this->view->title = 'Quản lý chứng chỉ - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $chungchiModel = new Front_Model_Chungchi();
        $error_message = array();
        $success_message = '';
        if ($this->_request->isPost()) {
            $cc_name = trim($this->_arrParam['cc_name']);
            $cc_order = trim($this->_arrParam['cc_order']);
            $cc_status = $this->_arrParam['cc_status'];
            $cc_type = $this->_arrParam['cc_type'];

            $validator_length = new Zend_Validate_StringLength(array('min' => 2, 'max' => 100));
            if (!is_numeric($cc_order)) {
                $cc_order = 0;
            }

            //kiem tra dữ liệu
            if (!$validator_length->isValid($cc_name)) {
                $error_message[] = 'Tên chứng chỉ phải bằng hoặc hơn 2 ký tự và nhỏ hơn hoặc bằng 100 ký tự.';
            }

            if (!sizeof($error_message)) {
                $current_time = new Zend_Db_Expr('NOW()');
                $chungchiModel->insert(array(
                    'cc_name' => $cc_name,
                    'cc_type' => $cc_type,
                    'cc_status' => $cc_status,
                    'cc_order' => $cc_order,
                    'cc_date_added' => $current_time,
                    'cc_date_modified' => $current_time
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
        $this->view->title = 'Quản lý chứng chỉ - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $id = $this->_getParam('id', 0);

        $chungchiModel = new Front_Model_Chungchi();
        $error_message = array();
        $success_message = '';

        $cc_info = $chungchiModel->fetchRow('cc_id=' . $id);
        if (!$cc_info) {
            $error_message[] = 'Không tìm thấy thông tin.';
        }

        if ($this->_request->isPost()) {
            $cc_name = trim($this->_arrParam['cc_name']);
            $cc_order = trim($this->_arrParam['cc_order']);
            $cc_status = $this->_arrParam['cc_status'];
            $cc_type = $this->_arrParam['cc_type'];

            if (!is_numeric($cc_order)) {
                $cc_order = 0;
            }
            
            $validator_length = new Zend_Validate_StringLength(array('min' => 4, 'max' => 100));

            //kiem tra dữ liệu
            if (!$validator_length->isValid($cc_name)) {
                $error_message[] = 'Tên chứng chỉ phải bằng hoặc hơn 4 ký tự và nhỏ hơn hoặc bằng 100 ký tự.';
            }

            if (!sizeof($error_message)) {
                $current_time = new Zend_Db_Expr('NOW()');
                $chungchiModel->update(array(
                    'cc_name' => $cc_name,
                    'cc_type' => $cc_type,
                    'cc_status' => $cc_status,
                    'cc_order' => $cc_order,
                    'cc_date_modified' => $current_time
                        ), 'cc_id=' . $id
                );

                $cc_info->cc_name = $cc_name;
                $cc_info->cc_status = $cc_status;
                $cc_info->cc_order = $cc_order;
                $cc_info->cc_type = $cc_type;

                $success_message = 'Đã cập nhật thông tin thành công.';
            }
        }


        $this->view->cc_info = $cc_info;
        $this->view->success_message = $success_message;
        $this->view->error_message = $error_message;
    }

    public function deleteAction() {

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => 'hethong/layout',
            'layoutPath' => $layoutPath);

        Zend_Layout::startMvc($option);
        $translate = Zend_Registry::get('Zend_Translate');
        $this->view->title = 'Quản lý chứng chỉ - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $id = $this->_getParam('id', 0);

        $chungchiModel = new Front_Model_Chungchi();
        $error_message = array();

        $cc_info = $chungchiModel->fetchRow('cc_id=' . $id);
        if (!$cc_info) {
            $error_message[] = 'Không tìm thấy thông tin.';
        }

        if ($this->_request->isPost()) {
            $del = $this->getRequest()->getPost('del');
            if ($del == 'Yes') {
                $id = $this->getRequest()->getPost('id');
                $chungchiModel->delete('cc_id=' . $id);
            }
            $this->_redirect('hethong/chungchi/index/page/' . $this->_page);
        }


        $this->view->cc_info = $cc_info;
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
        $chungchiModel = new Front_Model_Chungchi();
        $chungchiModel->update(array('cc_status' => $type, 'cc_date_modified' => $current_time), 'cc_id=' . $id);
        $this->_redirect('hethong/chungchi/index/page/' . $this->_page);
    }

    function deleteitemsAction() {
        $this->_helper->layout()->disableLayout();
        $chungchiModel = new Front_Model_Chungchi();
        if ($this->_request->isPost()) {
            $item = $this->getRequest()->getPost('cid');
            foreach ($item as $k => $v) {
                $chungchiModel->delete('cc_id=' . $v);
            }
        }
        $this->_redirect('hethong/chungchi/index/page/' . $this->_page);
    }

}