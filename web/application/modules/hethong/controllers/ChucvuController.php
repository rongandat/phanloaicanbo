<?php

class Hethong_ChucvuController extends Zend_Controller_Action {

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
        $this->view->title = 'Quản lý chức vụ - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => 'hethong/layout',
            'layoutPath' => $layoutPath);

        Zend_Layout::startMvc($option);

        $chucvuModel = new Front_Model_Chucvu();
        $list_chucvu = $chucvuModel->fetchData(array(), 'cv_order ASC');

        $paginator = Zend_Paginator::factory($list_chucvu);
        $paginator->setItemCountPerPage(NUM_PER_PAGE);
        $paginator->setCurrentPageNumber($this->_page);
        $this->view->page = $this->_page;
        $this->view->paginator = $paginator;
    }

    public function searchAction() {
        $translate = Zend_Registry::get('Zend_Translate');
        $this->view->title = 'Quản lý chức vụ - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => 'hethong/layout',
            'layoutPath' => $layoutPath);
        Zend_Layout::startMvc($option);

        $chucvuModel = new Front_Model_Chucvu();
        if ($this->_kw)
            $list_chucvu = $chucvuModel->fetchData(array('keyword' => $this->_kw), 'cv_order ASC');
        else {
            $this->_redirect('hethong/chucvu/');
            $list_chucvu = $chucvuModel->fetchData(array(), 'cv_order ASC');
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
        $this->view->title = 'Quản lý chức vụ - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $chucvuModel = new Front_Model_Chucvu();
        $error_message = array();
        $success_message = '';
        if ($this->_request->isPost()) {
            $cv_name = trim($this->_arrParam['cv_name']);
            $cv_order = trim($this->_arrParam['cv_order']);
            $cv_status = $this->_arrParam['cv_status'];

            $validator_length = new Zend_Validate_StringLength(array('min' => 2, 'max' => 100));
            if (!is_numeric($cv_order)) {
                $cv_order = 0;
            }

            //kiem tra dữ liệu
            if (!$validator_length->isValid($cv_name)) {
                $error_message[] = 'Tên chức vụ phải bằng hoặc hơn 2 ký tự và nhỏ hơn hoặc bằng 100 ký tự.';
            }

            if (!sizeof($error_message)) {
                $current_time = new Zend_Db_Expr('NOW()');
                $chucvuModel->insert(array(
                    'cv_name' => $cv_name,
                    'cv_status' => $cv_status,
                    'cv_order' => $cv_order,
                    'cv_date_added' => $current_time,
                    'cv_date_modified' => $current_time
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
        $this->view->title = 'Quản lý chức vụ - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $id = $this->_getParam('id', 0);

        $chucvuModel = new Front_Model_Chucvu();
        $error_message = array();
        $success_message = '';

        $cv_info = $chucvuModel->fetchRow('cv_id=' . $id);
        if (!$cv_info) {
            $error_message[] = 'Không tìm thấy thông tin.';
        }

        if ($this->_request->isPost()) {
            $cv_name = trim($this->_arrParam['cv_name']);
            $cv_order = trim($this->_arrParam['cv_order']);
            $cv_status = $this->_arrParam['cv_status'];

            if (!is_numeric($cv_order)) {
                $cv_order = 0;
            }
            
            $validator_length = new Zend_Validate_StringLength(array('min' => 4, 'max' => 100));

            //kiem tra dữ liệu
            if (!$validator_length->isValid($cv_name)) {
                $error_message[] = 'Tên chức vụ phải bằng hoặc hơn 4 ký tự và nhỏ hơn hoặc bằng 100 ký tự.';
            }

            if (!sizeof($error_message)) {
                $current_time = new Zend_Db_Expr('NOW()');
                $chucvuModel->update(array(
                    'cv_name' => $cv_name,
                    'cv_status' => $cv_status,
                    'cv_order' => $cv_order,
                    'cv_date_modified' => $current_time
                        ), 'cv_id=' . $id
                );

                $cv_info->cv_name = $cv_name;
                $cv_info->cv_status = $cv_status;
                $cv_info->cv_order = $cv_order;

                $success_message = 'Đã cập nhật thông tin thành công.';
            }
        }


        $this->view->cv_info = $cv_info;
        $this->view->success_message = $success_message;
        $this->view->error_message = $error_message;
    }

    public function deleteAction() {

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => 'hethong/layout',
            'layoutPath' => $layoutPath);

        Zend_Layout::startMvc($option);
        $translate = Zend_Registry::get('Zend_Translate');
        $this->view->title = 'Quản lý chức vụ - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $id = $this->_getParam('id', 0);

        $chucvuModel = new Front_Model_Chucvu();
        $error_message = array();

        $cv_info = $chucvuModel->fetchRow('cv_id=' . $id);
        if (!$cv_info) {
            $error_message[] = 'Không tìm thấy thông tin.';
        }

        if ($this->_request->isPost()) {
            $del = $this->getRequest()->getPost('del');
            if ($del == 'Yes') {
                $id = $this->getRequest()->getPost('id');
                $chucvuModel->delete('cv_id=' . $id);
            }
            $this->_redirect('hethong/chucvu/index/page/' . $this->_page);
        }


        $this->view->cv_info = $cv_info;
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
        $chucvuModel = new Front_Model_Chucvu();
        $chucvuModel->update(array('cv_status' => $type, 'cv_date_modified' => $current_time), 'cv_id=' . $id);
        $this->_redirect('hethong/chucvu/index/page/' . $this->_page);
    }

    function deleteitemsAction() {
        $this->_helper->layout()->disableLayout();
        $chucvuModel = new Front_Model_Chucvu();
        if ($this->_request->isPost()) {
            $item = $this->getRequest()->getPost('cid');
            foreach ($item as $k => $v) {
                $chucvuModel->delete('cv_id=' . $v);
            }
        }
        $this->_redirect('hethong/chucvu/index/page/' . $this->_page);
    }

}