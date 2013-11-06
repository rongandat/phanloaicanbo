<?php

class Hethong_UsersController extends Zend_Controller_Action {

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
        $this->view->title = 'Hệ thống - '.$translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);
    }

}