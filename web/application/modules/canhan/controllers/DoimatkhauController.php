<?php

class Canhan_DoimatkhauController extends Zend_Controller_Action {

    protected $_arrParam;
    protected $_page = 1;
    protected $_kw = '';
    protected $_actionMain;

    public function init() {
        $this->_arrParam = $this->_request->getParams();
        $this->_kw = $this->_arrParam['kw'];
        $this->_arrParam['page'] = $this->_request->getParam('page', 1);
        if ($this->_arrParam['page'] == '' || $this->_arrParam['page'] <= 0) {
            $this->_arrParam['page'] = 1;
        }
        $this->_page = $this->_arrParam['page'];
        $this->view->arrParam = $this->_arrParam;
    }

    public function indexAction() {
        $translate = Zend_Registry::get('Zend_Translate');
        $this->view->title = 'Quản lý tài khoản - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => 'canhan/layout',
            'layoutPath' => $layoutPath);
        Zend_Layout::startMvc($option);

        $auth = Zend_Auth::getInstance();
        $identity = $auth->getIdentity();

        $userModel = new Front_Model_Users();

        $success_message = '';
        $error_message = array();
        if ($this->_request->isPost()) {
            $mat_khau_cu = trim($this->_arrParam['mat_khau_cu']);
            $mat_khau_moi = trim($this->_arrParam['mat_khau_moi_1']);
            $xac_nhan_mat_khau = trim($this->_arrParam['mat_khau_moi_2']);

            $validator_length = new Zend_Validate_StringLength(array('min' => 6, 'max' => 25));

            //kiem tra dữ liệu
            if (!$validator_length->isValid($mat_khau_moi)) {
                $error_message[] = 'Mật khẩu mới phải lớn hơn 5 ký tự và nhỏ hơn 26 ký tự';
            }

            if ($mat_khau_moi != $xac_nhan_mat_khau) {
                $error_message[] = 'Mật khẩu mới và xác nhận mật khẩu không khớp nhau.';
            }

            if (!sizeof($error_message)) {
                $check_pass = $userModel->fetchRow('user_id =' . $identity->user_id . ' and password="' . md5($mat_khau_cu) . '"');
                if ($check_pass) {
                    $userModel->update(array('password' => md5($mat_khau_moi)), 'user_id =' . $identity->user_id);
                    $success_message = 'Thay đổi mật khẩu thành công.';
                } else {
                    $error_message[] = 'Mật khẩu cũ không chính xác.';
                }
            }
        }

        $this->view->success_message = $success_message;
        $this->view->error_message = $error_message;
    }

}