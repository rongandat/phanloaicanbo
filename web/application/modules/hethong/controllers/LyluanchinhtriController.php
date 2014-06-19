<?php

class Hethong_LyluanchinhtriController extends Zend_Controller_Action {

    protected $_arrParam;
    protected $_page = 1;
    protected $_kw = '';
    protected $_actionMain;

    public function init() {
        $auth = Zend_Auth::getInstance();
        $identity = $auth->getIdentity();

        //kiem tra permission
        $check_permission = $this->_helper->global->checkPermission($identity->group_id, '1018');
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
        $this->view->title = 'Quản lý lý luận chính trị - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => 'hethong/layout',
            'layoutPath' => $layoutPath);

        Zend_Layout::startMvc($option);

        $lyluanchinhtriModel = new Front_Model_LyLuanChinhTri();
        $list_lyluanchinhtri = $lyluanchinhtriModel->fetchData(array(), 'llct_order ASC');

        $paginator = Zend_Paginator::factory($list_lyluanchinhtri);
        $paginator->setItemCountPerPage(NUM_PER_PAGE);
        $paginator->setCurrentPageNumber($this->_page);
        $this->view->page = $this->_page;
        $this->view->paginator = $paginator;
    }

    public function searchAction() {
        $translate = Zend_Registry::get('Zend_Translate');
        $this->view->title = 'Quản lý lý luận chính trị - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => 'hethong/layout',
            'layoutPath' => $layoutPath);
        Zend_Layout::startMvc($option);

        $lyluanchinhtriModel = new Front_Model_LyLuanChinhTri();
        if ($this->_kw)
            $list_lyluanchinhtri = $lyluanchinhtriModel->fetchData(array('keyword' => $this->_kw), 'llct_order ASC');
        else {
            $this->_redirect('hethong/lyluanchinhtri/');
            $list_lyluanchinhtri = $lyluanchinhtriModel->fetchData(array(), 'llct_order ASC');
        }

        $paginator = Zend_Paginator::factory($list_lyluanchinhtri);
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
        $this->view->title = 'Quản lý lý luận chính trị - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $lyluanchinhtriModel = new Front_Model_LyLuanChinhTri();
        $error_message = array();
        $success_message = '';
        if ($this->_request->isPost()) {
            $llct_name = trim($this->_arrParam['llct_name']);
            $llct_order = trim($this->_arrParam['llct_order']);
            $llct_status = $this->_arrParam['llct_status'];

            $validator_length = new Zend_Validate_StringLength(array('min' => 2, 'max' => 100));
            if (!is_numeric($llct_order)) {
                $llct_order = 0;
            }

            //kiem tra dữ liệu
            if (!$validator_length->isValid($llct_name)) {
                $error_message[] = 'Tên lý luận chính trị phải bằng hoặc hơn 2 ký tự và nhỏ hơn hoặc bằng 100 ký tự.';
            }

            if (!sizeof($error_message)) {
                $current_time = new Zend_Db_Expr('NOW()');
                $lyluanchinhtriModel->insert(array(
                    'llct_name' => $llct_name,
                    'llct_status' => $llct_status,
                    'llct_order' => $llct_order,
                    'llct_date_added' => $current_time,
                    'llct_date_modified' => $current_time
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
        $this->view->title = 'Quản lý lý luận chính trị - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $id = $this->_getParam('id', 0);

        $lyluanchinhtriModel = new Front_Model_LyLuanChinhTri();
        $error_message = array();
        $success_message = '';

        $llct_info = $lyluanchinhtriModel->fetchRow('llct_id=' . $id);
        if (!$llct_info) {
            $error_message[] = 'Không tìm thấy thông tin.';
        }

        if ($this->_request->isPost()) {
            $llct_name = trim($this->_arrParam['llct_name']);
            $llct_order = trim($this->_arrParam['llct_order']);
            $llct_status = $this->_arrParam['llct_status'];

            if (!is_numeric($llct_order)) {
                $llct_order = 0;
            }
            
            $validator_length = new Zend_Validate_StringLength(array('min' => 4, 'max' => 100));

            //kiem tra dữ liệu
            if (!$validator_length->isValid($llct_name)) {
                $error_message[] = 'Tên lý luận chính trị phải bằng hoặc hơn 4 ký tự và nhỏ hơn hoặc bằng 100 ký tự.';
            }

            if (!sizeof($error_message)) {
                $current_time = new Zend_Db_Expr('NOW()');
                $lyluanchinhtriModel->update(array(
                    'llct_name' => $llct_name,
                    'llct_status' => $llct_status,
                    'llct_order' => $llct_order,
                    'llct_date_modified' => $current_time
                        ), 'llct_id=' . $id
                );

                $llct_info->llct_name = $llct_name;
                $llct_info->llct_status = $llct_status;
                $llct_info->llct_order = $llct_order;

                $success_message = 'Đã cập nhật thông tin thành công.';
            }
        }


        $this->view->llct_info = $llct_info;
        $this->view->success_message = $success_message;
        $this->view->error_message = $error_message;
    }

    public function deleteAction() {

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => 'hethong/layout',
            'layoutPath' => $layoutPath);

        Zend_Layout::startMvc($option);
        $translate = Zend_Registry::get('Zend_Translate');
        $this->view->title = 'Quản lý lý luận chính trị - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $id = $this->_getParam('id', 0);

        $lyluanchinhtriModel = new Front_Model_LyLuanChinhTri();
        $error_message = array();

        $llct_info = $lyluanchinhtriModel->fetchRow('llct_id=' . $id);
        if (!$llct_info) {
            $error_message[] = 'Không tìm thấy thông tin.';
        }

        if ($this->_request->isPost()) {
            $del = $this->getRequest()->getPost('del');
            if ($del == 'Yes') {
                $id = $this->getRequest()->getPost('id');
                $lyluanchinhtriModel->delete('llct_id=' . $id);
            }
            $this->_redirect('hethong/lyluanchinhtri/index/page/' . $this->_page);
        }


        $this->view->llct_info = $llct_info;
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
        $lyluanchinhtriModel = new Front_Model_LyLuanChinhTri();
        $lyluanchinhtriModel->update(array('llct_status' => $type, 'llct_date_modified' => $current_time), 'llct_id=' . $id);
        $this->_redirect('hethong/lyluanchinhtri/index/page/' . $this->_page);
    }

    function deleteitemsAction() {
        $this->_helper->layout()->disableLayout();
        $lyluanchinhtriModel = new Front_Model_LyLuanChinhTri();
        if ($this->_request->isPost()) {
            $item = $this->getRequest()->getPost('cid');
            foreach ($item as $k => $v) {
                $lyluanchinhtriModel->delete('llct_id=' . $v);
            }
        }
        $this->_redirect('hethong/lyluanchinhtri/index/page/' . $this->_page);
    }

}