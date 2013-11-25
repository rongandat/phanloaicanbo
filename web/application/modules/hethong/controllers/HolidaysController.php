<?php

class Hethong_HolidaysController extends Zend_Controller_Action {

    protected $_arrParam;
    protected $_page = 1;
    protected $_kw = '';
    protected $_actionMain;

    public function init() {
        $auth = Zend_Auth::getInstance();
        $identity = $auth->getIdentity();

        //kiem tra permission
        $check_permission = $this->_helper->global->checkPermission($identity->group_id, '1004');
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
        $this->view->title = 'Quản lý ngày nghỉ lễ - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => 'hethong/layout',
            'layoutPath' => $layoutPath);

        Zend_Layout::startMvc($option);

        $holidaysModel = new Front_Model_Holidays();
        $list_holidays = $holidaysModel->fetchData(array(), 'hld_order ASC');

        $paginator = Zend_Paginator::factory($list_holidays);
        $paginator->setItemCountPerPage(NUM_PER_PAGE);
        $paginator->setCurrentPageNumber($this->_page);
        $this->view->page = $this->_page;
        $this->view->paginator = $paginator;
    }

    public function searchAction() {
        $translate = Zend_Registry::get('Zend_Translate');
        $this->view->title = 'Quản lý ngày nghỉ lễ - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => 'hethong/layout',
            'layoutPath' => $layoutPath);
        Zend_Layout::startMvc($option);

        $holidaysModel = new Front_Model_Holidays();
        if ($this->_kw)
            $list_holidays = $holidaysModel->fetchData(array('keyword' => $this->_kw), 'hld_order ASC');
        else {
            $this->_redirect('hethong/holidays/');
            $list_holidays = $holidaysModel->fetchData(array(), 'hld_order ASC');
        }

        $paginator = Zend_Paginator::factory($list_holidays);
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
        $this->view->title = 'Quản lý ngày nghỉ lễ - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $holidaysModel = new Front_Model_Holidays();
        $error_message = array();
        $success_message = '';
        if ($this->_request->isPost()) {
            $hld_name = trim($this->_arrParam['hld_name']);
            $hld_order = trim($this->_arrParam['hld_order']);
            $hld_status = $this->_arrParam['hld_status'];

            $validator_length = new Zend_Validate_StringLength(array('min' => 2, 'max' => 100));
            if (!is_numeric($hld_order)) {
                $hld_order = 0;
            }

            //kiem tra dữ liệu
            if (!$validator_length->isValid($hld_name)) {
                $error_message[] = 'Tên ngày nghỉ lễ phải bằng hoặc hơn 2 ký tự và nhỏ hơn hoặc bằng 100 ký tự.';
            }

            if (!sizeof($error_message)) {
                $current_time = new Zend_Db_Expr('NOW()');
                $holidaysModel->insert(array(
                    'hld_name' => $hld_name,
                    'hld_status' => $hld_status,
                    'hld_order' => $hld_order,
                    'hld_date_added' => $current_time,
                    'hld_date_modified' => $current_time
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
        $this->view->title = 'Quản lý ngày nghỉ lễ - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $id = $this->_getParam('id', 0);

        $holidaysModel = new Front_Model_Holidays();
        $error_message = array();
        $success_message = '';

        $hld_info = $holidaysModel->fetchRow('hld_id=' . $id);
        if (!$hld_info) {
            $error_message[] = 'Không tìm thấy thông tin.';
        }

        if ($this->_request->isPost()) {
            $hld_name = trim($this->_arrParam['hld_name']);
            $hld_order = trim($this->_arrParam['hld_order']);
            $hld_status = $this->_arrParam['hld_status'];

            if (!is_numeric($hld_order)) {
                $hld_order = 0;
            }
            
            $validator_length = new Zend_Validate_StringLength(array('min' => 4, 'max' => 100));

            //kiem tra dữ liệu
            if (!$validator_length->isValid($hld_name)) {
                $error_message[] = 'Tên ngày nghỉ lễ phải bằng hoặc hơn 4 ký tự và nhỏ hơn hoặc bằng 100 ký tự.';
            }

            if (!sizeof($error_message)) {
                $current_time = new Zend_Db_Expr('NOW()');
                $holidaysModel->update(array(
                    'hld_name' => $hld_name,
                    'hld_status' => $hld_status,
                    'hld_order' => $hld_order,
                    'hld_date_modified' => $current_time
                        ), 'hld_id=' . $id
                );

                $hld_info->hld_name = $hld_name;
                $hld_info->hld_status = $hld_status;
                $hld_info->hld_order = $hld_order;

                $success_message = 'Đã cập nhật thông tin thành công.';
            }
        }


        $this->view->hld_info = $hld_info;
        $this->view->success_message = $success_message;
        $this->view->error_message = $error_message;
    }

    public function deleteAction() {

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => 'hethong/layout',
            'layoutPath' => $layoutPath);

        Zend_Layout::startMvc($option);
        $translate = Zend_Registry::get('Zend_Translate');
        $this->view->title = 'Quản lý ngày nghỉ lễ - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $id = $this->_getParam('id', 0);

        $holidaysModel = new Front_Model_Holidays();
        $error_message = array();

        $hld_info = $holidaysModel->fetchRow('hld_id=' . $id);
        if (!$hld_info) {
            $error_message[] = 'Không tìm thấy thông tin.';
        }

        if ($this->_request->isPost()) {
            $del = $this->getRequest()->getPost('del');
            if ($del == 'Yes') {
                $id = $this->getRequest()->getPost('id');
                $holidaysModel->delete('hld_id=' . $id);
            }
            $this->_redirect('hethong/holidays/index/page/' . $this->_page);
        }


        $this->view->hld_info = $hld_info;
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
        $holidaysModel = new Front_Model_Holidays();
        $holidaysModel->update(array('hld_status' => $type, 'hld_date_modified' => $current_time), 'hld_id=' . $id);
        $this->_redirect('hethong/holidays/index/page/' . $this->_page);
    }

    function deleteitemsAction() {
        $this->_helper->layout()->disableLayout();
        $holidaysModel = new Front_Model_Holidays();
        if ($this->_request->isPost()) {
            $item = $this->getRequest()->getPost('cid');
            foreach ($item as $k => $v) {
                $holidaysModel->delete('hld_id=' . $v);
            }
        }
        $this->_redirect('hethong/holidays/index/page/' . $this->_page);
    }

}