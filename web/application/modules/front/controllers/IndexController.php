<?php

class IndexController extends Zend_Controller_Action {

    protected $_arrParam;

    public function init() {
        $this->_arrParam = $this->_request->getParams();
        $this->_arrParam['page'] = $this->_request->getParam('page', 1);
        $this->view->arrParam = $this->_arrParam;
    }

    public function indexAction() {

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => 'index',
            'layoutPath' => $layoutPath);

        Zend_Layout::startMvc($option);
        $translate = Zend_Registry::get('Zend_Translate');
        $this->view->title = $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);
    }

    public function changethamnienAction() {
        $hesoModel = new Front_Model_EmployeesHeso();
        $date = new Zend_Date();
        $thang = $date->toString("M");
        $nam = $date->toString("Y");
        $he_so = $hesoModel->fetchAll();
        foreach ($he_so as $hs) {
            if ($hs->eh_tham_niem != '' && $hs->eh_tham_niem != '0000-00-00 00:00:00') {
                $nam_tham_nien = date('Y', strtotime($hs->eh_tham_niem));
                $thang_tham_nien = date('m', strtotime($hs->eh_tham_niem));
                $tham_niem = $nam - $nam_tham_nien;
                if ($thang < $thang_tham_nien)
                    $tham_niem--;
                $data_ud = array('eh_pc_tham_nien' => $tham_niem);
                $hesoModel->update($data_ud, 'eh_id=' . $hs->eh_id);
            }
        }
        die();
    }

    public function permissionAction() {

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => 'index',
            'layoutPath' => $layoutPath);

        Zend_Layout::startMvc($option);
        $translate = Zend_Registry::get('Zend_Translate');
        $this->view->title = $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);
    }

}