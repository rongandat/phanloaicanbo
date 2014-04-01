<?php

class Zend_View_Helper_ViewGetChucVuDangName extends Zend_Controller_Action_Helper_Abstract {

    /**
     * @var Zend_View_Interface 
     */
    public $view;

    public function viewGetChucVuDangName($id = 0) {
        if ($id) {
            $chucvudangModel = new Front_Model_ChucVuDang();
            $chucvu = $chucvudangModel->fetchRow('cvdang_id=' . $id . ' and cvdang_status=1');
            if ($chucvu) {
                return $chucvu->cvdang_name;
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