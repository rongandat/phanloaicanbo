<?php

class Hethong_IndexController extends Zend_Controller_Action {

    protected $_arrParam;

    public function init() {
        $this->_arrParam = $this->_request->getParams();
        $this->_arrParam['page'] = $this->_request->getParam('page', 1);
        $this->view->arrParam = $this->_arrParam;
    }

    public function indexAction() {
        $redirector = new Zend_Controller_Action_Helper_Redirector();
        $redirector->gotoUrlAndExit(SITE_URL . '/hethong/users');
    }

}