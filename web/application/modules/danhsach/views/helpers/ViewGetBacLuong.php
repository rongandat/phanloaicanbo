<?php

class Zend_View_Helper_ViewGetBacLuong extends Zend_Controller_Action_Helper_Abstract {

    /**
     * @var Zend_View_Interface 
     */
    public $view;

    public function viewGetBacLuong($bac_luong_id) {
        if ($bac_luong_id) {
            $bacluongModel = new Front_Model_BacLuong();
            $bac_luong = $bacluongModel->fetchRow(array('bl_id' => $bac_luong_id));
            if ($bac_luong) {
                return $bac_luong;
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