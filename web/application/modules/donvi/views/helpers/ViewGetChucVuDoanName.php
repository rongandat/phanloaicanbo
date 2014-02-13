<?php

class Zend_View_Helper_ViewGetChucVuDoanName extends Zend_Controller_Action_Helper_Abstract {

    /**
     * @var Zend_View_Interface 
     */
    public $view;

    public function viewGetChucVuDoanName($id) {
        $chucvudoanModel = new Front_Model_ChucVuDoan();
        $chucvu = $chucvudoanModel->fetchRow('cvdoan_id=' . $id .' and cvdoan_status=1');
        if ($chucvu) {            
            return $chucvu->cvdoan_name;
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