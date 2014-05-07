<?php

class Hethong_NgachcongchucController extends Zend_Controller_Action {

    protected $_arrParam;
    protected $_page = 1;
    protected $_kw = '';
    protected $_actionMain;

    public function init() {
        $auth = Zend_Auth::getInstance();
        $identity = $auth->getIdentity();

        //kiem tra permission
        $check_permission = $this->_helper->global->checkPermission($identity->group_id, '1013');
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
        $this->view->title = 'Quản lý ngạch công chức - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => 'hethong/layout',
            'layoutPath' => $layoutPath);

        Zend_Layout::startMvc($option);

        $ngachcongchucModel = new Front_Model_NgachCongChuc();
        $list_ngachcongchuc = $ngachcongchucModel->fetchData(array(), 'ncc_order ASC');

        $paginator = Zend_Paginator::factory($list_ngachcongchuc);
        $paginator->setItemCountPerPage(NUM_PER_PAGE);
        $paginator->setCurrentPageNumber($this->_page);
        $this->view->page = $this->_page;
        $this->view->paginator = $paginator;
    }

    public function searchAction() {
        $translate = Zend_Registry::get('Zend_Translate');
        $this->view->title = 'Quản lý ngạch công chức - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => 'hethong/layout',
            'layoutPath' => $layoutPath);
        Zend_Layout::startMvc($option);

        $ngachcongchucModel = new Front_Model_NgachCongChuc();
        if ($this->_kw)
            $list_ngachcongchuc = $ngachcongchucModel->fetchData(array('keyword' => $this->_kw), 'ncc_order ASC');
        else {
            $this->_redirect('hethong/ngachcongchuc/');
            $list_ngachcongchuc = $ngachcongchucModel->fetchData(array(), 'ncc_order ASC');
        }

        $paginator = Zend_Paginator::factory($list_ngachcongchuc);
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
        $this->view->title = 'Quản lý ngạch công chức - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $ngachcongchucModel = new Front_Model_NgachCongChuc();
        $error_message = array();
        $success_message = '';
        if ($this->_request->isPost()) {
            $ncc_ma_nghach = trim($this->_arrParam['ncc_ma_ngach']);
            $ncc_name = trim($this->_arrParam['ncc_name']);
            $ncc_order = trim($this->_arrParam['ncc_order']);
            $ncc_status = $this->_arrParam['ncc_status'];
            $ncc_nam_nang_bac = $this->_arrParam['ncc_nam_nang_bac'];

            $validator_length = new Zend_Validate_StringLength(array('min' => 2, 'max' => 100));
            if (!is_numeric($ncc_order)) {
                $ncc_order = 0;
            }

            //kiem tra dữ liệu
            if (!$validator_length->isValid($ncc_ma_nghach)) {
                $error_message[] = 'Mã nghạch phải bằng hoặc hơn 4 ký tự và nhỏ hơn hoặc bằng 100 ký tự.';
            }
            
            //kiem tra dữ liệu
            if (!$validator_length->isValid($ncc_name)) {
                $error_message[] = 'Tên ngạch công chức phải bằng hoặc hơn 2 ký tự và nhỏ hơn hoặc bằng 100 ký tự.';
            }

            if (!sizeof($error_message)) {
                $current_time = new Zend_Db_Expr('NOW()');
                $ngachcongchucModel->insert(array(
                    'ncc_ma_ngach' => $ncc_ma_nghach,
                    'ncc_name' => $ncc_name,
                    'ncc_status' => $ncc_status,
                    'ncc_nam_nang_bac' => $ncc_nam_nang_bac,
                    'ncc_order' => $ncc_order,
                    'ncc_date_added' => $current_time,
                    'ncc_date_modified' => $current_time
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
        $this->view->title = 'Quản lý ngạch công chức - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $id = $this->_getParam('id', 0);

        $ngachcongchucModel = new Front_Model_NgachCongChuc();
        $error_message = array();
        $success_message = '';

        $ncc_info = $ngachcongchucModel->fetchRow('ncc_id=' . $id);
        if (!$ncc_info) {
            $error_message[] = 'Không tìm thấy thông tin.';
        }

        if ($this->_request->isPost()) {
            $ncc_ma_nghach = trim($this->_arrParam['ncc_ma_ngach']);
            $ncc_name = trim($this->_arrParam['ncc_name']);
            $ncc_order = trim($this->_arrParam['ncc_order']);
            $ncc_status = $this->_arrParam['ncc_status'];
            $ncc_nam_nang_bac = $this->_arrParam['ncc_nam_nang_bac'];

            if (!is_numeric($ncc_order)) {
                $ncc_order = 0;
            }
            
            $validator_length = new Zend_Validate_StringLength(array('min' => 4, 'max' => 100));

            //kiem tra dữ liệu
            if (!$validator_length->isValid($ncc_ma_nghach)) {
                $error_message[] = 'Mã nghạch phải bằng hoặc hơn 4 ký tự và nhỏ hơn hoặc bằng 100 ký tự.';
            }
            
            //kiem tra dữ liệu
            if (!$validator_length->isValid($ncc_name)) {
                $error_message[] = 'Tên ngạch công chức phải bằng hoặc hơn 4 ký tự và nhỏ hơn hoặc bằng 100 ký tự.';
            }

            if (!sizeof($error_message)) {
                $current_time = new Zend_Db_Expr('NOW()');
                $ngachcongchucModel->update(array(
                    'ncc_ma_ngach' => $ncc_ma_nghach,
                    'ncc_name' => $ncc_name,
                    'ncc_nam_nang_bac' => $ncc_nam_nang_bac,
                    'ncc_status' => $ncc_status,
                    'ncc_order' => $ncc_order,
                    'ncc_date_modified' => $current_time
                        ), 'ncc_id=' . $id
                );

                $ncc_info->ncc_name = $ncc_name;
                $ncc_info->ncc_status = $ncc_status;
                $ncc_info->ncc_order = $ncc_order;

                $success_message = 'Đã cập nhật thông tin thành công.';
                $ncc_info = $ngachcongchucModel->fetchRow('ncc_id=' . $id);
            }
        }


        $this->view->ncc_info = $ncc_info;
        $this->view->success_message = $success_message;
        $this->view->error_message = $error_message;
    }

    public function deleteAction() {

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => 'hethong/layout',
            'layoutPath' => $layoutPath);

        Zend_Layout::startMvc($option);
        $translate = Zend_Registry::get('Zend_Translate');
        $this->view->title = 'Quản lý ngạch công chức - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $id = $this->_getParam('id', 0);

        $ngachcongchucModel = new Front_Model_NgachCongChuc();
        $error_message = array();

        $ncc_info = $ngachcongchucModel->fetchRow('ncc_id=' . $id);
        if (!$ncc_info) {
            $error_message[] = 'Không tìm thấy thông tin.';
        }

        if ($this->_request->isPost()) {
            $del = $this->getRequest()->getPost('del');
            if ($del == 'Yes') {
                $id = $this->getRequest()->getPost('id');
                $ngachcongchucModel->delete('ncc_id=' . $id);
            }
            $this->_redirect('hethong/ngachcongchuc/index/page/' . $this->_page);
        }


        $this->view->ncc_info = $ncc_info;
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
        $ngachcongchucModel = new Front_Model_NgachCongChuc();
        $ngachcongchucModel->update(array('ncc_status' => $type, 'ncc_date_modified' => $current_time), 'ncc_id=' . $id);
        $this->_redirect('hethong/ngachcongchuc/index/page/' . $this->_page);
    }

    function deleteitemsAction() {
        $this->_helper->layout()->disableLayout();
        $ngachcongchucModel = new Front_Model_NgachCongChuc();
        if ($this->_request->isPost()) {
            $item = $this->getRequest()->getPost('cid');
            foreach ($item as $k => $v) {
                $ngachcongchucModel->delete('ncc_id=' . $v);
            }
        }
        $this->_redirect('hethong/ngachcongchuc/index/page/' . $this->_page);
    }

}