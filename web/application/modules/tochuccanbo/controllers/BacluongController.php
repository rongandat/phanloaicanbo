<?php

class Tochuccanbo_BacluongController extends Zend_Controller_Action {

    protected $_arrParam;
    protected $_page = 1;
    protected $_kw = '';
    protected $_actionMain;

    public function init() {
        $auth = Zend_Auth::getInstance();
        $identity = $auth->getIdentity();

        //kiem tra permission
        $check_permission = $this->_helper->global->checkPermission($identity->group_id, '4012');
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
        $this->view->title = 'Quản lý bậc lương - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => '1_column/layout',
            'layoutPath' => $layoutPath);
        Zend_Layout::startMvc($option);

        $bacluongModel = new Front_Model_BacLuong();
        $list_bacluong = $bacluongModel->fetchAll();
        $this->view->list_bac_luong = $list_bacluong;
    }

    public function addAction() {
        $translate = Zend_Registry::get('Zend_Translate');
        $this->view->title = 'Quản lý bậc lương - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => '1_column/layout',
            'layoutPath' => $layoutPath);
        Zend_Layout::startMvc($option);

        $bacluongModel = new Front_Model_BacLuong();
        $error_message = array();
        $success_message = '';
        if ($this->_request->isPost()) {
            $bl_name = trim($this->_arrParam['bl_name']);
            $bl_he_so_luong = $this->_arrParam['bl_he_so_luong'];
            $bl_pc_chuc_vu = $this->_arrParam['bl_pc_chuc_vu'];
            $bl_pc_trach_nhiem = $this->_arrParam['bl_pc_trach_nhiem'];
            $bl_pc_khu_vuc = $this->_arrParam['bl_pc_khu_vuc'];
            $bl_pc_tnvk = $this->_arrParam['bl_pc_tnvk'];
            $bl_pc_udn = $this->_arrParam['bl_pc_udn'];
            $bl_pc_cong_vu = $this->_arrParam['bl_pc_cong_vu'];
            $bl_pc_kiem_nhiem = $this->_arrParam['bl_pc_kiem_nhiem'];
            $bl_pc_khac = $this->_arrParam['bl_pc_khac'];
            $bl_pc_khac_type = $this->_arrParam['bl_pc_khac_type'];
            $bl_pc_thu_hut = $this->_arrParam['bl_pc_thu_hut'];
            $bl_status = $this->_arrParam['bl_status'];
            $bl_order = trim($this->_arrParam['bl_order']);

            if (!$bl_name) {
                $error_message[] = 'Tên bậc lương không được để trống.';
            }

            $valid = new Zend_Validate_Float();

            if (!$valid->isValid($bl_he_so_luong)) {
                $error_message[] = 'Hệ số lương phải có dạng số.';
            }

            if (!$valid->isValid($bl_pc_thu_hut)) {
                $error_message[] = 'Phụ cấp thu hút lương phải có dạng số.';
            }

            if (!$valid->isValid($bl_pc_chuc_vu)) {
                $error_message[] = 'Phụ cấp chức vụ phải có dạng số.';
            }
            if (!$valid->isValid($bl_pc_trach_nhiem)) {
                $error_message[] = 'Phụ cấp trách nhiệm phải có dạng số.';
            }
            if (!$valid->isValid($bl_pc_khu_vuc)) {
                $error_message[] = 'Phụ cấp khu vực phải có dạng số.';
            }
            if (!$valid->isValid($bl_pc_tnvk)) {
                $error_message[] = 'Phụ cấp thâm niên vượt khung lương phải có dạng số.';
            }
            if (!$valid->isValid($bl_pc_udn)) {
                $error_message[] = 'Phụ cấp ưu đãi nghề lương phải có dạng số.';
            }
            if (!$valid->isValid($bl_pc_cong_vu)) {
                $error_message[] = 'Phụ cấp công vụ lương phải có dạng số.';
            }
            if (!$valid->isValid($bl_pc_kiem_nhiem)) {
                $error_message[] = 'Phụ cấp kiêm nhiệm lương phải có dạng số.';
            }
            if (!$valid->isValid($bl_pc_khac)) {
                $error_message[] = 'Phụ cấp khác lương phải có dạng số.';
            }
            if (!sizeof($error_message)) {
                $current_time = new Zend_Db_Expr('NOW()');
                $data = array(
                    'bl_name' => $bl_name,
                    'bl_he_so_luong' => $bl_he_so_luong,
                    'bl_pc_chuc_vu' => $bl_pc_chuc_vu,
                    'bl_pc_trach_nhiem' => $bl_pc_trach_nhiem,
                    'bl_pc_khu_vuc' => $bl_pc_khu_vuc,
                    'bl_pc_tnvk' => $bl_pc_tnvk,
                    'bl_pc_udn' => $bl_pc_udn,
                    'bl_pc_cong_vu' => $bl_pc_cong_vu,
                    'bl_pc_kiem_nhiem' => $bl_pc_kiem_nhiem,
                    'bl_pc_khac' => $bl_pc_khac,
                    'bl_pc_khac_type' => $bl_pc_khac_type,
                    'bl_pc_thu_hut' => $bl_pc_thu_hut,
                    'bl_status' => $bl_status,
                    'bl_order' => $bl_order,
                    'bl_date_added' => $current_time,
                    'bl_date_modified' => $current_time
                );
                $bacluongModel->insert($data);
                $success_message = 'Đã thêm mới thành công.';
            }
        }
        $this->view->success_message = $success_message;
        $this->view->error_message = $error_message;
    }

    public function editAction() {

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => '1_column/layout',
            'layoutPath' => $layoutPath);

        Zend_Layout::startMvc($option);
        $translate = Zend_Registry::get('Zend_Translate');
        $this->view->title = 'Quản lý bậc lương - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $id = $this->_getParam('id', 0);

        $bacluongModel = new Front_Model_BacLuong();
        $error_message = array();
        $success_message = '';

        $bl_info = $bacluongModel->fetchRow('bl_id=' . $id);
        if (!$bl_info) {
            $error_message[] = 'Không tìm thấy thông tin.';
        }

        if ($this->_request->isPost()) {
            $bl_name = trim($this->_arrParam['bl_name']);
            $bl_he_so_luong = $this->_arrParam['bl_he_so_luong'];
            $bl_pc_chuc_vu = $this->_arrParam['bl_pc_chuc_vu'];
            $bl_pc_trach_nhiem = $this->_arrParam['bl_pc_trach_nhiem'];
            $bl_pc_khu_vuc = $this->_arrParam['bl_pc_khu_vuc'];
            $bl_pc_tnvk = $this->_arrParam['bl_pc_tnvk'];
            $bl_pc_udn = $this->_arrParam['bl_pc_udn'];
            $bl_pc_cong_vu = $this->_arrParam['bl_pc_cong_vu'];
            $bl_pc_kiem_nhiem = $this->_arrParam['bl_pc_kiem_nhiem'];
            $bl_pc_khac = $this->_arrParam['bl_pc_khac'];
            $bl_pc_khac_type = $this->_arrParam['bl_pc_khac_type'];
            $bl_pc_thu_hut = $this->_arrParam['bl_pc_thu_hut'];
            $bl_status = $this->_arrParam['bl_status'];
            $bl_order = trim($this->_arrParam['bl_order']);

            if (!is_numeric($bl_order)) {
                $bl_order = 0;
            }

            $valid = new Zend_Validate_Float();

            if (!$valid->isValid($bl_he_so_luong)) {
                $error_message[] = 'Hệ số lương phải có dạng số.';
            }

            if (!$valid->isValid($bl_pc_thu_hut)) {
                $error_message[] = 'Phụ cấp thu hút lương phải có dạng số.';
            }

            if (!$valid->isValid($bl_pc_chuc_vu)) {
                $error_message[] = 'Phụ cấp chức vụ phải có dạng số.';
            }
            if (!$valid->isValid($bl_pc_trach_nhiem)) {
                $error_message[] = 'Phụ cấp trách nhiệm phải có dạng số.';
            }
            if (!$valid->isValid($bl_pc_khu_vuc)) {
                $error_message[] = 'Phụ cấp khu vực phải có dạng số.';
            }
            if (!$valid->isValid($bl_pc_tnvk)) {
                $error_message[] = 'Phụ cấp thâm niên vượt khung lương phải có dạng số.';
            }
            if (!$valid->isValid($bl_pc_udn)) {
                $error_message[] = 'Phụ cấp ưu đãi nghề lương phải có dạng số.';
            }
            if (!$valid->isValid($bl_pc_cong_vu)) {
                $error_message[] = 'Phụ cấp công vụ lương phải có dạng số.';
            }
            if (!$valid->isValid($bl_pc_kiem_nhiem)) {
                $error_message[] = 'Phụ cấp kiêm nhiệm lương phải có dạng số.';
            }
            if (!$valid->isValid($bl_pc_khac)) {
                $error_message[] = 'Phụ cấp khác lương phải có dạng số.';
            }

            if (!sizeof($error_message)) {
                $current_time = new Zend_Db_Expr('NOW()');
                $data = array(
                    'bl_name' => $bl_name,
                    'bl_he_so_luong' => $bl_he_so_luong,
                    'bl_pc_chuc_vu' => $bl_pc_chuc_vu,
                    'bl_pc_trach_nhiem' => $bl_pc_trach_nhiem,
                    'bl_pc_khu_vuc' => $bl_pc_khu_vuc,
                    'bl_pc_tnvk' => $bl_pc_tnvk,
                    'bl_pc_udn' => $bl_pc_udn,
                    'bl_pc_cong_vu' => $bl_pc_cong_vu,
                    'bl_pc_kiem_nhiem' => $bl_pc_kiem_nhiem,
                    'bl_pc_khac' => $bl_pc_khac,
                    'bl_pc_khac_type' => $bl_pc_khac_type,
                    'bl_pc_thu_hut' => $bl_pc_thu_hut,
                    'bl_status' => $bl_status,
                    'bl_order' => $bl_order,
                    'bl_date_added' => $current_time,
                    'bl_date_modified' => $current_time
                );
                
                $bacluongModel->update($data, 'bl_id=' . $id);
                $bl_info = $bacluongModel->fetchRow('bl_id=' . $id);
                $success_message = 'Đã cập nhật thông tin thành công.';
            }
        }

        $this->view->bl_info = $bl_info;
        $this->view->success_message = $success_message;
        $this->view->error_message = $error_message;
    }

    public function deleteAction() {

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => '1_column/layout',
            'layoutPath' => $layoutPath);

        Zend_Layout::startMvc($option);
        $translate = Zend_Registry::get('Zend_Translate');
        $this->view->title = 'Quản lý bậc lương - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $id = $this->_getParam('id', 0);

        $bacluongModel = new Front_Model_BacLuong();
        $error_message = array();

        $bl_info = $bacluongModel->fetchRow('bl_id=' . $id);
        if (!$bl_info) {
            $error_message[] = 'Không tìm thấy thông tin.';
        }

        if ($this->_request->isPost()) {
            $del = $this->getRequest()->getPost('del');
            if ($del == 'Yes') {
                $id = $this->getRequest()->getPost('id');
                $bacluongModel->delete('bl_id=' . $id);
            }
            $this->_redirect('tochuccanbo/bacluong');
        }


        $this->view->bl_info = $bl_info;
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
        $bacluongModel = new Front_Model_BacLuong();
        $bacluongModel->update(array('bl_status' => $type, 'bl_date_modified' => $current_time), 'bl_id=' . $id);
        $this->_redirect('tochuccanbo/bacluong');
    }

    function deleteitemsAction() {
        $this->_helper->layout()->disableLayout();
        $bacluongModel = new Front_Model_BacLuong();
        if ($this->_request->isPost()) {
            $item = $this->getRequest()->getPost('cid');
            foreach ($item as $k => $v) {
                $bacluongModel->delete('bl_id=' . $v);
            }
        }
        $this->_redirect('tochuccanbo/bacluong');
    }

}