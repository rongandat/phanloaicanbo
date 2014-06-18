<?php

class Zend_View_Helper_ViewGetPhanLoai extends Zend_Controller_Action_Helper_Abstract {

    /**
     * @var Zend_View_Interface 
     */
    public $view;

    public function viewGetPhanLoai($em_id = 0, $thang = 0, $nam = 0) {
        if ($em_id) {
            $danhgiaModel = new Front_Model_DanhGia();
            $danh_gia = $danhgiaModel->fetchRow("dg_em_id= $em_id and dg_thang=$thang and dg_nam=$nam");
            if ($danh_gia) {
                return $danh_gia;
            }
            return false;
        }
        return false;
    }

    /**
     * Sets the view field 
     * @param $view Zend_View_Interface
     */
    public function setView(Zend_View_Interface $view) {
        $this->view = $view;
    }

}