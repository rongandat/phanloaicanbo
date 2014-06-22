<?php

class Zend_View_Helper_ViewGetDanTocName extends Zend_Controller_Action_Helper_Abstract {

    /**
     * @var Zend_View_Interface 
     */
    public $view;

    public function viewGetDanTocName($id) {
        if($id) {
            $dantocModel = new Front_Model_Dantoc();
            $dantoc = $dantocModel->fetchRow('dt_id=' . $id . ' and dt_status=1');
            if ($dantoc) {
                return $dantoc->dt_name;
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