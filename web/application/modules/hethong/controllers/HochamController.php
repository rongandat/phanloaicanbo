<?php

class Hethong_HochamController extends Zend_Controller_Action {

    protected $_arrParam;
    protected $_page = 1;
    protected $_kw = '';
    protected $_actionMain;

    public function init() {
        $auth = Zend_Auth::getInstance();
        $identity = $auth->getIdentity();

        //kiem tra permission
        $check_permission = $this->_helper->global->checkPermission($identity->group_id, '1009');
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
        $this->view->title = 'Quản lý học hàm - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => 'hethong/layout',
            'layoutPath' => $layoutPath);

        Zend_Layout::startMvc($option);

        $hochamModel = new Front_Model_Hocham();
        $list_hocham = $hochamModel->fetchData(array(), 'hh_order ASC');

        $paginator = Zend_Paginator::factory($list_hocham);
        $paginator->setItemCountPerPage(NUM_PER_PAGE);
        $paginator->setCurrentPageNumber($this->_page);
        $this->view->page = $this->_page;
        $this->view->paginator = $paginator;
    }

    public function searchAction() {
        $translate = Zend_Registry::get('Zend_Translate');
        $this->view->title = 'Quản lý học hàm - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => 'hethong/layout',
            'layoutPath' => $layoutPath);
        Zend_Layout::startMvc($option);

        $hochamModel = new Front_Model_Hocham();
        if ($this->_kw)
            $list_hocham = $hochamModel->fetchData(array('keyword' => $this->_kw), 'hh_order ASC');
        else {
            $this->_redirect('hethong/hocham/');
            $list_hocham = $hochamModel->fetchData(array(), 'hh_order ASC');
        }

        $paginator = Zend_Paginator::factory($list_hocham);
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
        $this->view->title = 'Quản lý học hàm - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $hochamModel = new Front_Model_Hocham();
        $error_message = array();
        $success_message = '';
        if ($this->_request->isPost()) {
            $hh_name = trim($this->_arrParam['hh_name']);
            $hh_order = trim($this->_arrParam['hh_order']);
            $hh_status = $this->_arrParam['hh_status'];

            $validator_length = new Zend_Validate_StringLength(array('min' => 2, 'max' => 100));
            if (!is_numeric($hh_order)) {
                $hh_order = 0;
            }

            //kiem tra dữ liệu
            if (!$validator_length->isValid($hh_name)) {
                $error_message[] = 'Tên học hàm phải bằng hoặc hơn 2 ký tự và nhỏ hơn hoặc bằng 100 ký tự.';
            }

            if (!sizeof($error_message)) {
                $current_time = new Zend_Db_Expr('NOW()');
                $hochamModel->insert(array(
                    'hh_name' => $hh_name,
                    'hh_status' => $hh_status,
                    'hh_order' => $hh_order,
                    'hh_date_added' => $current_time,
                    'hh_date_modified' => $current_time
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
        $this->view->title = 'Quản lý học hàm - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $id = $this->_getParam('id', 0);

        $hochamModel = new Front_Model_Hocham();
        $error_message = array();
        $success_message = '';

        $hh_info = $hochamModel->fetchRow('hh_id=' . $id);
        if (!$hh_info) {
            $error_message[] = 'Không tìm thấy thông tin.';
        }

        if ($this->_request->isPost()) {
            $hh_name = trim($this->_arrParam['hh_name']);
            $hh_order = trim($this->_arrParam['hh_order']);
            $hh_status = $this->_arrParam['hh_status'];

            if (!is_numeric($hh_order)) {
                $hh_order = 0;
            }
            
            $validator_length = new Zend_Validate_StringLength(array('min' => 4, 'max' => 100));

            //kiem tra dữ liệu
            if (!$validator_length->isValid($hh_name)) {
                $error_message[] = 'Tên học hàm phải bằng hoặc hơn 4 ký tự và nhỏ hơn hoặc bằng 100 ký tự.';
            }

            if (!sizeof($error_message)) {
                $current_time = new Zend_Db_Expr('NOW()');
                $hochamModel->update(array(
                    'hh_name' => $hh_name,
                    'hh_status' => $hh_status,
                    'hh_order' => $hh_order,
                    'hh_date_modified' => $current_time
                        ), 'hh_id=' . $id
                );

                $hh_info->hh_name = $hh_name;
                $hh_info->hh_status = $hh_status;
                $hh_info->hh_order = $hh_order;

                $success_message = 'Đã cập nhật thông tin thành công.';
            }
        }


        $this->view->hh_info = $hh_info;
        $this->view->success_message = $success_message;
        $this->view->error_message = $error_message;
    }

    public function deleteAction() {

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => 'hethong/layout',
            'layoutPath' => $layoutPath);

        Zend_Layout::startMvc($option);
        $translate = Zend_Registry::get('Zend_Translate');
        $this->view->title = 'Quản lý học hàm - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $id = $this->_getParam('id', 0);

        $hochamModel = new Front_Model_Hocham();
        $error_message = array();

        $hh_info = $hochamModel->fetchRow('hh_id=' . $id);
        if (!$hh_info) {
            $error_message[] = 'Không tìm thấy thông tin.';
        }

        if ($this->_request->isPost()) {
            $del = $this->getRequest()->getPost('del');
            if ($del == 'Yes') {
                $id = $this->getRequest()->getPost('id');
                $hochamModel->delete('hh_id=' . $id);
            }
            $this->_redirect('hethong/hocham/index/page/' . $this->_page);
        }


        $this->view->hh_info = $hh_info;
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
        $hochamModel = new Front_Model_Hocham();
        $hochamModel->update(array('hh_status' => $type, 'hh_date_modified' => $current_time), 'hh_id=' . $id);
        $this->_redirect('hethong/hocham/index/page/' . $this->_page);
    }

    function deleteitemsAction() {
        $this->_helper->layout()->disableLayout();
        $hochamModel = new Front_Model_Hocham();
        if ($this->_request->isPost()) {
            $item = $this->getRequest()->getPost('cid');
            foreach ($item as $k => $v) {
                $hochamModel->delete('hh_id=' . $v);
            }
        }
        $this->_redirect('hethong/hocham/index/page/' . $this->_page);
    }

}