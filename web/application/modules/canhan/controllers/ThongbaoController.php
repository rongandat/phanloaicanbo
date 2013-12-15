<?php

class Canhan_ThongbaoController extends Zend_Controller_Action {

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
        $this->view->title = 'Quản lý tài khoản - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => 'canhan/layout',
            'layoutPath' => $layoutPath);

        Zend_Layout::startMvc($option);
        $this->view->page = $this->_page;
    }

    public function jqnewtbAction() {
        $this->_helper->layout()->disableLayout();
        $thongbao_model = new Front_Model_ThongBao();
        if ($this->_request->isPost()) {
            $data = array();
            $em_id = $this->_arrParam['em_id'];
            $tb_title = $this->_arrParam['tb_title'];
            $tb_content = $this->_arrParam['tb_content'];
            $current_time = new Zend_Db_Expr('NOW()');
            $auth = Zend_Auth::getInstance();
            $identity = $auth->getIdentity();
            $from_id = $identity->em_id;
            $data['tb_from']= $from_id;
            $data['tb_to']= $em_id;
            $data['tb_tieu_de']= $tb_title;
            $data['tb_noi_dung']= $tb_content;
            $data['tb_status']= 0;
            $data['tb_date_added']= $current_time;
            $data['tb_date_modified']= $current_time;
            $success_message = $thongbao_model->insert($data);
            $this->view->success_message = $success_message;
        }
    }

}