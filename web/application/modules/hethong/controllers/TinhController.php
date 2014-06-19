<?php

class Hethong_TinhController extends Zend_Controller_Action {

    protected $_arrParam;
    protected $_page = 1;
    protected $_kw = '';
    protected $_actionMain;

    public function init() {
        $auth = Zend_Auth::getInstance();
        $identity = $auth->getIdentity();

        //kiem tra permission
        $check_permission = $this->_helper->global->checkPermission($identity->group_id, '1011');
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
        $this->view->title = 'Quản lý tỉnh/thành phố - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => 'hethong/layout',
            'layoutPath' => $layoutPath);

        Zend_Layout::startMvc($option);

        $tinhModel = new Front_Model_Tinh();
        $list_tinh = $tinhModel->fetchData(array(), 'tinh_order ASC');

        $paginator = Zend_Paginator::factory($list_tinh);
        $paginator->setItemCountPerPage(NUM_PER_PAGE);
        $paginator->setCurrentPageNumber($this->_page);
        $this->view->page = $this->_page;
        $this->view->paginator = $paginator;
    }

    public function searchAction() {
        $translate = Zend_Registry::get('Zend_Translate');
        $this->view->title = 'Quản lý tỉnh/thành phố - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => 'hethong/layout',
            'layoutPath' => $layoutPath);
        Zend_Layout::startMvc($option);

        $tinhModel = new Front_Model_Tinh();
        if ($this->_kw)
            $list_tinh = $tinhModel->fetchData(array('keyword' => $this->_kw), 'tinh_order ASC');
        else {
            $this->_redirect('hethong/tinh/');
            $list_tinh = $tinhModel->fetchData(array(), 'tinh_order ASC');
        }

        $paginator = Zend_Paginator::factory($list_tinh);
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
        $this->view->title = 'Quản lý tỉnh/thành phố - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $tinhModel = new Front_Model_Tinh();
        $error_message = array();
        $success_message = '';
        if ($this->_request->isPost()) {
            $tinh_name = trim($this->_arrParam['tinh_name']);
            $tinh_order = trim($this->_arrParam['tinh_order']);
            $tinh_status = $this->_arrParam['tinh_status'];

            $validator_length = new Zend_Validate_StringLength(array('min' => 2, 'max' => 100));
            if (!is_numeric($tinh_order)) {
                $tinh_order = 0;
            }

            //kiem tra dữ liệu
            if (!$validator_length->isValid($tinh_name)) {
                $error_message[] = 'Tên tỉnh/thành phố phải bằng hoặc hơn 2 ký tự và nhỏ hơn hoặc bằng 100 ký tự.';
            }

            if (!sizeof($error_message)) {
                $current_time = new Zend_Db_Expr('NOW()');
                $tinhModel->insert(array(
                    'tinh_name' => $tinh_name,
                    'tinh_status' => $tinh_status,
                    'tinh_order' => $tinh_order,
                    'tinh_date_added' => $current_time,
                    'tinh_date_modified' => $current_time
                        )
                );
                $success_message = 'Đã thêm mới thành công.';
            }
        }
        $this->view->success_message = $success_message;
        $this->view->error_message = $error_message;
    }

    public function importAction() {
        $dir = '/excel'; //thu muc uploads
        $dir_upload = IMPORT_PATH . $dir; //duong dan
        $full_path = $dir_upload . '/tinh.xlsx';
        $objPHPExcel = PHPExcel_IOFactory::load($full_path);
        $sheetData = $objPHPExcel->getActiveSheet()->toArray(null, true, true, true);
        $tinhModel = new Front_Model_Tinh();
        foreach ($sheetData as $row) {
            $current_time = new Zend_Db_Expr('NOW()');
            $tinhModel->insert(array(
                'tinh_id' => $row['A'],
                'tinh_name' => $row['B'],
                'tinh_status' => 1,
                'tinh_order' => 0,
                'tinh_date_added' => $current_time,
                'tinh_date_modified' => $current_time
                    )
            );
        }
    }

    public function importhAction() {
        $dir = '/excel'; //thu muc uploads
        $dir_upload = IMPORT_PATH . $dir; //duong dan
        $full_path = $dir_upload . '/huyen.xlsx';
        $objPHPExcel = PHPExcel_IOFactory::load($full_path);
        $sheetData = $objPHPExcel->getActiveSheet()->toArray(null, true, true, true);
        $huyenModel = new Front_Model_Huyen();
        foreach ($sheetData as $row) {
            $current_time = new Zend_Db_Expr('NOW()');
            $huyenModel->insert(array(
                'huyen_name' => $row['B'],
                'huyen_parent' => $row['A'],
                'huyen_status' => 1,
                'huyen_order' => 0,
                'huyen_date_added' => $current_time,
                'huyen_date_modified' => $current_time
                    )
            );
        }
    }

    public function importdAction() {
        $dir = '/excel'; //thu muc uploads
        $dir_upload = IMPORT_PATH . $dir; //duong dan
        $full_path = $dir_upload . '/dantoc.xlsx';
        $objPHPExcel = PHPExcel_IOFactory::load($full_path);
        $sheetData = $objPHPExcel->getActiveSheet()->toArray(null, true, true, true);
        $dantocModel = new Front_Model_Dantoc();
        foreach ($sheetData as $row) {
            $current_time = new Zend_Db_Expr('NOW()');
            $dantocModel->insert(array(
                'dt_name' => $row['A'],
                'dt_status' => 1,
                'dt_order' => 0,
                'dt_date_added' => $current_time,
                'dt_date_modified' => $current_time
                    )
            );
        }
    }

    public function editAction() {

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => 'hethong/layout',
            'layoutPath' => $layoutPath);

        Zend_Layout::startMvc($option);
        $translate = Zend_Registry::get('Zend_Translate');
        $this->view->title = 'Quản lý tỉnh/thành phố - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $id = $this->_getParam('id', 0);

        $tinhModel = new Front_Model_Tinh();
        $error_message = array();
        $success_message = '';

        $tinh_info = $tinhModel->fetchRow('tinh_id=' . $id);
        if (!$tinh_info) {
            $error_message[] = 'Không tìm thấy thông tin.';
        }

        if ($this->_request->isPost()) {
            $tinh_name = trim($this->_arrParam['tinh_name']);
            $tinh_order = trim($this->_arrParam['tinh_order']);
            $tinh_status = $this->_arrParam['tinh_status'];

            if (!is_numeric($tinh_order)) {
                $tinh_order = 0;
            }

            $validator_length = new Zend_Validate_StringLength(array('min' => 4, 'max' => 100));

            //kiem tra dữ liệu
            if (!$validator_length->isValid($tinh_name)) {
                $error_message[] = 'Tên tỉnh/thành phố phải bằng hoặc hơn 4 ký tự và nhỏ hơn hoặc bằng 100 ký tự.';
            }

            if (!sizeof($error_message)) {
                $current_time = new Zend_Db_Expr('NOW()');
                $tinhModel->update(array(
                    'tinh_name' => $tinh_name,
                    'tinh_status' => $tinh_status,
                    'tinh_order' => $tinh_order,
                    'tinh_date_modified' => $current_time
                        ), 'tinh_id=' . $id
                );

                $tinh_info->tinh_name = $tinh_name;
                $tinh_info->tinh_status = $tinh_status;
                $tinh_info->tinh_order = $tinh_order;

                $success_message = 'Đã cập nhật thông tin thành công.';
            }
        }


        $this->view->tinh_info = $tinh_info;
        $this->view->success_message = $success_message;
        $this->view->error_message = $error_message;
    }

    public function deleteAction() {

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => 'hethong/layout',
            'layoutPath' => $layoutPath);

        Zend_Layout::startMvc($option);
        $translate = Zend_Registry::get('Zend_Translate');
        $this->view->title = 'Quản lý tỉnh/thành phố - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $id = $this->_getParam('id', 0);

        $tinhModel = new Front_Model_Tinh();
        $error_message = array();

        $tinh_info = $tinhModel->fetchRow('tinh_id=' . $id);
        if (!$tinh_info) {
            $error_message[] = 'Không tìm thấy thông tin.';
        }

        if ($this->_request->isPost()) {
            $del = $this->getRequest()->getPost('del');
            if ($del == 'Yes') {
                $id = $this->getRequest()->getPost('id');
                $tinhModel->delete('tinh_id=' . $id);
            }
            $this->_redirect('hethong/tinh/index/page/' . $this->_page);
        }


        $this->view->tinh_info = $tinh_info;
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
        $tinhModel = new Front_Model_Tinh();
        $tinhModel->update(array('tinh_status' => $type, 'tinh_date_modified' => $current_time), 'tinh_id=' . $id);
        $this->_redirect('hethong/tinh/index/page/' . $this->_page);
    }

    function deleteitemsAction() {
        $this->_helper->layout()->disableLayout();
        $tinhModel = new Front_Model_Tinh();
        if ($this->_request->isPost()) {
            $item = $this->getRequest()->getPost('cid');
            foreach ($item as $k => $v) {
                $tinhModel->delete('tinh_id=' . $v);
            }
        }
        $this->_redirect('hethong/tinh/index/page/' . $this->_page);
    }

    public function huyenAction() {
        $translate = Zend_Registry::get('Zend_Translate');
        $this->view->title = 'Quản lý quận/huyện - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => 'hethong/layout',
            'layoutPath' => $layoutPath);

        Zend_Layout::startMvc($option);

        $tinh_id = $this->_getParam('parent', 0);

        $tinhModel = new Front_Model_Tinh();
        $tinh = $tinhModel->fetchRow('tinh_id=' . $tinh_id);
        if (!$tinh) {
            $this->_redirect('hethong/tinh/');
        }
        $huyenModel = new Front_Model_Huyen();
        $list_huyen = $huyenModel->fetchData(array('huyen_parent' => $tinh_id), 'huyen_order ASC');

        $paginator = Zend_Paginator::factory($list_huyen);
        $paginator->setItemCountPerPage(NUM_PER_PAGE);
        $paginator->setCurrentPageNumber($this->_page);
        $this->view->parent = $tinh_id;
        $this->view->page = $this->_page;
        $this->view->paginator = $paginator;
    }

    public function haddAction() {

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => 'hethong/layout',
            'layoutPath' => $layoutPath);

        Zend_Layout::startMvc($option);
        $translate = Zend_Registry::get('Zend_Translate');
        $this->view->title = 'Quản lý quận/huyện - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $tinh_id = $this->_getParam('parent', 0);
        $tinhModel = new Front_Model_Tinh();

        $list_tinh = $tinhModel->fetchData(array(), 'tinh_order ASC');
        $huyenModel = new Front_Model_Huyen();
        $error_message = array();
        $success_message = '';
        if ($this->_request->isPost()) {
            $huyen_name = trim($this->_arrParam['huyen_name']);
            $huyen_parent = $this->_arrParam['tinh'];
            $huyen_order = trim($this->_arrParam['huyen_order']);
            $huyen_status = $this->_arrParam['huyen_status'];

            $validator_length = new Zend_Validate_StringLength(array('min' => 2, 'max' => 100));
            if (!is_numeric($huyen_order)) {
                $huyen_order = 0;
            }

            //kiem tra dữ liệu
            if (!$validator_length->isValid($huyen_name)) {
                $error_message[] = 'Tên quận huyện phải bằng hoặc hơn 2 ký tự và nhỏ hơn hoặc bằng 100 ký tự.';
            }

            if (!sizeof($error_message)) {
                $current_time = new Zend_Db_Expr('NOW()');
                $huyenModel->insert(array(
                    'huyen_name' => $huyen_name,
                    'huyen_parent' => $huyen_parent,
                    'huyen_status' => $huyen_status,
                    'huyen_order' => $huyen_order,
                    'huyen_date_added' => $current_time,
                    'huyen_date_modified' => $current_time
                        )
                );
                $success_message = 'Đã thêm mới thành công.';
            }
        }
        $this->view->list_tinh = $list_tinh;
        $this->view->parent = $tinh_id;
        $this->view->success_message = $success_message;
        $this->view->success_message = $success_message;
        $this->view->error_message = $error_message;
    }

    public function heditAction() {

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => 'hethong/layout',
            'layoutPath' => $layoutPath);

        Zend_Layout::startMvc($option);
        $translate = Zend_Registry::get('Zend_Translate');
        $this->view->title = 'Quản lý quận/huyện - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $tinh_id = $this->_getParam('parent', 0);
        $id = $this->_getParam('id', 0);

        $tinhModel = new Front_Model_Tinh();
        $list_tinh = $tinhModel->fetchData(array(), 'tinh_order ASC');

        $huyenModel = new Front_Model_Huyen();

        $error_message = array();
        $success_message = '';

        $huyen_info = $huyenModel->fetchRow('huyen_id=' . $id);
        if (!$huyen_info) {
            $error_message[] = 'Không tìm thấy thông tin.';
        }

        if ($this->_request->isPost()) {
            $huyen_name = trim($this->_arrParam['huyen_name']);
            $huyen_parent = $this->_arrParam['tinh'];
            $huyen_order = trim($this->_arrParam['huyen_order']);
            $huyen_status = $this->_arrParam['huyen_status'];

            $validator_length = new Zend_Validate_StringLength(array('min' => 2, 'max' => 100));
            if (!is_numeric($huyen_order)) {
                $huyen_order = 0;
            }

            //kiem tra dữ liệu
            if (!$validator_length->isValid($huyen_name)) {
                $error_message[] = 'Tên quận huyện phải bằng hoặc hơn 2 ký tự và nhỏ hơn hoặc bằng 100 ký tự.';
            }

            if (!sizeof($error_message)) {
                $current_time = new Zend_Db_Expr('NOW()');
                $huyenModel->update(array(
                    'huyen_name' => $huyen_name,
                    'huyen_parent' => $huyen_parent,
                    'huyen_status' => $huyen_status,
                    'huyen_order' => $huyen_order,
                    'huyen_date_added' => $current_time,
                    'huyen_date_modified' => $current_time
                        ), 'huyen_id=' . $id
                );

                $huyen_info->huyen_name = $huyen_name;
                $huyen_info->huyen_parent = $huyen_parent;
                $huyen_info->huyen_status = $huyen_status;
                $huyen_info->huyen_order = $huyen_order;

                $success_message = 'Đã cập nhật thông tin thành công.';
            }
        }

        $this->view->list_tinh = $list_tinh;
        $this->view->parent = $tinh_id;
        $this->view->huyen_info = $huyen_info;
        $this->view->success_message = $success_message;
        $this->view->error_message = $error_message;
    }

    public function hdeleteAction() {

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => 'hethong/layout',
            'layoutPath' => $layoutPath);

        Zend_Layout::startMvc($option);
        $translate = Zend_Registry::get('Zend_Translate');
        $this->view->title = 'Quản lý quận/huyện - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $tinh_id = $this->_getParam('parent', 0);
        $id = $this->_getParam('id', 0);

        $huyenModel = new Front_Model_Huyen();
        $error_message = array();

        $huyen_info = $huyenModel->fetchRow('huyen_id=' . $id);
        if (!$huyen_info) {
            $error_message[] = 'Không tìm thấy thông tin.';
        }

        if ($this->_request->isPost()) {
            $del = $this->getRequest()->getPost('del');
            if ($del == 'Yes') {
                $id = $this->getRequest()->getPost('id');
                $huyenModel->delete('huyen_id=' . $id);
            }
            $this->_redirect('hethong/tinh/huyen/parent/' . $tinh_id . '/page/' . $this->_page);
        }

        $this->view->parent = $tinh_id;
        $this->view->huyen_info = $huyen_info;
        $this->view->error_message = $error_message;
    }

    function hchangestatusAction() {
        $this->_helper->layout()->disableLayout();
        $type = $this->_request->getParam('status', 1);
        $id = $this->_request->getParam('id', 0);
        $tinh_id = $this->_getParam('parent', 0);
        if ($type > 0) {
            $type = 1;
        } else {
            $type = 0;
        }
        $current_time = new Zend_Db_Expr('NOW()');
        $huyenModel = new Front_Model_Huyen();
        $huyenModel->update(array('huyen_status' => $type, 'huyen_date_modified' => $current_time), 'huyen_id=' . $id);
        $this->_redirect('hethong/tinh/huyen/parent/' . $tinh_id . '/page/' . $this->_page);
    }

    function hdeleteitemsAction() {
        $this->_helper->layout()->disableLayout();
        $huyenModel = new Front_Model_Huyen();
        $tinh_id = $this->_getParam('parent', 0);
        if ($this->_request->isPost()) {
            $item = $this->getRequest()->getPost('cid');
            foreach ($item as $k => $v) {
                $huyenModel->delete('huyen_id=' . $v);
            }
        }
        $this->_redirect('hethong/tinh/huyen/parent/' . $tinh_id . '/page/' . $this->_page);
    }

}