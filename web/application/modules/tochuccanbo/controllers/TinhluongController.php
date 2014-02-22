<?php

class Tochuccanbo_TinhluongController extends Zend_Controller_Action {

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
        $this->view->title = 'Tính lương - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => '1_column/layout',
            'layoutPath' => $layoutPath);
        Zend_Layout::startMvc($option);

        $date = time();
        $thang = $this->_getParam('thang', date('m', $date));
        $nam = $this->_getParam('nam', date('Y', $date));
        $em_id = $this->_getParam('id', 0);
        $emModel = new Front_Model_Employees();
        $hesocbModel = new Front_Model_HeSo();
        $hesoModel = new Front_Model_EmployeesHeso();
        $em_info = $emModel->fetchRow("em_id=$em_id");
        $em_he_so = $hesoModel->fetchRow("eh_em_id=$em_id");
        $lastHeSoLuong = $hesocbModel->fetchOneData(array('hs_ngay_bat_dau' => date("$nam-$thang-1")), 'hs_ngay_bat_dau DESC');

        $this->view->em_info = $em_info;
        $this->view->he_so = $em_he_so;
        $this->view->he_so_cb = $lastHeSoLuong;
        $this->view->thang = $thang;
        $this->view->nam = $nam;
        $this->view->nv_id = $em_id;
    }

}