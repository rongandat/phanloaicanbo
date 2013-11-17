<?php

class Zend_View_Helper_ViewGetTinhName extends Zend_Controller_Action_Helper_Abstract {

    /**
     * @var Zend_View_Interface 
     */
    public $view;

    public function viewGetTinhName($id) {
        $tinhModel = new Front_Model_Tinh();
        $tinh = $tinhModel->fetchRow('tinh_id=' . $id);
        if ($tinh) {            
            return $tinh->tinh_name;
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