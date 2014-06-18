<?php

class Zend_View_Helper_ViewGetChungChiName extends Zend_Controller_Action_Helper_Abstract {

    /**
     * @var Zend_View_Interface 
     */
    public $view;

    public function viewGetChungChiName($id = 0) {
        if ($id) {
            $chungchiModel = new Front_Model_Chungchi();
            $chung_chi = $chungchiModel->fetchRow('cc_id=' . $id . ' and cc_status=1');
            if ($chung_chi) {
                return $chung_chi->cc_name;
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