<?php

class Zend_View_Helper_ViewGetChucVuCongDoanName extends Zend_Controller_Action_Helper_Abstract {

    /**
     * @var Zend_View_Interface 
     */
    public $view;

    public function viewGetChucVuCongDoanName($id) {
        if ($id) {
            $chucvucongdoanModel = new Front_Model_ChucVuCongDoan();
            $chucvu = $chucvucongdoanModel->fetchRow('cvcdoan_id=' . $id . ' and cvcdoan_status=1');
            if ($chucvu) {
                return $chucvu->cvcdoan_name;
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