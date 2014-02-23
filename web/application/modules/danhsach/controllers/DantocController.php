<?php

class Danhsach_DantocController extends Zend_Controller_Action {

    protected $_arrParam;
    protected $_page = 1;
    protected $_kw = '';
    protected $_actionMain;

    public function init() {
        $auth = Zend_Auth::getInstance();
        $identity = $auth->getIdentity();

        //kiem tra permission
        $check_permission = $this->_helper->global->checkPermission($identity->group_id, '5006');
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
        $this->view->title = 'Lọc danh sách theo dân tộc - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => 'danhsach/layout',
            'layoutPath' => $layoutPath);
        Zend_Layout::startMvc($option);

        $filter_selected = $this->_getParam('id', 0);

        $emModel = new Front_Model_Employees();
        $filterModel = new Front_Model_Dantoc();
        $list_filters = $filterModel->fetchData(array('dt_status'=>1));
        $filters = array();
        if($filter_selected) $filters['em_dan_toc'] = $filter_selected;
        $list_items = $emModel->fetchData($filters);
        $paginator = Zend_Paginator::factory($list_items);
        $paginator->setItemCountPerPage(NUM_PER_PAGE);
        $paginator->setCurrentPageNumber($this->_page);
        $this->view->page = $this->_page;
        $this->view->paginator = $paginator;
        $this->view->filter = $list_filters;
        $this->view->filter_selected = $filter_selected;
    }
}