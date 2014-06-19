<?php

class Zend_View_Helper_ViewGetChamCong extends Zend_Controller_Action_Helper_Abstract {

    /**
     * @var Zend_View_Interface 
     */
    public $view;

    public function viewGetChamCong($em_id, $thang, $nam) {
        if ($em_id) {
            $chamcongModel = new Front_Model_ChamCong();
            $cham_cong = $chamcongModel->fetchOneData(array('c_em_id' => $em_id, 'c_thang' => (int)$thang, 'c_nam' => (int)$nam));
            if ($cham_cong) {
                return $cham_cong;
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