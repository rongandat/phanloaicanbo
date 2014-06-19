<?php

class DownloadController extends Zend_Controller_Action {

    protected $_arrParam;

    public function init() {
        $this->_arrParam = $this->_request->getParams();
        $this->view->arrParam = $this->_arrParam;
    }

    public function imgAction() {
        $file_name = trim($this->_arrParam['file']);
        $path_upload = UPLOAD_PATH;
        if ($file_name && file_exists(UPLOAD_PATH . '/' . $file_name)) {
            header('Content-Type: image/jpeg');
            header('Content-Disposition: attachment; filename="'.$file_name.'"');
            readfile(UPLOAD_PATH . '/' . $file_name);
        }else{
            die('Không tìm thấy file');
        }

        // disable layout and view
        $this->view->layout()->disableLayout();
        $this->_helper->viewRenderer->setNoRender(true);
    }

}