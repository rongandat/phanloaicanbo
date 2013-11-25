<?php

class Hethong_PhongbanController extends Zend_Controller_Action {

    protected $_arrParam;
    protected $_page = 1;
    protected $_actionMain;

    public function init() {
        $auth = Zend_Auth::getInstance();
        $identity = $auth->getIdentity();

        //kiem tra permission
        $check_permission = $this->_helper->global->checkPermission($identity->group_id, '1003');
        if (!$check_permission) {
            $this->_redirect('index/permission/');
            exit();
        }
        $this->_arrParam = $this->_request->getParams();
        $this->_arrParam['page'] = $this->_request->getParam('page', 1);
        if ($this->_arrParam['page'] == '' || $this->_arrParam['page'] <= 0) {
            $this->_arrParam['page'] = 1;
        }
        $this->_page = $this->_arrParam['page'];
        $this->view->arrParam = $this->_arrParam;
    }

    public function indexAction() {
        $translate = Zend_Registry::get('Zend_Translate');
        $this->view->title = 'Quản lý phòng ban - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => 'hethong/layout',
            'layoutPath' => $layoutPath);

        Zend_Layout::startMvc($option);
        $phongbanModel = new Front_Model_Phongban();        
        $phong_ban = Array();
        $list_phongban = $phongbanModel->fetchData(0, $phong_ban); 
        $this->view->paginator = $list_phongban;
    }

    public function addAction() {

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => 'hethong/layout',
            'layoutPath' => $layoutPath);

        Zend_Layout::startMvc($option);
        $translate = Zend_Registry::get('Zend_Translate');
        $this->view->title = 'Quản lý phòng ban - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $phongbanModel = new Front_Model_Phongban();
        $phong_ban = Array();
        $list_phongban = $phongbanModel->fetchData(0, $phong_ban); 
        
        $error_message = array();
        $success_message = '';
        if ($this->_request->isPost()) {
            $pb_name = trim($this->_arrParam['pb_name']);
            $pb_parent = $this->_arrParam['pb_parent'];
            $pb_order = trim($this->_arrParam['pb_order']);
            $pb_status = $this->_arrParam['pb_status'];

            $validator_length = new Zend_Validate_StringLength(array('min' => 2, 'max' => 100));
            if (!is_numeric($pb_order)) {
                $pb_order = 0;
            }

            //kiem tra dữ liệu
            if (!$validator_length->isValid($pb_name)) {
                $error_message[] = 'Tên phòng ban phải bằng hoặc hơn 2 ký tự và nhỏ hơn hoặc bằng 100 ký tự.';
            }

            if (!sizeof($error_message)) {
                $current_time = new Zend_Db_Expr('NOW()');
                $phongbanModel->insert(array(
                    'pb_name' => $pb_name,
                    'pb_parent' => $pb_parent,
                    'pb_status' => $pb_status,
                    'pb_order' => $pb_order,
                    'pb_date_added' => $current_time,
                    'pb_date_modified' => $current_time
                        )
                );
                $success_message = 'Đã thêm mới thành công.';
            }
        }
        $this->view->list_phongban = $list_phongban;
        $this->view->success_message = $success_message;
        $this->view->error_message = $error_message;
    }

    public function editAction() {

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => 'hethong/layout',
            'layoutPath' => $layoutPath);

        Zend_Layout::startMvc($option);
        $translate = Zend_Registry::get('Zend_Translate');
        $this->view->title = 'Quản lý phòng ban - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $id = $this->_getParam('id', 0);

        $phongbanModel = new Front_Model_Phongban();
        $error_message = array();
        $success_message = '';

        $pb_info = $phongbanModel->fetchRow('pb_id=' . $id);
        if (!$pb_info) {
            $error_message[] = 'Không tìm thấy thông tin.';
        }

        if ($this->_request->isPost()) {
            $pb_name = trim($this->_arrParam['pb_name']);
            $pb_order = trim($this->_arrParam['pb_order']);
            $pb_parent = $this->_arrParam['pb_parent'];
            $pb_status = $this->_arrParam['pb_status'];

            if (!is_numeric($pb_order)) {
                $pb_order = 0;
            }
            
            $validator_length = new Zend_Validate_StringLength(array('min' => 4, 'max' => 100));

            //kiem tra dữ liệu
            if (!$validator_length->isValid($pb_name)) {
                $error_message[] = 'Tên phòng ban phải bằng hoặc hơn 4 ký tự và nhỏ hơn hoặc bằng 100 ký tự.';
            }

            if (!sizeof($error_message)) {
                $current_time = new Zend_Db_Expr('NOW()');
                $phongbanModel->update(array(
                    'pb_name' => $pb_name,
                    'pb_parent' => $pb_parent,
                    'pb_status' => $pb_status,
                    'pb_order' => $pb_order,
                    'pb_date_modified' => $current_time
                        ), 'pb_id=' . $id
                );

                $pb_info->pb_name = $pb_name;
                $pb_info->pb_status = $pb_status;
                $pb_info->pb_order = $pb_order;

                $success_message = 'Đã cập nhật thông tin thành công.';
            }
        }

        $phong_ban = Array();
        $list_phongban = $phongbanModel->fetchData(0, $phong_ban, $id); 
        
        $this->view->pb_info = $pb_info;
        $this->view->list_phongban = $list_phongban;
        $this->view->success_message = $success_message;
        $this->view->error_message = $error_message;
    }

    public function deleteAction() {

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => 'hethong/layout',
            'layoutPath' => $layoutPath);

        Zend_Layout::startMvc($option);
        $translate = Zend_Registry::get('Zend_Translate');
        $this->view->title = 'Quản lý phòng ban - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $id = $this->_getParam('id', 0);

        $phongbanModel = new Front_Model_Phongban();
        $error_message = array();

        $pb_info = $phongbanModel->fetchRow('pb_id=' . $id);
        if (!$pb_info) {
            $error_message[] = 'Không tìm thấy thông tin.';
        }

        if ($this->_request->isPost()) {
            $del = $this->getRequest()->getPost('del');
            if ($del == 'Yes') {
                $id = $this->getRequest()->getPost('id');
                $phongbanModel->delete('pb_id=' . $id);
            }
            $this->_redirect('hethong/phongban/index/page/' . $this->_page);
        }


        $this->view->pb_info = $pb_info;
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
        $phongbanModel = new Front_Model_Phongban();
        $phongbanModel->update(array('pb_status' => $type, 'pb_date_modified' => $current_time), 'pb_id=' . $id);
        $this->_redirect('hethong/phongban/index/page/' . $this->_page);
    }

    function deleteitemsAction() {
        $this->_helper->layout()->disableLayout();
        $phongbanModel = new Front_Model_Phongban();
        if ($this->_request->isPost()) {
            $item = $this->getRequest()->getPost('cid');
            foreach ($item as $k => $v) {
                $phongbanModel->delete('pb_id=' . $v);
            }
        }
        $this->_redirect('hethong/phongban/index/page/' . $this->_page);
    }

}