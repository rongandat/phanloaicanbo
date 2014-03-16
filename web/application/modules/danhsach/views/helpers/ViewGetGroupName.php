<?php

class Zend_View_Helper_ViewGetGroupName extends Zend_Controller_Action_Helper_Abstract {

    /**
     * @var Zend_View_Interface 
     */
    public $view;

    public function viewGetGroupName($id) {
        $groupModel = new Front_Model_Groups;
        $group = $groupModel->fetchRow('group_id=' . $id);
        if ($group) {            
            return $group->group_name;
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