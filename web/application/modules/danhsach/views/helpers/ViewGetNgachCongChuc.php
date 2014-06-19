<?php

class Zend_View_Helper_ViewGetNgachCongChuc extends Zend_Controller_Action_Helper_Abstract {

    /**
     * @var Zend_View_Interface 
     */
    public $view;

    public function viewGetNgachCongChuc($id = 0) {
        if ($id) {
            $ngachcongchucModel = new Front_Model_NgachCongChuc();
            $ngachcongchuc = $ngachcongchucModel->fetchRow('ncc_id=' . $id . ' and ncc_status=1');
            if ($ngachcongchuc) {
                return $ngachcongchuc;
            }
            return '';
        }
        return '';
    }

    /**
     * Sets the view field 
     * @param $view Zend_View_Interface
     */
    public function setView(Zend_View_Interface $view) {
        $this->view = $view;
    }

}