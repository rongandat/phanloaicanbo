<?php

class Login_IndexController extends Zend_Controller_Action {

    /**
     * Login Controller
     * @author Nguyen Manh Hung
     */
    protected $_arrParam;

    public function init() {
        $this->_arrParam = $this->_request->getParams();
        $this->view->arrParam = $this->_arrParam;
    }

    /**
     * index action
     */
    public function indexAction() {
        //body action  
        $layoutPath = APPLICATION_PATH . '/templates/login';
        $option = array('layout' => 'index',
            'layoutPath' => $layoutPath);
        Zend_Layout::startMvc($option);

        $translate = Zend_Registry::get('Zend_Translate');
        $this->view->title = 'Đăng Nhập - ' . $translate->_("TEXT_DEFAULT_TITLE");
        $this->view->headTitle($this->view->title);
        $messages = array();
        if ($this->_request->isPost()) {
            $username = trim($this->getRequest()->getPost('username'));
            $password = $this->getRequest()->getPost('password');
            if (!Zend_Validate::is($username, 'NotEmpty') || !Zend_Validate::is($password, 'NotEmpty'))
                $messages = array(
                    'text' => 'Bạn phải điền đầy đủ thông tin!',
                    'type' => 'errormsg'
                );

            if (!count($messages)) {
                Zend_Loader::loadClass('Zend_Auth_Adapter_DbTable');
                $db = Zend_Db_Table::getDefaultAdapter();
                // create the auth adapter
                $authAdapter = new Zend_Auth_Adapter_DbTable($db);
                $authAdapter->setTableName(TABLE_USERS);
                $authAdapter->setIdentityColumn('username');
                $authAdapter->setCredentialColumn('password');
                // set username, password
                $password = md5($password);
                $username = strtolower($username);
                $authAdapter->setIdentity($username);
                $authAdapter->setCredential($password);
                $auth = Zend_Auth::getInstance();
                $result = $auth->authenticate($authAdapter);
                if ($result->isValid()) {
                    // luu tru gia tri can thiet cua user
                    $data = $authAdapter->getResultRowObject(array(
                        'user_id',
                        'employee_id',
                        'group_id',
                        'status'
                            ));

                    if ($data->status) {
                        $auth->getStorage()->write($data);
                        $redirector = new Zend_Controller_Action_Helper_Redirector ();
                        $redirector->gotoUrlAndExit(SITE_URL);
                    } else {
                        $auth->clearIdentity();
                        $messages = array(
                            'text' => 'Đăng nhập thất bại!',
                            'type' => 'errormsg'
                        );
                        $this->view->messages = $messages;
                    }
                } else {
                    $messages = array(
                        'text' => 'Thông tin đăng nhập không chính xác!',
                        'type' => 'errormsg'
                    );
                    $this->view->messages = $messages;
                }
            }
        }
    }

    /**
     * logout action
     * @author Nguyen Manh Hung
     */
    public function logoutAction() {
        $layoutPath = APPLICATION_PATH . '/templates/login';
        $option = array('layout' => 'index',
            'layoutPath' => $layoutPath);
        Zend_Layout::startMvc($option);

        $translate = Zend_Registry::get('Zend_Translate');
        $this->view->title = 'Đăng Xuất - ' . $translate->_("TEXT_DEFAULT_TITLE");
        $this->view->headTitle($this->view->title);
        $authAdapter = Zend_Auth::getInstance();
        $authAdapter->clearIdentity();
        $redirector = new Zend_Controller_Action_Helper_Redirector ();
        $redirector->gotoUrlAndExit(SITE_URL.'/auth/login');
    }

}