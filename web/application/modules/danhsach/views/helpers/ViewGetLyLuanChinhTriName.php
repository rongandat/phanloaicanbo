<?php

class Zend_View_Helper_ViewGetLyLuanChinhTriName extends Zend_Controller_Action_Helper_Abstract {

    /**
     * @var Zend_View_Interface 
     */
    public $view;

    public function viewGetLyLuanChinhTriName($id = '') {
        if ($id && $id !='') {
            $lyluanModel = new Front_Model_LyLuanChinhTri();
            $row = $lyluanModel->fetchRow('llct_id=' . $id . ' and llct_status=1');
            if ($row) {
                return $row->llct_name;
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