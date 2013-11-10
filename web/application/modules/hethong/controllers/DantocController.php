<?php

class Hethong_DantocController extends Zend_Controller_Action {

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
        $this->view->title = 'Quản lý các dân tộc Việt Nam - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => 'hethong/layout',
            'layoutPath' => $layoutPath);

        Zend_Layout::startMvc($option);

        $dantocModel = new Front_Model_Dantoc();
        $list_dantoc = $dantocModel->fetchData(array(), 'dt_order ASC');

        $paginator = Zend_Paginator::factory($list_dantoc);
        $paginator->setItemCountPerPage(NUM_PER_PAGE);
        $paginator->setCurrentPageNumber($this->_page);
        $this->view->page = $this->_page;
        $this->view->paginator = $paginator;
    }

    public function searchAction() {
        $translate = Zend_Registry::get('Zend_Translate');
        $this->view->title = 'Quản lý các dân tộc Việt Nam - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => 'hethong/layout',
            'layoutPath' => $layoutPath);
        Zend_Layout::startMvc($option);

        $dantocModel = new Front_Model_Dantoc();
        if ($this->_kw)
            $list_dantoc = $dantocModel->fetchData(array('keyword' => $this->_kw), 'dt_order ASC');
        else {
            $this->_redirect('hethong/dantoc/');
            $list_dantoc = $dantocModel->fetchData(array(), 'dt_order ASC');
        }

        $paginator = Zend_Paginator::factory($list_dantoc);
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
        $this->view->title = 'Quản lý các dân tộc Việt Nam - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $dantocModel = new Front_Model_Dantoc();
        $error_message = array();
        $success_message = '';
        if ($this->_request->isPost()) {
            $dt_name = trim($this->_arrParam['dt_name']);
            $dt_order = trim($this->_arrParam['dt_order']);
            $dt_status = $this->_arrParam['dt_status'];

            $validator_length = new Zend_Validate_StringLength(array('min' => 2, 'max' => 100));
            if (!is_numeric($dt_order)) {
                $dt_order = 0;
            }

            //kiem tra dữ liệu
            if (!$validator_length->isValid($dt_name)) {
                $error_message[] = 'Tên dân tộc phải bằng hoặc hơn 2 ký tự và nhỏ hơn hoặc bằng 100 ký tự.';
            }

            if (!sizeof($error_message)) {
                $current_time = new Zend_Db_Expr('NOW()');
                $dantocModel->insert(array(
                    'dt_name' => $dt_name,
                    'dt_status' => $dt_status,
                    'dt_order' => $dt_order,
                    'dt_date_added' => $current_time,
                    'dt_date_modified' => $current_time
                        )
                );
                $success_message = 'Đã thêm dân tộc mới thành công.';
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
        $this->view->title = 'Quản lý các dân tộc Việt Nam - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $id = $this->_getParam('id', 0);

        $dantocModel = new Front_Model_Dantoc();
        $error_message = array();
        $success_message = '';

        $dantoc_info = $dantocModel->fetchRow('dt_id=' . $id);
        if (!$dantoc_info) {
            $error_message[] = 'Không tìm thấy thông tin.';
        }

        if ($this->_request->isPost()) {
            $dt_name = trim($this->_arrParam['dt_name']);
            $dt_order = trim($this->_arrParam['dt_order']);
            $dt_status = $this->_arrParam['dt_status'];

            if (!is_numeric($dt_order)) {
                $dt_order = 0;
            }
            
            $validator_length = new Zend_Validate_StringLength(array('min' => 4, 'max' => 100));

            //kiem tra dữ liệu
            if (!$validator_length->isValid($dt_name)) {
                $error_message[] = 'Tên dân tộc phải bằng hoặc hơn 4 ký tự và nhỏ hơn hoặc bằng 100 ký tự.';
            }

            if (!sizeof($error_message)) {
                $current_time = new Zend_Db_Expr('NOW()');
                $dantocModel->update(array(
                    'dt_name' => $dt_name,
                    'dt_status' => $dt_status,
                    'dt_order' => $dt_order,
                    'dt_date_modified' => $current_time
                        ), 'dt_id=' . $id
                );

                $dantoc_info->dt_name = $dt_name;
                $dantoc_info->dt_status = $dt_status;
                $dantoc_info->dt_order = $dt_order;

                $success_message = 'Đã cập nhật thông tin thành công.';
            }
        }


        $this->view->dt_info = $dantoc_info;
        $this->view->success_message = $success_message;
        $this->view->error_message = $error_message;
    }

    public function deleteAction() {

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => 'hethong/layout',
            'layoutPath' => $layoutPath);

        Zend_Layout::startMvc($option);
        $translate = Zend_Registry::get('Zend_Translate');
        $this->view->title = 'Quản lý các dân tộc Việt Nam - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $id = $this->_getParam('id', 0);

        $dantocModel = new Front_Model_Dantoc();
        $error_message = array();

        $dt_info = $dantocModel->fetchRow('dt_id=' . $id);
        if (!$dt_info) {
            $error_message[] = 'Không tìm thấy thông tin.';
        }

        if ($this->_request->isPost()) {
            $del = $this->getRequest()->getPost('del');
            if ($del == 'Yes') {
                $id = $this->getRequest()->getPost('id');
                $dantocModel->delete('dt_id=' . $id);
            }
            $this->_redirect('hethong/dantoc/index/page/' . $this->_page);
        }


        $this->view->dt_info = $dt_info;
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
        $dantocModel = new Front_Model_Dantoc();
        $dantocModel->update(array('dt_status' => $type, 'dt_date_modified' => $current_time), 'dt_id=' . $id);
        $this->_redirect('hethong/dantoc/index/page/' . $this->_page);
    }

    function deleteitemsAction() {
        $this->_helper->layout()->disableLayout();
        $dantocModel = new Front_Model_Dantoc();
        if ($this->_request->isPost()) {
            $item = $this->getRequest()->getPost('cid');
            foreach ($item as $k => $v) {
                $dantocModel->delete('dt_id=' . $v);
            }
        }
        $this->_redirect('hethong/dantoc/index/page/' . $this->_page);
    }

}