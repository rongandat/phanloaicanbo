<?php

class Hethong_UsersController extends Zend_Controller_Action {

    protected $_arrParam;
    protected $_page = 1;

    public function init() {
        $this->_arrParam = $this->_request->getParams();
        $this->_arrParam['page'] = $this->_request->getParam('page', 1);
        if ($this->_arrParam['page'] == '' || $this->_arrParam['page'] <= 0) {
            $this->_arrParam['page'] = 1;
        }
        $this->_page = $this->_arrParam['page'];

        $this->view->arrParam = $this->_arrParam;
    }

    public function indexAction() {

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => 'hethong/layout',
            'layoutPath' => $layoutPath);

        Zend_Layout::startMvc($option);
        $translate = Zend_Registry::get('Zend_Translate');
        $this->view->title = 'Quản lý tài khoản - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $usersModel = new Front_Model_Users;
        $list_users = $usersModel->fetchAll();

        $paginator = Zend_Paginator::factory($list_users);
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
        $this->view->title = 'Quản lý tài khoản - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $employeesModel = new Front_Model_Employees();
        $groupsModel = new Front_Model_Groups();
        $list_employees = $employeesModel->fetchAll();
        $list_groups = $groupsModel->fetchAll();

        if ($this->_request->isPost()) {
            $username = $this->_arrParam['name'];
            $keywords = $this->_arrParam['keywords'];
            $desc = $this->_arrParam['desc'];
            $content = $this->_arrParam['content'];
        }

        $this->view->list_groups = $list_groups;
        $this->view->list_employees = $list_employees;
    }

}