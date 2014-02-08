<?php

class Canhan_ChamcongController extends Zend_Controller_Action {

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
        $this->view->title = 'Chấm công - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => '1_column/layout',
            'layoutPath' => $layoutPath);
        Zend_Layout::startMvc($option);
        
        $date = time();
        $thang = $this->_getParam('thang', date('m', $date));
        $nam = $this->_getParam('nam', date('Y', $date));
        
        $auth = Zend_Auth::getInstance();
        $identity = $auth->getIdentity();
        $em_id = $identity->em_id;
        
        $holidaysModel = new Front_Model_Holidays();
        $list_holidays = $holidaysModel->fetchData(array(), 'hld_order ASC');
        $xinnghiphepModel = new Front_Model_XinNghiPhep();
        $list_nghi_phep = $xinnghiphepModel->fetchByDate($em_id, "$nam-$thang-01 00:00:00", "$nam-$thang-31 23:59:59");
                
        $chamcongModel = new Front_Model_ChamCong();
        $cham_cong = $chamcongModel->fetchOneData(array('c_em_id'=>$em_id, 'c_thang'=> $thang, 'c_nam' =>$nam));
        $this->view->thang = $thang;
        $this->view->nam = $nam;
        $this->view->cham_cong = $cham_cong;
        $this->view->list_holidays = $list_holidays;
        $this->view->list_nghi_phep = $list_nghi_phep;
    }

}