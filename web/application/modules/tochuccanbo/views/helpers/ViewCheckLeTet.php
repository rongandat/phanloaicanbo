<?php

class Zend_View_Helper_ViewCheckLeTet extends Zend_Controller_Action_Helper_Abstract {

    /**
     * @var Zend_View_Interface 
     */
    public $view;

    public function viewCheckLeTet($day=0, $month=0, $year=0) {
        $letetModel = new Front_Model_NghiLe();
        $check_le_tet = $letetModel->fetchRowByDate("$year-$month-$day 00:00:00");
        if ($check_le_tet) {
            return true;
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