<?php

class Zend_View_Helper_ViewCheckChuNhatThuBay extends Zend_Controller_Action_Helper_Abstract {

    /**
     * @var Zend_View_Interface 
     */
    public $view;

    public function viewCheckChuNhatThuBay($day=0, $month=0, $year=0) {
        Zend_Date::setOptions(array('format_type' => 'php'));
        $date = new Zend_Date($day.'/'.$month.'/'.$year, 'd/m/Y');
        if($date->toString('D')=='CN' || $date->toString('D')=='Th 7'){
            return 'class="error"';
        }
    }

    /**
     * Sets the view field 
     * @param $view Zend_View_Interface
     */
    public function setView(Zend_View_Interface $view) {
        $this->view = $view;
    }

}