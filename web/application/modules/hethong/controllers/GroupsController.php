<?php

class Hethong_GroupsController extends Zend_Controller_Action {

    protected $_arrParam;

    public function init() {
        $this->_arrParam = $this->_request->getParams();
        $this->_arrParam['page'] = $this->_request->getParam('page', 1);
        $this->view->arrParam = $this->_arrParam;
    }

    public function indexAction() {
        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => 'hethong/layout',
            'layoutPath' => $layoutPath);
        Zend_Layout::startMvc($option);      
        
        $translate = Zend_Registry::get('Zend_Translate');
        $this->view->title = 'Quản lý Nhóm, Quyền - '.$translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);
        
        $groupsModel = new Front_Model_Groups();
        $list_groups = $groupsModel->fetchAll();
        $this->view->list_groups = $list_groups;
        
    }

}