<?php

class Zend_View_Helper_ViewGetHuyenName extends Zend_Controller_Action_Helper_Abstract {

    /**
     * @var Zend_View_Interface 
     */
    public $view;

    public function viewGetHuyenName($id) {
        $huyenModel = new Front_Model_Huyen();
        $huyen = $huyenModel->fetchRow('huyen_id=' . $id .' and huyen_status=1');
        if ($huyen) {            
            return $huyen->huyen_name;
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