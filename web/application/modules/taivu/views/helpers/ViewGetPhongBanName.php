<?php

class Zend_View_Helper_ViewGetPhongBanName extends Zend_Controller_Action_Helper_Abstract {

    /**
     * @var Zend_View_Interface 
     */
    public $view;

    public function viewGetPhongBanName($id = 0) {
        if ($id) {
            $phongbanModel = new Front_Model_Phongban();
            $phong_ban = $phongbanModel->fetchRow('pb_id=' . $id . ' and pb_status=1');
            if ($phong_ban) {
                return $phong_ban->pb_name;
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