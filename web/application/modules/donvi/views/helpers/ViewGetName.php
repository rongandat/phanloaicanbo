<?php

class Zend_View_Helper_ViewGetName extends Zend_Controller_Action_Helper_Abstract {

    /**
     * @var Zend_View_Interface 
     */
    public $view;

    public function viewGetName($id) {
        if($id) {
            $employeeModel = new Front_Model_Employees();
            $employee = $employeeModel->fetchRow('em_id=' . $id);
            if ($employee) {
                $fullname = trim($employee->em_ho);
                $fullname .= ' ' . trim($employee->em_ten);
                return $fullname;
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