<?php

class Zend_View_Helper_ViewCheckBangLuong extends Zend_Controller_Action_Helper_Abstract {

    /**
     * @var Zend_View_Interface 
     */
    public $view;

    public function viewCheckBangLuong($em_id, $thang, $nam) {
        if ($em_id) {
            $bangluongModel = new Front_Model_BangLuong();
            $bang_luong = $bangluongModel->fetchByDate($em_id, "$nam-$thang-01 00:00:00", "$nam-$thang-31 23:59:59");
            if ($bang_luong) {
                return true;
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