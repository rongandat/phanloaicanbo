<?php

class Tochuccanbo_Heso02Controller extends Zend_Controller_Action {

    protected $_arrParam;
    protected $_page = 1;
    protected $_kw = '';
    protected $_actionMain;

    public function init() {
        $auth = Zend_Auth::getInstance();
        $identity = $auth->getIdentity();

        //kiem tra permission
        $check_permission = $this->_helper->global->checkPermission($identity->group_id, '4015');
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
        $this->view->title = 'Quản lý hệ số 0.2 - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => '1_column/layout',
            'layoutPath' => $layoutPath);

        Zend_Layout::startMvc($option);

        $hesoModel = new Front_Model_HeSo02();
        $list_he_so = $hesoModel->fetchAll();

        $paginator = Zend_Paginator::factory($list_he_so);
        $paginator->setItemCountPerPage(NUM_PER_PAGE);
        $paginator->setCurrentPageNumber($this->_page);
        $this->view->page = $this->_page;
        $this->view->paginator = $paginator;
    }

    public function addAction() {

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => '1_column/layout',
            'layoutPath' => $layoutPath);

        Zend_Layout::startMvc($option);
        $translate = Zend_Registry::get('Zend_Translate');
        $this->view->title = 'Quản lý hệ số 0.2 - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $hesoModel = new Front_Model_HeSo02();
        $error_message = array();
        $success_message = '';
        if ($this->_request->isPost()) {
            $hs_nam = trim($this->_arrParam['hs_nam']);
            $hs_thang_1 = trim($this->_arrParam['hs_thang_1']);
            $hs_thang_2 = trim($this->_arrParam['hs_thang_2']);
            $hs_thang_3 = trim($this->_arrParam['hs_thang_3']);
            $hs_thang_4 = trim($this->_arrParam['hs_thang_4']);
            $hs_thang_5 = trim($this->_arrParam['hs_thang_5']);
            $hs_thang_6 = trim($this->_arrParam['hs_thang_6']);
            $hs_thang_7 = trim($this->_arrParam['hs_thang_7']);
            $hs_thang_8 = trim($this->_arrParam['hs_thang_8']);
            $hs_thang_9 = trim($this->_arrParam['hs_thang_9']);
            $hs_thang_10 = trim($this->_arrParam['hs_thang_10']);
            $hs_thang_11 = trim($this->_arrParam['hs_thang_11']);
            $hs_thang_12 = trim($this->_arrParam['hs_thang_12']);

            $check_nam = $hesoModel->fetchRow("nam=$hs_nam");

            if ($check_nam) {
                $error_message[] = 'Hệ số năm ' . $hs_nam . ' đã tồn tại.';
            }

            if (!is_numeric($hs_thang_1)) {
                $error_message[] = 'Hệ số tháng 1 phải có dạng số';
            }
            if (!is_numeric($hs_thang_2)) {
                $error_message[] = 'Hệ số tháng 2 phải có dạng số';
            }
            if (!is_numeric($hs_thang_3)) {
                $error_message[] = 'Hệ số tháng 3 phải có dạng số';
            }
            if (!is_numeric($hs_thang_4)) {
                $error_message[] = 'Hệ số tháng 4 phải có dạng số';
            }
            if (!is_numeric($hs_thang_5)) {
                $error_message[] = 'Hệ số tháng 5 phải có dạng số';
            }
            if (!is_numeric($hs_thang_6)) {
                $error_message[] = 'Hệ số tháng 6 phải có dạng số';
            }
            if (!is_numeric($hs_thang_7)) {
                $error_message[] = 'Hệ số tháng 7 phải có dạng số';
            }
            if (!is_numeric($hs_thang_8)) {
                $error_message[] = 'Hệ số tháng 8 phải có dạng số';
            }
            if (!is_numeric($hs_thang_9)) {
                $error_message[] = 'Hệ số tháng 9 phải có dạng số';
            }
            if (!is_numeric($hs_thang_10)) {
                $error_message[] = 'Hệ số tháng 10 phải có dạng số';
            }
            if (!is_numeric($hs_thang_11)) {
                $error_message[] = 'Hệ số tháng 11 phải có dạng số';
            }
            if (!is_numeric($hs_thang_12)) {
                $error_message[] = 'Hệ số tháng 12 phải có dạng số';
            }


            if (!sizeof($error_message)) {
                $hesoModel->insert(array(
                    'nam' => $hs_nam,
                    'thang_1' => $hs_thang_1,
                    'thang_2' => $hs_thang_2,
                    'thang_3' => $hs_thang_3,
                    'thang_4' => $hs_thang_4,
                    'thang_5' => $hs_thang_5,
                    'thang_6' => $hs_thang_6,
                    'thang_7' => $hs_thang_7,
                    'thang_8' => $hs_thang_8,
                    'thang_9' => $hs_thang_9,
                    'thang_10' => $hs_thang_10,
                    'thang_11' => $hs_thang_11,
                    'thang_12' => $hs_thang_12
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
        $option = array('layout' => '1_column/layout',
            'layoutPath' => $layoutPath);

        Zend_Layout::startMvc($option);
        $translate = Zend_Registry::get('Zend_Translate');
        $this->view->title = 'Quản lý hệ số 0.2 - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $id = $this->_getParam('id', 0);

        $hesoModel = new Front_Model_HeSo02();
        $error_message = array();
        $success_message = '';

        $he_so = $hesoModel->fetchRow('id=' . $id);
        if (!$he_so) {
            $error_message[] = 'Không tìm thấy thông tin.';
        }

        if ($this->_request->isPost()) {
            $hs_nam = trim($this->_arrParam['hs_nam']);
            $hs_thang_1 = trim($this->_arrParam['hs_thang_1']);
            $hs_thang_2 = trim($this->_arrParam['hs_thang_2']);
            $hs_thang_3 = trim($this->_arrParam['hs_thang_3']);
            $hs_thang_4 = trim($this->_arrParam['hs_thang_4']);
            $hs_thang_5 = trim($this->_arrParam['hs_thang_5']);
            $hs_thang_6 = trim($this->_arrParam['hs_thang_6']);
            $hs_thang_7 = trim($this->_arrParam['hs_thang_7']);
            $hs_thang_8 = trim($this->_arrParam['hs_thang_8']);
            $hs_thang_9 = trim($this->_arrParam['hs_thang_9']);
            $hs_thang_10 = trim($this->_arrParam['hs_thang_10']);
            $hs_thang_11 = trim($this->_arrParam['hs_thang_11']);
            $hs_thang_12 = trim($this->_arrParam['hs_thang_12']);

            $check_nam = $hesoModel->fetchRow("nam=$hs_nam and id!=$id");

            if ($check_nam) {
                $error_message[] = 'Hệ số năm ' . $hs_nam . ' đã tồn tại.';
            }

            if (!is_numeric($hs_thang_1)) {
                $error_message[] = 'Hệ số tháng 1 phải có dạng số';
            }
            if (!is_numeric($hs_thang_2)) {
                $error_message[] = 'Hệ số tháng 2 phải có dạng số';
            }
            if (!is_numeric($hs_thang_3)) {
                $error_message[] = 'Hệ số tháng 3 phải có dạng số';
            }
            if (!is_numeric($hs_thang_4)) {
                $error_message[] = 'Hệ số tháng 4 phải có dạng số';
            }
            if (!is_numeric($hs_thang_5)) {
                $error_message[] = 'Hệ số tháng 5 phải có dạng số';
            }
            if (!is_numeric($hs_thang_6)) {
                $error_message[] = 'Hệ số tháng 6 phải có dạng số';
            }
            if (!is_numeric($hs_thang_7)) {
                $error_message[] = 'Hệ số tháng 7 phải có dạng số';
            }
            if (!is_numeric($hs_thang_8)) {
                $error_message[] = 'Hệ số tháng 8 phải có dạng số';
            }
            if (!is_numeric($hs_thang_9)) {
                $error_message[] = 'Hệ số tháng 9 phải có dạng số';
            }
            if (!is_numeric($hs_thang_10)) {
                $error_message[] = 'Hệ số tháng 10 phải có dạng số';
            }
            if (!is_numeric($hs_thang_11)) {
                $error_message[] = 'Hệ số tháng 11 phải có dạng số';
            }
            if (!is_numeric($hs_thang_12)) {
                $error_message[] = 'Hệ số tháng 12 phải có dạng số';
            }

            if (!sizeof($error_message)) {
                $hesoModel->update(array(
                    'nam' => $hs_nam,
                    'thang_1' => $hs_thang_1,
                    'thang_2' => $hs_thang_2,
                    'thang_3' => $hs_thang_3,
                    'thang_4' => $hs_thang_4,
                    'thang_5' => $hs_thang_5,
                    'thang_6' => $hs_thang_6,
                    'thang_7' => $hs_thang_7,
                    'thang_8' => $hs_thang_8,
                    'thang_9' => $hs_thang_9,
                    'thang_10' => $hs_thang_10,
                    'thang_11' => $hs_thang_11,
                    'thang_12' => $hs_thang_12
                        ), 'id=' . $id
                );

                $he_so = $hesoModel->fetchRow('id=' . $id);
                $success_message = 'Đã cập nhật thông tin thành công.';
            }
        }

        $this->view->he_so = $he_so;
        $this->view->success_message = $success_message;
        $this->view->error_message = $error_message;
    }

    public function deleteAction() {

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => '1_column/layout',
            'layoutPath' => $layoutPath);

        Zend_Layout::startMvc($option);
        $translate = Zend_Registry::get('Zend_Translate');
        $this->view->title = 'Quản lý hệ số 0.2 - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $id = $this->_getParam('id', 0);

        $hesoModel = new Front_Model_HeSo02();
        $error_message = array();

        $he_so = $hesoModel->fetchRow('id=' . $id);
        if (!$he_so) {
            $error_message[] = 'Không tìm thấy thông tin.';
        }

        if ($this->_request->isPost()) {
            $del = $this->getRequest()->getPost('del');
            if ($del == 'Yes') {
                $id = $this->getRequest()->getPost('id');
                $hesoModel->delete('id=' . $id);
            }
            $this->_redirect('tochuccanbo/heso02/index/page/' . $this->_page);
        }


        $this->view->he_so = $he_so;
        $this->view->error_message = $error_message;
    }

    function deleteitemsAction() {
        $this->_helper->layout()->disableLayout();
        $hesoModel = new Front_Model_HeSo02();
        if ($this->_request->isPost()) {
            $item = $this->getRequest()->getPost('cid');
            foreach ($item as $k => $v) {
                $hesoModel->delete('id=' . $v);
            }
        }
        $this->_redirect('tochuccanbo/heso02/index/page/' . $this->_page);
    }

}