<?php

class Tochuccanbo_EmployeesController extends Zend_Controller_Action {

    protected $_arrParam;
    protected $_page = 1;
    protected $_kw = '';
    protected $_actionMain;

    public function init() {
        $auth = Zend_Auth::getInstance();
        $identity = $auth->getIdentity();

        //kiem tra permission
        $check_permission = $this->_helper->global->checkPermission($identity->group_id, '1001');
        if (!$check_permission) {
            $this->_redirect('index/permission/');
            exit();
        }
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
        $this->view->title = 'Quản lý cán bộ - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => '1_column/layout',
            'layoutPath' => $layoutPath);

        Zend_Layout::startMvc($option);

        $usersModel = new Front_Model_Users();
        $list_users = $usersModel->fetchData();

        $paginator = Zend_Paginator::factory($list_users);
        $paginator->setItemCountPerPage(NUM_PER_PAGE);
        $paginator->setCurrentPageNumber($this->_page);
        $this->view->page = $this->_page;
        $this->view->paginator = $paginator;
    }

    public function searchAction() {
        $translate = Zend_Registry::get('Zend_Translate');
        $this->view->title = 'Quản lý cán bộ - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => '1_column/layout',
            'layoutPath' => $layoutPath);
        Zend_Layout::startMvc($option);
        $usersModel = new Front_Model_Users();
        if ($this->_kw)
            $list_users = $usersModel->fetchData(array('keyword' => $this->_kw));
        else {
            $this->_redirect('hethong/users/');
            $list_users = $usersModel->fetchData();
        }

        $paginator = Zend_Paginator::factory($list_users);
        $paginator->setItemCountPerPage(NUM_PER_PAGE);
        $paginator->setCurrentPageNumber($this->_page);
        $this->view->page = $this->_page;
        $this->view->paginator = $paginator;
    }

    public function addAction() {

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => '1_column/layout',
            'layoutPath' => $layoutPath);

        Zend_Layout::startMvc($option);
        $translate = Zend_Registry::get('Zend_Translate');
        $this->view->title = 'Quản lý cán bộ - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        
        $employeesModel = new Front_Model_Employees();
        
        $tinhModel = new Front_Model_Tinh();
        $list_tinh = $tinhModel->fetchData(array('tinh_status' => 1));
        
        $huyenModel = new Front_Model_Huyen();
        $list_huyen = $huyenModel->fetchData(array('huyen_status' => 1));
        
        $dantocModel = new Front_Model_Dantoc();
        $list_dan_toc = $dantocModel->fetchData(array('dt_status' => 1));
        
        $chucvuModel = new Front_Model_Chucvu();
        $list_chuc_vu = $chucvuModel->fetchData(array('cv_status' => 1));
        
        $phongbanModel = new Front_Model_Phongban();
        $phong_ban = Array();
        $list_phong_ban = $phongbanModel->fetchData(0, $phong_ban);
        
        $ngachcongchucModel = new Front_Model_NgachCongChuc();
        $list_ngach_cong_chuc = $ngachcongchucModel->fetchData(array('ncc_status' => 1));
        
        $hochamModel = new Front_Model_Hocham();
        $list_hoc_ham = $hochamModel->fetchData(array('hh_status' => 1));
        
        $bangcapModel = new Front_Model_Bangcap();
        $list_bang_cap = $bangcapModel->fetchData(array('bc_status' => 1));
        
        $chungchiModel = new Front_Model_Chungchi();
        $list_chung_chi = $chungchiModel->fetchData(array('cc_status' => 1));
        
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
                $error_message[] = 'Tên cán bộ phải bằng hoặc hơn 4 ký tự và nhỏ hơn hoặc bằng 12 ký tự.';
            }

            if (!$validator_username->isValid($username)) {
                $error_message[] = 'Tên cán bộ không không được chứa khoảng trắng.';
            }

            if (!$validator_length->isValid($password)) {
                $error_message[] = 'Mật khẩu phải bằng hoặc hơn 4 ký tự và nhỏ hơn hoặc bằng 12 ký tự.';
            }

            

            if (!sizeof($error_message)) {
                $current_time = new Zend_Db_Expr('NOW()');
                
                $success_message = 'Đã thêm cán bộ mới thành công.';
            }
        }
        $this->view->success_message = $success_message;
        $this->view->error_message = $error_message;
        $this->view->list_tinh = $list_tinh;
        $this->view->list_huyen = $list_huyen;
        $this->view->list_dan_toc = $list_dan_toc;
        $this->view->list_chuc_vu = $list_chuc_vu;
        $this->view->list_phong_ban = $list_phong_ban;
        $this->view->list_ngach_cong_chuc = $list_ngach_cong_chuc;
        $this->view->list_hoc_ham = $list_hoc_ham;
        $this->view->list_bang_cap = $list_bang_cap;
        $this->view->list_chung_chi = $list_chung_chi;
    }

    public function editAction() {

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => 'hethong/layout',
            'layoutPath' => $layoutPath);

        Zend_Layout::startMvc($option);
        $translate = Zend_Registry::get('Zend_Translate');
        $this->view->title = 'Quản lý cán bộ - ' . $translate->_('TEXT_DEFAULT_TITLE');
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
            $error_message[] = 'Không tìm thấy thông tin của cán bộ.';
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
                $error_message[] = 'Tên cán bộ phải bằng hoặc hơn 4 ký tự và nhỏ hơn hoặc bằng 12 ký tự.';
            }

            if (!$validator_username->isValid($username)) {
                $error_message[] = 'Tên cán bộ không không được chứa khoảng trắng.';
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
                $error_message[] = 'Nhân viên <strong>' . $this->view->viewGetName($employee) . '</strong> đã có cán bộ rồi.';
            }

            if (!sizeof($error_message)) {
                $current_time = new Zend_Db_Expr('NOW()');
                $userModel->update(array(
                    'employee_id' => $employee,
                    'group_id' => $group,
                    'username' => $username,
                    'status' => $status,
                    'date_modified' => $current_time
                        ), 'user_id=' . $id
                );

                if ($password) {
                    $userModel->update(array('password' => md5($password)), 'user_id=' . $id);
                }

                $user_info->employee_id = $employee;
                $user_info->group_id = $group;
                $user_info->username = $username;
                $user_info->status = $status;

                $success_message = 'Đã cập nhật thông tin cán bộ thành công.';
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
        $this->view->title = 'Quản lý cán bộ - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $id = $this->_getParam('id', 0);

        $userModel = new Front_Model_Users();
        $error_message = array();
        $success_message = '';

        $user_info = $userModel->fetchRow('user_id=' . $id);
        if (!$user_info) {
            $error_message[] = 'Không tìm thấy thông tin của cán bộ.';
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
        $current_time = new Zend_Db_Expr('NOW()');
        $userModel = new Front_Model_Users();
        $userModel->update(array('status' => $type, 'date_modified' => $current_time), 'user_id=' . $id);
        $this->_redirect('hethong/users/index/page/' . $this->_page);
    }

    function deleteitemsAction() {
        $this->_helper->layout()->disableLayout();
        $userModel = new Front_Model_Users();
        if ($this->_request->isPost()) {
            $item = $this->getRequest()->getPost('cid');
            foreach ($item as $k => $v) {
                $userModel->delete('user_id=' . $v);
            }
        }
        $this->_redirect('hethong/users/index/page/' . $this->_page);
    }

}