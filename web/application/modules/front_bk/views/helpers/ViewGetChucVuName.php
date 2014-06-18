<?php

class Zend_View_Helper_ViewGetChucVuName extends Zend_Controller_Action_Helper_Abstract {

    /**
     * @var Zend_View_Interface 
     */
    public $view;

    public function viewGetChucVuName($id = 0) {
        if ($id) {
            $chucvuModel = new Front_Model_Chucvu();
            $chuc_vu = $chucvuModel->fetchRow('cv_id=' . $id . ' and cv_status=1');
            if ($chuc_vu) {
                return $chuc_vu->cv_name;
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