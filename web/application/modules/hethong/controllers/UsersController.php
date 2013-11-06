<?php

class Hethong_UsersController extends Zend_Controller_Action {

    protected $_arrParam;
    protected $_page = 1;

    public function init() {
        $this->_arrParam = $this->_request->getParams();
        $this->_arrParam['page'] = $this->_request->getParam('page', 1);
        if ($this->_arrParam['page'] == '' || $this->_arrParam['page'] <= 0) {
            $this->_arrParam['page'] = 1;
        }
        $this->_page = $this->_arrParam['page'];

        $this->view->arrParam = $this->_arrParam;
    }

    public function indexAction() {

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => 'hethong/layout',
            'layoutPath' => $layoutPath);

        Zend_Layout::startMvc($option);
        $translate = Zend_Registry::get('Zend_Translate');
        $this->view->title = 'Quản lý tài khoản - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $usersModel = new Front_Model_Users;
        $list_users = $usersModel->fetchAll();

        $paginator = Zend_Paginator::factory($list_users);
        $paginator->setItemCountPerPage(NUM_PER_PAGE);
        $paginator->setCurrentPageNumber($this->_page);
        $this->view->page = $this->_page;
        $this->view->paginator = $paginator;
    }

    public function addAction() {

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => 'hethong/layout',
            'layoutPath' => $layoutPath);

        Zend_Layout::startMvc($option);
        $translate = Zend_Registry::get('Zend_Translate');
        $this->view->title = 'Quản lý tài khoản - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $userModel = new Front_Model_Users();
        $employeesModel = new Front_Model_Employees();
        $groupsModel = new Front_Model_Groups();
        $list_employees = $employeesModel->fetchAll();
        $list_groups = $groupsModel->fetchAll();
        $error_message = array();
        $success_message = '';
        if ($this->_request->isPost()) {
            $username = trim($this->_arrParam['username']);
            $password = trim($this->_arrParam['password']);
            $employee = $this->_arrParam['employee'];
            $group = $this->_arrParam['group'];
            $status = $this->_arrParam['status'];

            $validator_length = new Zend_Validate_StringLength(array('min' => 4, 'max' => 12));
            $validator_username = new Zend_Validate_Alnum(array('allowWhiteSpace' => false));

            //kiem tra dữ liệu
            if (!$validator_length->isValid($username)) {
                $error_message[] = 'Tên tài khoản phải bằng hoặc hơn 4 ký tự và nhỏ hơn hoặc bằng 12 ký tự.';
            }

            if (!$validator_username->isValid($username)) {
                $error_message[] = 'Tên tài khoản không không được chứa khoảng trắng.';
            }

            if (!$validator_length->isValid($password)) {
                $error_message[] = 'Mật khẩu phải bằng hoặc hơn 4 ký tự và nhỏ hơn hoặc bằng 12 ký tự.';
            }

            //check username đã tồn tại
            $check_username = $userModel->fetchRow('username="' . $username . '"');
            if ($check_username) {
                $error_message[] = 'Tên đăng nhập <strong>' . $username . '</strong> đã tồn tại.';
            }

            //check employee
            $check_employee = $userModel->fetchRow('employee_id=' . $employee);
            if ($check_employee) {
                $error_message[] = 'Nhân viên <strong>' . $this->view->viewGetName($employee) . '</strong> đã có tài khoản rồi.';
            }

            if (!sizeof($error_message)) {
                $userModel->insert(array(
                    'employee_id' => $employee,
                    'group_id' => $group,
                    'username' => $username,
                    'password' => md5($password),
                    'status' => $status
                        )
                );
                $success_message = 'Đã thêm tài khoản mới thành công.';
            }
        }
        $this->view->success_message = $success_message;
        $this->view->error_message = $error_message;
        $this->view->list_groups = $list_groups;
        $this->view->list_employees = $list_employees;
    }

    public function editAction() {

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => 'hethong/layout',
            'layoutPath' => $layoutPath);

        Zend_Layout::startMvc($option);
        $translate = Zend_Registry::get('Zend_Translate');
        $this->view->title = 'Quản lý tài khoản - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $id = $this->_getParam('id', 0);

        $userModel = new Front_Model_Users();
        $employeesModel = new Front_Model_Employees();
        $groupsModel = new Front_Model_Groups();
        $list_employees = $employeesModel->fetchAll();
        $list_groups = $groupsModel->fetchAll();
        $error_message = array();
        $success_message = '';

        $user_info = $userModel->fetchRow('user_id=' . $id);
        if (!$user_info) {
            $error_message[] = 'Không tìm thấy thông tin của tài khoản.';
        }

        if ($this->_request->isPost()) {
            $username = trim($this->_arrParam['username']);
            $password = trim($this->_arrParam['password']);
            $employee = $this->_arrParam['employee'];
            $group = $this->_arrParam['group'];
            $status = $this->_arrParam['status'];

            $validator_length = new Zend_Validate_StringLength(array('min' => 4, 'max' => 12));
            $validator_username = new Zend_Validate_Alnum(array('allowWhiteSpace' => false));

            //kiem tra dữ liệu
            if (!$validator_length->isValid($username)) {
                $error_message[] = 'Tên tài khoản phải bằng hoặc hơn 4 ký tự và nhỏ hơn hoặc bằng 12 ký tự.';
            }

            if (!$validator_username->isValid($username)) {
                $error_message[] = 'Tên tài khoản không không được chứa khoảng trắng.';
            }

            if ($password) {
                if (!$validator_length->isValid($password)) {
                    $error_message[] = 'Mật khẩu phải bằng hoặc hơn 4 ký tự và nhỏ hơn hoặc bằng 12 ký tự.';
                }
            }

            //check username đã tồn tại
            $check_username = $userModel->fetchRow('username="' . $username . '" and username !="' . $user_info->username . '"');
            if ($check_username) {
                $error_message[] = 'Tên đăng nhập <strong>' . $username . '</strong> đã tồn tại.';
            }

            //check employee
            $check_employee = $userModel->fetchRow('employee_id=' . $employee . ' and employee_id !=' . $user_info->employee_id);
            if ($check_employee) {
                $error_message[] = 'Nhân viên <strong>' . $this->view->viewGetName($employee) . '</strong> đã có tài khoản rồi.';
            }

            if (!sizeof($error_message)) {
                $userModel->update(array(
                    'employee_id' => $employee,
                    'group_id' => $group,
                    'username' => $username,
                    'status' => $status
                        ), 'user_id=' . $id
                );

                if ($password) {
                    $userModel->update(array('password' => md5($password)), 'user_id=' . $id);
                }

                $user_info->employee_id = $employee;
                $user_info->group_id = $group;
                $user_info->username = $username;
                $user_info->status = $status;

                $success_message = 'Đã cập nhật thông tin tài khoản thành công.';
            }
        }


        $this->view->user_info = $user_info;
        $this->view->success_message = $success_message;
        $this->view->error_message = $error_message;
        $this->view->list_groups = $list_groups;
        $this->view->list_employees = $list_employees;
    }

    public function deleteAction() {

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => 'hethong/layout',
            'layoutPath' => $layoutPath);

        Zend_Layout::startMvc($option);
        $translate = Zend_Registry::get('Zend_Translate');
        $this->view->title = 'Quản lý tài khoản - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $id = $this->_getParam('id', 0);

        $userModel = new Front_Model_Users();
        $error_message = array();
        $success_message = '';

        $user_info = $userModel->fetchRow('user_id=' . $id);
        if (!$user_info) {
            $error_message[] = 'Không tìm thấy thông tin của tài khoản.';
        }

        if ($this->_request->isPost()) {
            $del = $this->getRequest()->getPost('del');
            if ($del == 'Yes') {
                $id = $this->getRequest()->getPost('id');
                $userModel->delete('user_id=' . $id);
            }
            $this->_redirect('hethong/users/index/page/' . $this->_page);
        }


        $this->view->user_info = $user_info;
        $this->view->error_message = $error_message;
    }

    function changestatusAction() {
        $this->_helper->layout()->disableLayout();
        $type = $this->_request->getParam('status', 1);
        $id = $this->_request->getParam('id', 0);
        if ($type > 0) {
            $type = 1;
        } else {
            $type = 0;
        }

        $userModel = new Front_Model_Users();
        $userModel->update(array('status' => $type), 'user_id=' . $id);
        $this->_redirect('hethong/users/index/page/' . $this->_page);
    }

    function deleteitemsAction() {
        $this->_helper->layout()->disableLayout();
        $userModel = new Front_Model_Users();
        $item = $this->getRequest()->getPost('cid');
        foreach ($item as $k => $v) {
            $userModel->delete('user_id=' . $v);
        }
        $this->_redirect('hethong/users/index/page/' . $this->_page);
    }

}