<?php

class Hethong_BangcapController extends Zend_Controller_Action {

    protected $_arrParam;
    protected $_page = 1;
    protected $_kw = '';
    protected $_actionMain;

    public function init() {
        $auth = Zend_Auth::getInstance();
        $identity = $auth->getIdentity();

        //kiem tra permission
        $check_permission = $this->_helper->global->checkPermission($identity->group_id, '1007');
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
        $this->view->title = 'Quản lý bằng cấp - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => 'hethong/layout',
            'layoutPath' => $layoutPath);

        Zend_Layout::startMvc($option);

        $bangcapModel = new Front_Model_Bangcap();
        $list_bangcap = $bangcapModel->fetchData(array(), 'bc_order ASC');

        $paginator = Zend_Paginator::factory($list_bangcap);
        $paginator->setItemCountPerPage(NUM_PER_PAGE);
        $paginator->setCurrentPageNumber($this->_page);
        $this->view->page = $this->_page;
        $this->view->paginator = $paginator;
    }

    public function searchAction() {
        $translate = Zend_Registry::get('Zend_Translate');
        $this->view->title = 'Quản lý bằng cấp - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => 'hethong/layout',
            'layoutPath' => $layoutPath);
        Zend_Layout::startMvc($option);

        $bangcapModel = new Front_Model_Bangcap();
        if ($this->_kw)
            $list_bangcap = $bangcapModel->fetchData(array('keyword' => $this->_kw), 'bc_order ASC');
        else {
            $this->_redirect('hethong/bangcap/');
            $list_bangcap = $bangcapModel->fetchData(array(), 'bc_order ASC');
        }

        $paginator = Zend_Paginator::factory($list_bangcap);
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
        $this->view->title = 'Quản lý bằng cấp - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $bangcapModel = new Front_Model_Bangcap();
        $error_message = array();
        $success_message = '';
        if ($this->_request->isPost()) {
            $bc_name = trim($this->_arrParam['bc_name']);
            $bc_order = trim($this->_arrParam['bc_order']);
            $bc_status = $this->_arrParam['bc_status'];

            $validator_length = new Zend_Validate_StringLength(array('min' => 2, 'max' => 100));
            if (!is_numeric($bc_order)) {
                $bc_order = 0;
            }

            //kiem tra dữ liệu
            if (!$validator_length->isValid($bc_name)) {
                $error_message[] = 'Tên bằng cấp phải bằng hoặc hơn 2 ký tự và nhỏ hơn hoặc bằng 100 ký tự.';
            }

            if (!sizeof($error_message)) {
                $current_time = new Zend_Db_Expr('NOW()');
                $bangcapModel->insert(array(
                    'bc_name' => $bc_name,
                    'bc_status' => $bc_status,
                    'bc_order' => $bc_order,
                    'bc_date_added' => $current_time,
                    'bc_date_modified' => $current_time
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
        $this->view->title = 'Quản lý bằng cấp - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $id = $this->_getParam('id', 0);

        $bangcapModel = new Front_Model_Bangcap();
        $error_message = array();
        $success_message = '';

        $bc_info = $bangcapModel->fetchRow('bc_id=' . $id);
        if (!$bc_info) {
            $error_message[] = 'Không tìm thấy thông tin.';
        }

        if ($this->_request->isPost()) {
            $bc_name = trim($this->_arrParam['bc_name']);
            $bc_order = trim($this->_arrParam['bc_order']);
            $bc_status = $this->_arrParam['bc_status'];

            if (!is_numeric($bc_order)) {
                $bc_order = 0;
            }
            
            $validator_length = new Zend_Validate_StringLength(array('min' => 4, 'max' => 100));

            //kiem tra dữ liệu
            if (!$validator_length->isValid($bc_name)) {
                $error_message[] = 'Tên bằng cấp phải bằng hoặc hơn 4 ký tự và nhỏ hơn hoặc bằng 100 ký tự.';
            }

            if (!sizeof($error_message)) {
                $current_time = new Zend_Db_Expr('NOW()');
                $bangcapModel->update(array(
                    'bc_name' => $bc_name,
                    'bc_status' => $bc_status,
                    'bc_order' => $bc_order,
                    'bc_date_modified' => $current_time
                        ), 'bc_id=' . $id
                );

                $bc_info->bc_name = $bc_name;
                $bc_info->bc_status = $bc_status;
                $bc_info->bc_order = $bc_order;

                $success_message = 'Đã cập nhật thông tin thành công.';
            }
        }


        $this->view->bc_info = $bc_info;
        $this->view->success_message = $success_message;
        $this->view->error_message = $error_message;
    }

    public function deleteAction() {

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => 'hethong/layout',
            'layoutPath' => $layoutPath);

        Zend_Layout::startMvc($option);
        $translate = Zend_Registry::get('Zend_Translate');
        $this->view->title = 'Quản lý bằng cấp - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $id = $this->_getParam('id', 0);

        $bangcapModel = new Front_Model_Bangcap();
        $error_message = array();

        $bc_info = $bangcapModel->fetchRow('bc_id=' . $id);
        if (!$bc_info) {
            $error_message[] = 'Không tìm thấy thông tin.';
        }

        if ($this->_request->isPost()) {
            $del = $this->getRequest()->getPost('del');
            if ($del == 'Yes') {
                $id = $this->getRequest()->getPost('id');
                $bangcapModel->delete('bc_id=' . $id);
            }
            $this->_redirect('hethong/bangcap/index/page/' . $this->_page);
        }


        $this->view->bc_info = $bc_info;
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
        $bangcapModel = new Front_Model_Bangcap();
        $bangcapModel->update(array('bc_status' => $type, 'bc_date_modified' => $current_time), 'bc_id=' . $id);
        $this->_redirect('hethong/bangcap/index/page/' . $this->_page);
    }

    function deleteitemsAction() {
        $this->_helper->layout()->disableLayout();
        $bangcapModel = new Front_Model_Bangcap();
        if ($this->_request->isPost()) {
            $item = $this->getRequest()->getPost('cid');
            foreach ($item as $k => $v) {
                $bangcapModel->delete('bc_id=' . $v);
            }
        }
        $this->_redirect('hethong/bangcap/index/page/' . $this->_page);
    }

}