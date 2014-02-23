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
        $check_permission = $this->_helper->global->checkPermission($identity->group_id, '2001');
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
        $this->view->title = 'Quản lý thông báo - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => 'canhan/layout',
            'layoutPath' => $layoutPath);
        Zend_Layout::startMvc($option);

        $auth = Zend_Auth::getInstance();
        $identity = $auth->getIdentity();
        $em_id = $identity->em_id;

        $thongbaoModel = new Front_Model_ThongBao();
        $list_thong_bao = $thongbaoModel->fetchData(array('tb_to' => $em_id), 'tb_date_added DESC');
        $paginator = Zend_Paginator::factory($list_thong_bao);
        $paginator->setItemCountPerPage(NUM_PER_PAGE);
        $paginator->setCurrentPageNumber($this->_page);
        $this->view->page = $this->_page;
        $this->view->paginator = $paginator;
        $this->view->list_thong_bao = $list_thong_bao;
    }

    function viewAction() {
        $translate = Zend_Registry::get('Zend_Translate');
        $this->view->title = 'Quản lý thông báo - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => 'canhan/layout',
            'layoutPath' => $layoutPath);
        Zend_Layout::startMvc($option);

        $auth = Zend_Auth::getInstance();
        $identity = $auth->getIdentity();
        $em_id = $identity->em_id;
        $tb_id = $this->_getParam('id', 0);
        $thongbaoModel = new Front_Model_ThongBao();
        $thong_bao = $thongbaoModel->fetchOneRow(array('tb_to' => $em_id, 'tb_id' => $tb_id));
        if ($thong_bao) {
            $thongbaoModel->update(array('tb_status' => 1), 'tb_id=' . $thong_bao['tb_id']);
        }
        $this->view->thong_bao = $thong_bao;
        $this->view->page = $this->_page;
    }

    public function deleteAction() {
        $translate = Zend_Registry::get('Zend_Translate');
        $this->view->title = 'Quản lý thông báo - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => 'canhan/layout',
            'layoutPath' => $layoutPath);
        Zend_Layout::startMvc($option);

        $auth = Zend_Auth::getInstance();
        $identity = $auth->getIdentity();
        $em_id = $identity->em_id;
        $tb_id = $this->_getParam('id', 0);

        $thongbaoModel = new Front_Model_ThongBao();
        $thong_bao = $thongbaoModel->fetchOneRow(array('tb_to' => $em_id, 'tb_id' => $tb_id));
        $error_message = array();

        if (!$thong_bao) {
            $error_message[] = 'Không tìm thấy thông tin.';
        }

        if ($this->_request->isPost()) {
            $del = $this->getRequest()->getPost('del');
            if ($del == 'Yes') {
                $id = $this->getRequest()->getPost('id');
                $thongbaoModel->delete('tb_id = ' . $id . ' and tb_to=' . $em_id);
            }
            $this->_redirect('canhan/thongbao/index/page/' . $this->_page);
        }

        $this->view->thong_bao = $thong_bao;
        $this->view->page = $this->_page;
        $this->view->error_message = $error_message;
    }

    public function jqdeleteAction() {
        $this->_helper->layout()->disableLayout();
        $auth = Zend_Auth::getInstance();
        $identity = $auth->getIdentity();
        $em_id = $identity->em_id;
        $thongbaoModel = new Front_Model_ThongBao();
        if ($this->_request->isPost()) {
            $tb_id = $this->_getParam('tb_id', 0);
            $success_message = $thongbaoModel->delete('tb_id = ' . $tb_id . ' and tb_to=' . $em_id);
            $this->view->success_message = $success_message;
        }
    }

    function deleteitemsAction() {
        $this->_helper->layout()->disableLayout();
        $auth = Zend_Auth::getInstance();
        $identity = $auth->getIdentity();
        $em_id = $identity->em_id;

        $thongbaoModel = new Front_Model_ThongBao();
        if ($this->_request->isPost()) {
            $item = $this->getRequest()->getPost('cid');
            foreach ($item as $k => $v) {
                $thongbaoModel->delete('tb_id = ' . $v . ' and tb_to=' . $em_id);
            }
        }
        $this->_redirect('canhan/thongbao/index/page/' . $this->_page);
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
            $list_to = explode(',', $em_id);
            foreach ($list_to as $to_id) {
                if ($to_id) {
                    $data['tb_from'] = $from_id;
                    $data['tb_to'] = $to_id;
                    $data['tb_tieu_de'] = $tb_title;
                    $data['tb_noi_dung'] = $tb_content;
                    $data['tb_status'] = 0;
                    $data['tb_date_added'] = $current_time;
                    $data['tb_date_modified'] = $current_time;
                    $success_message = $thongbao_model->insert($data);
                }
            }
            $this->view->success_message = $success_message;
        }
    }

}