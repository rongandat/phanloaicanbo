<?php

class Zend_View_Helper_ViewGetBangCapName extends Zend_Controller_Action_Helper_Abstract {

    /**
     * @var Zend_View_Interface 
     */
    public $view;

    public function viewGetBangCapName($id) {
        $bangcapModel = new Front_Model_Bangcap();
        $bang_cap = $bangcapModel->fetchRow('bc_id=' . $id .' and bc_status=1');
        if ($bang_cap) {            
            return $bang_cap->bc_name;
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