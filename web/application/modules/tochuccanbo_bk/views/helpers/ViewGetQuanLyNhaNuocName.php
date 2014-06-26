<?php

class Zend_View_Helper_ViewGetQuanLyNhaNuocName extends Zend_Controller_Action_Helper_Abstract {

    /**
     * @var Zend_View_Interface 
     */
    public $view;

    public function viewGetQuanLyNhaNuocName($id = 0) {
        if ($id) {
            $rowModel = new Front_Model_QuanLyNhaNuoc();
            $row = $rowModel->fetchRow('qlnn_id=' . $id . ' and qlnn_status=1');
            if ($row) {
                return $row->qlnn_name;
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