<?php

class Zend_View_Helper_ViewGetHocHamName extends Zend_Controller_Action_Helper_Abstract {

    /**
     * @var Zend_View_Interface 
     */
    public $view;

    public function viewGetHocHamName($id=0) {
        if ($id) {
            $hochamModel = new Front_Model_Hocham();
            $hoc_ham = $hochamModel->fetchRow('hh_id=' . $id . ' and hh_status=1');
            if ($hoc_ham) {
                return $hoc_ham->hh_name;
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