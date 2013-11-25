<?php

class Hethong_KetquaController extends Zend_Controller_Action {

    protected $_arrParam;
    protected $_page = 1;
    protected $_kw = '';
    protected $_actionMain;

    public function init() {
        $auth = Zend_Auth::getInstance();
        $identity = $auth->getIdentity();

        //kiem tra permission
        $check_permission = $this->_helper->global->checkPermission($identity->group_id, '1006');
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
        $this->view->title = 'Quản lý các đánh giá kết quả công việc - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => 'hethong/layout',
            'layoutPath' => $layoutPath);

        Zend_Layout::startMvc($option);

        $ketquaModel = new Front_Model_DanhGiaKetQuaCV();
        $list_ketqua = $ketquaModel->fetchData(array(), 'dgkqcv_order ASC');

        $paginator = Zend_Paginator::factory($list_ketqua);
        $paginator->setItemCountPerPage(NUM_PER_PAGE);
        $paginator->setCurrentPageNumber($this->_page);
        $this->view->page = $this->_page;
        $this->view->paginator = $paginator;
    }

    public function searchAction() {
        $translate = Zend_Registry::get('Zend_Translate');
        $this->view->title = 'Quản lý các đánh giá kết quả công việc - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => 'hethong/layout',
            'layoutPath' => $layoutPath);
        Zend_Layout::startMvc($option);

        $ketquaModel = new Front_Model_DanhGiaKetQuaCV();
        if ($this->_kw)
            $list_ketqua = $ketquaModel->fetchData(array('keyword' => $this->_kw), 'dgkqcv_order ASC');
        else {
            $this->_redirect('hethong/ketqua/');
            $list_ketqua = $ketquaModel->fetchData(array(), 'dgkqcv_order ASC');
        }

        $paginator = Zend_Paginator::factory($list_ketqua);
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
        $this->view->title = 'Quản lý các đánh giá kết quả công việc - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $ketquaModel = new Front_Model_DanhGiaKetQuaCV();
        $error_message = array();
        $success_message = '';
        if ($this->_request->isPost()) {
            $dgkqcv_name = trim($this->_arrParam['dgkqcv_name']);
            $dgkqcv_order = trim($this->_arrParam['dgkqcv_order']);
            $dgkqcv_status = $this->_arrParam['dgkqcv_status'];

            $validator_length = new Zend_Validate_StringLength(array('min' => 2, 'max' => 100));
            if (!is_numeric($dgkqcv_order)) {
                $dgkqcv_order = 0;
            }

            //kiem tra dữ liệu
            if (!$validator_length->isValid($dgkqcv_name)) {
                $error_message[] = 'Tên các đánh giá kết quả công việc phải bằng hoặc hơn 2 ký tự và nhỏ hơn hoặc bằng 100 ký tự.';
            }

            if (!sizeof($error_message)) {
                $current_time = new Zend_Db_Expr('NOW()');
                $ketquaModel->insert(array(
                    'dgkqcv_name' => $dgkqcv_name,
                    'dgkqcv_status' => $dgkqcv_status,
                    'dgkqcv_order' => $dgkqcv_order,
                    'dgkqcv_date_added' => $current_time,
                    'dgkqcv_date_modified' => $current_time
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
        $this->view->title = 'Quản lý các đánh giá kết quả công việc - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $id = $this->_getParam('id', 0);

        $ketquaModel = new Front_Model_DanhGiaKetQuaCV();
        $error_message = array();
        $success_message = '';

        $dgkqcv_info = $ketquaModel->fetchRow('dgkqcv_id=' . $id);
        if (!$dgkqcv_info) {
            $error_message[] = 'Không tìm thấy thông tin.';
        }

        if ($this->_request->isPost()) {
            $dgkqcv_name = trim($this->_arrParam['dgkqcv_name']);
            $dgkqcv_order = trim($this->_arrParam['dgkqcv_order']);
            $dgkqcv_status = $this->_arrParam['dgkqcv_status'];

            if (!is_numeric($dgkqcv_order)) {
                $dgkqcv_order = 0;
            }
            
            $validator_length = new Zend_Validate_StringLength(array('min' => 4, 'max' => 100));

            //kiem tra dữ liệu
            if (!$validator_length->isValid($dgkqcv_name)) {
                $error_message[] = 'Tên các đánh giá kết quả công việc phải bằng hoặc hơn 4 ký tự và nhỏ hơn hoặc bằng 100 ký tự.';
            }

            if (!sizeof($error_message)) {
                $current_time = new Zend_Db_Expr('NOW()');
                $ketquaModel->update(array(
                    'dgkqcv_name' => $dgkqcv_name,
                    'dgkqcv_status' => $dgkqcv_status,
                    'dgkqcv_order' => $dgkqcv_order,
                    'dgkqcv_date_modified' => $current_time
                        ), 'dgkqcv_id=' . $id
                );

                $dgkqcv_info->dgkqcv_name = $dgkqcv_name;
                $dgkqcv_info->dgkqcv_status = $dgkqcv_status;
                $dgkqcv_info->dgkqcv_order = $dgkqcv_order;

                $success_message = 'Đã cập nhật thông tin thành công.';
            }
        }


        $this->view->dgkqcv_info = $dgkqcv_info;
        $this->view->success_message = $success_message;
        $this->view->error_message = $error_message;
    }

    public function deleteAction() {

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => 'hethong/layout',
            'layoutPath' => $layoutPath);

        Zend_Layout::startMvc($option);
        $translate = Zend_Registry::get('Zend_Translate');
        $this->view->title = 'Quản lý các đánh giá kết quả công việc - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $id = $this->_getParam('id', 0);

        $ketquaModel = new Front_Model_DanhGiaKetQuaCV();
        $error_message = array();

        $dgkqcv_info = $ketquaModel->fetchRow('dgkqcv_id=' . $id);
        if (!$dgkqcv_info) {
            $error_message[] = 'Không tìm thấy thông tin.';
        }

        if ($this->_request->isPost()) {
            $del = $this->getRequest()->getPost('del');
            if ($del == 'Yes') {
                $id = $this->getRequest()->getPost('id');
                $ketquaModel->delete('dgkqcv_id=' . $id);
            }
            $this->_redirect('hethong/ketqua/index/page/' . $this->_page);
        }


        $this->view->dgkqcv_info = $dgkqcv_info;
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
        $ketquaModel = new Front_Model_DanhGiaKetQuaCV();
        $ketquaModel->update(array('dgkqcv_status' => $type, 'dgkqcv_date_modified' => $current_time), 'dgkqcv_id=' . $id);
        $this->_redirect('hethong/ketqua/index/page/' . $this->_page);
    }

    function deleteitemsAction() {
        $this->_helper->layout()->disableLayout();
        $ketquaModel = new Front_Model_DanhGiaKetQuaCV();
        if ($this->_request->isPost()) {
            $item = $this->getRequest()->getPost('cid');
            foreach ($item as $k => $v) {
                $ketquaModel->delete('dgkqcv_id=' . $v);
            }
        }
        $this->_redirect('hethong/ketqua/index/page/' . $this->_page);
    }

}