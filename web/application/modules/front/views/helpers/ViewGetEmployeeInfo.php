<?php

class Zend_View_Helper_ViewGetEmployeeInfo extends Zend_Controller_Action_Helper_Abstract {

    /**
     * @var Zend_View_Interface 
     */
    public $view;

    public function viewGetEmployeeInfo($id) {
        $employeeModel = new Front_Model_Employees();
        $employee = $employeeModel->fetchRow('em_id=' . $id);
        if ($employee) {            
            return $employee;
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