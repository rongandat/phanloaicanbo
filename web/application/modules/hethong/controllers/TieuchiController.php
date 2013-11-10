<?php

class Hethong_TieuchiController extends Zend_Controller_Action {

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
        $this->view->title = 'Quản lý tiêu chí đánh giá cán bộ - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => 'hethong/layout',
            'layoutPath' => $layoutPath);

        Zend_Layout::startMvc($option);

        $tieuchiModel = new Front_Model_TieuChiDanhGiaCB();
        $list_tieuchi = $tieuchiModel->fetchData(array(), 'tcdgcb_order ASC');

        $paginator = Zend_Paginator::factory($list_tieuchi);
        $paginator->setItemCountPerPage(NUM_PER_PAGE);
        $paginator->setCurrentPageNumber($this->_page);
        $this->view->page = $this->_page;
        $this->view->paginator = $paginator;
    }

    public function searchAction() {
        $translate = Zend_Registry::get('Zend_Translate');
        $this->view->title = 'Quản lý tiêu chí đánh giá cán bộ - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => 'hethong/layout',
            'layoutPath' => $layoutPath);
        Zend_Layout::startMvc($option);

        $tieuchiModel = new Front_Model_TieuChiDanhGiaCB();
        if ($this->_kw)
            $list_tieuchi = $tieuchiModel->fetchData(array('keyword' => $this->_kw), 'tcdgcb_order ASC');
        else {
            $this->_redirect('hethong/tieuchi/');
            $list_tieuchi = $tieuchiModel->fetchData(array(), 'tcdgcb_order ASC');
        }

        $paginator = Zend_Paginator::factory($list_tieuchi);
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
        $this->view->title = 'Quản lý tiêu chí đánh giá cán bộ - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $tieuchiModel = new Front_Model_TieuChiDanhGiaCB();
        $error_message = array();
        $success_message = '';
        if ($this->_request->isPost()) {
            $tcdgcb_name = trim($this->_arrParam['tcdgcb_name']);
            $tcdgcb_order = trim($this->_arrParam['tcdgcb_order']);
            $tcdgcb_status = $this->_arrParam['tcdgcb_status'];

            $validator_length = new Zend_Validate_StringLength(array('min' => 2, 'max' => 100));
            if (!is_numeric($tcdgcb_order)) {
                $tcdgcb_order = 0;
            }

            //kiem tra dữ liệu
            if (!$validator_length->isValid($tcdgcb_name)) {
                $error_message[] = 'Tên tiêu chí phải bằng hoặc hơn 2 ký tự và nhỏ hơn hoặc bằng 100 ký tự.';
            }

            if (!sizeof($error_message)) {
                $current_time = new Zend_Db_Expr('NOW()');
                $tieuchiModel->insert(array(
                    'tcdgcb_name' => $tcdgcb_name,
                    'tcdgcb_status' => $tcdgcb_status,
                    'tcdgcb_order' => $tcdgcb_order,
                    'tcdgcb_date_added' => $current_time,
                    'tcdgcb_date_modified' => $current_time
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
        $this->view->title = 'Quản lý tiêu chí đánh giá cán bộ - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $id = $this->_getParam('id', 0);

        $tieuchiModel = new Front_Model_TieuChiDanhGiaCB();
        $error_message = array();
        $success_message = '';

        $tcdgcb_info = $tieuchiModel->fetchRow('tcdgcb_id=' . $id);
        if (!$tcdgcb_info) {
            $error_message[] = 'Không tìm thấy thông tin.';
        }

        if ($this->_request->isPost()) {
            $tcdgcb_name = trim($this->_arrParam['tcdgcb_name']);
            $tcdgcb_order = trim($this->_arrParam['tcdgcb_order']);
            $tcdgcb_status = $this->_arrParam['tcdgcb_status'];

            if (!is_numeric($tcdgcb_order)) {
                $tcdgcb_order = 0;
            }
            
            $validator_length = new Zend_Validate_StringLength(array('min' => 4, 'max' => 100));

            //kiem tra dữ liệu
            if (!$validator_length->isValid($tcdgcb_name)) {
                $error_message[] = 'Tên tiêu chí phải bằng hoặc hơn 4 ký tự và nhỏ hơn hoặc bằng 100 ký tự.';
            }

            if (!sizeof($error_message)) {
                $current_time = new Zend_Db_Expr('NOW()');
                $tieuchiModel->update(array(
                    'tcdgcb_name' => $tcdgcb_name,
                    'tcdgcb_status' => $tcdgcb_status,
                    'tcdgcb_order' => $tcdgcb_order,
                    'tcdgcb_date_modified' => $current_time
                        ), 'tcdgcb_id=' . $id
                );

                $tcdgcb_info->tcdgcb_name = $tcdgcb_name;
                $tcdgcb_info->tcdgcb_status = $tcdgcb_status;
                $tcdgcb_info->tcdgcb_order = $tcdgcb_order;

                $success_message = 'Đã cập nhật thông tin thành công.';
            }
        }


        $this->view->tcdgcb_info = $tcdgcb_info;
        $this->view->success_message = $success_message;
        $this->view->error_message = $error_message;
    }

    public function deleteAction() {

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => 'hethong/layout',
            'layoutPath' => $layoutPath);

        Zend_Layout::startMvc($option);
        $translate = Zend_Registry::get('Zend_Translate');
        $this->view->title = 'Quản lý tiêu chí đánh giá cán bộ - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $id = $this->_getParam('id', 0);

        $tieuchiModel = new Front_Model_TieuChiDanhGiaCB();
        $error_message = array();

        $tcdgcb_info = $tieuchiModel->fetchRow('tcdgcb_id=' . $id);
        if (!$tcdgcb_info) {
            $error_message[] = 'Không tìm thấy thông tin.';
        }

        if ($this->_request->isPost()) {
            $del = $this->getRequest()->getPost('del');
            if ($del == 'Yes') {
                $id = $this->getRequest()->getPost('id');
                $tieuchiModel->delete('tcdgcb_id=' . $id);
            }
            $this->_redirect('hethong/tieuchi/index/page/' . $this->_page);
        }


        $this->view->tcdgcb_info = $tcdgcb_info;
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
        $tieuchiModel = new Front_Model_TieuChiDanhGiaCB();
        $tieuchiModel->update(array('tcdgcb_status' => $type, 'tcdgcb_date_modified' => $current_time), 'tcdgcb_id=' . $id);
        $this->_redirect('hethong/tieuchi/index/page/' . $this->_page);
    }

    function deleteitemsAction() {
        $this->_helper->layout()->disableLayout();
        $tieuchiModel = new Front_Model_TieuChiDanhGiaCB();
        if ($this->_request->isPost()) {
            $item = $this->getRequest()->getPost('cid');
            foreach ($item as $k => $v) {
                $tieuchiModel->delete('tcdgcb_id=' . $v);
            }
        }
        $this->_redirect('hethong/tieuchi/index/page/' . $this->_page);
    }

}