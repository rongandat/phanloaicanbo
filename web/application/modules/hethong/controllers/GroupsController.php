<?php

class Hethong_GroupsController extends Zend_Controller_Action {

    protected $_arrParam;
    protected $_page = 1;

    public function init() {
        
        $auth = Zend_Auth::getInstance();
        $identity = $auth->getIdentity();

        //kiem tra permission
        $check_permission = $this->_helper->global->checkPermission($identity->group_id, '2001');
        if (!$check_permission) {
            $this->_redirect('index/permission/');
            exit();
        }
        
        
        $this->_arrParam = $this->_request->getParams();
        $this->_arrParam['page'] = $this->_request->getParam('page', 1);
        if ($this->_arrParam['page'] == '' || $this->_arrParam['page'] <= 0) {
            $this->_arrParam['page'] = 1;
        }
        $this->_page = $this->_arrParam['page'];
        $this->view->arrParam = $this->_arrParam;

        $this->view->permissions = array(
            array(
                'group' => 'Hệ thống',
                'permissions' => array(
                    array('id' => 1001, 'name' => 'Quản lý tài khoản'),
                    array('id' => 1002, 'name' => 'Quản lý nhóm, phân quyền'),
                    array('id' => 1003, 'name' => 'Quản lý phòng ban'),
                    array('id' => 1004, 'name' => 'Quản lý ngày nghỉ lễ'),
                    array('id' => 1005, 'name' => 'Quản lý tiêu chí đánh giá cán bộ'),
                    array('id' => 1006, 'name' => 'Quản lý đánh giá kết quả công việc'),
                    array('id' => 1007, 'name' => 'Quản lý bằng cấp'),
                    array('id' => 1008, 'name' => 'Quản lý chứng chỉ'),
                    array('id' => 1009, 'name' => 'Quản lý học hàm'),
                    array('id' => 1010, 'name' => 'Quản lý dân tộc'),
                    array('id' => 1011, 'name' => 'Quản lý tỉnh, huyện')
                )
            ),
            array(
                'group' => 'Cá nhân',
                'permissions' => array(
                    array('id' => 2001, 'name' => 'Thông báo'),
                    array('id' => 2002, 'name' => 'Thông tin cá nhân'),
                    array('id' => 2003, 'name' => 'Cập nhật thông tin'),
                    array('id' => 2004, 'name' => 'Xin nghỉ phép'),
                    array('id' => 2005, 'name' => 'Chấm công'),
                    array('id' => 2006, 'name' => 'Khai báo thêm giờ'),
                    array('id' => 2007, 'name' => 'Thống kê tháng'),
                    array('id' => 2008, 'name' => 'Đánh giá phân loại')
                )
            )
        );
    }

    public function indexAction() {
        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => 'hethong/layout',
            'layoutPath' => $layoutPath);
        Zend_Layout::startMvc($option);

        $translate = Zend_Registry::get('Zend_Translate');
        $this->view->title = 'Quản lý Nhóm, Quyền - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $groupsModel = new Front_Model_Groups();
        $list_groups = $groupsModel->fetchAll();
        $this->view->list_groups = $list_groups;
    }

    public function addAction() {

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => 'hethong/layout',
            'layoutPath' => $layoutPath);

        Zend_Layout::startMvc($option);
        $translate = Zend_Registry::get('Zend_Translate');
        $this->view->title = 'Quản lý Nhóm, Quyền - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $groupsModel = new Front_Model_Groups();
        $error_message = array();
        $success_message = '';
        if ($this->_request->isPost()) {
            $group_name = trim($this->_arrParam['group_name']);
            $group_status = $this->_arrParam['group_status'];

            $validator_length = new Zend_Validate_StringLength(array('min' => 4, 'max' => 255));

            //kiem tra dữ liệu
            if (!$validator_length->isValid($group_name)) {
                $error_message[] = 'Tên nhóm phải bằng hoặc hơn 4 ký tự và nhỏ hơn hoặc bằng 255 ký tự.';
            }

            if (!sizeof($error_message)) {
                $current_time = new Zend_Db_Expr('NOW()');
                $groupsModel->insert(array(
                    'group_name' => $group_name,
                    'group_status' => $group_status,
                    'group_date_added' => $current_time,
                    'group_date_modified' => $current_time
                        )
                );
                $success_message = 'Đã thêm nhóm mới thành công.';
            }
        }
        $this->view->success_message = $success_message;
        $this->view->error_message = $error_message;
    }

    public function editAction() {

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => 'hethong/layout',
            'layoutPath' => $layoutPath);

        Zend_Layout::startMvc($option);
        $translate = Zend_Registry::get('Zend_Translate');
        $this->view->title = 'Quản lý Nhóm, Quyền - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $id = $this->_getParam('id', 0);

        $groupsModel = new Front_Model_Groups();
        $error_message = array();
        $success_message = '';

        $group_info = $groupsModel->fetchRow('group_id=' . $id);
        if (!$group_info) {
            $error_message[] = 'Không tìm thấy thông tin của nhóm.';
        }

        if ($this->_request->isPost()) {
            $group_name = trim($this->_arrParam['group_name']);
            $group_status = $this->_arrParam['group_status'];

            $validator_length = new Zend_Validate_StringLength(array('min' => 4, 'max' => 255));

            //kiem tra dữ liệu
            if (!$validator_length->isValid($group_name)) {
                $error_message[] = 'Tên nhóm phải bằng hoặc hơn 4 ký tự và nhỏ hơn hoặc bằng 255 ký tự.';
            }

            if (!sizeof($error_message)) {
                $current_time = new Zend_Db_Expr('NOW()');
                $groupsModel->update(array(
                    'group_name' => $group_name,
                    'group_status' => $group_status,
                    'group_date_modified' => $current_time
                        ), 'group_id=' . $id
                );

                $group_info->group_name = $group_name;
                $group_info->group_status = $group_status;

                $success_message = 'Đã cập nhật thông tin nhóm thành công.';
            }
        }


        $this->view->group_info = $group_info;
        $this->view->success_message = $success_message;
        $this->view->error_message = $error_message;
    }

    public function deleteAction() {

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => 'hethong/layout',
            'layoutPath' => $layoutPath);

        Zend_Layout::startMvc($option);
        $translate = Zend_Registry::get('Zend_Translate');
        $this->view->title = 'Quản lý Nhóm, Quyền - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $id = $this->_getParam('id', 0);

        $groupsModel = new Front_Model_Groups();
        $error_message = array();
        $success_message = '';

        $group_info = $groupsModel->fetchRow('group_id=' . $id);
        if (!$group_info) {
            $error_message[] = 'Không tìm thấy thông tin của nhóm.';
        }

        if ($this->_request->isPost()) {
            $del = $this->getRequest()->getPost('del');
            if ($del == 'Yes') {
                $id = $this->getRequest()->getPost('id');
                $groupsModel->delete('group_id=' . $id);
            }
            $this->_redirect('hethong/groups/index/page/' . $this->_page);
        }


        $this->view->group_info = $group_info;
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

        $groupsModel = new Front_Model_Groups();
        $current_time = new Zend_Db_Expr('NOW()');
        $groupsModel->update(array('group_status' => $type, 'group_date_modified' => $current_time), 'group_id=' . $id);
        $this->_redirect('hethong/groups/index/page/' . $this->_page);
    }

    function deleteitemsAction() {
        $this->_helper->layout()->disableLayout();
        $groupsModel = new Front_Model_Groups();
        if ($this->_request->isPost()) {
            $item = $this->getRequest()->getPost('cid');
            foreach ($item as $k => $v) {
                $groupsModel->delete('group_id=' . $v);
            }
        }
        $this->_redirect('hethong/groups/index/page/' . $this->_page);
    }

    function permissionsAction() {
        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => 'hethong/layout',
            'layoutPath' => $layoutPath);

        Zend_Layout::startMvc($option);
        $translate = Zend_Registry::get('Zend_Translate');
        $this->view->title = 'Quản lý Nhóm, Quyền - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $id = $this->_getParam('id', 0);

        $groupsModel = new Front_Model_Groups();
        $group_info = $groupsModel->fetchRow('group_id=' . $id);
        if (!$group_info) {
            $error_message[] = 'Không tìm thấy thông tin của nhóm.';
        }

        if ($this->_request->isPost()) {
            $item = $this->getRequest()->getPost('cid');
            $permissions = '';
            foreach ($item as $permission_id) {
                $permissions .=$permission_id . ',';
            }
            $current_time = new Zend_Db_Expr('NOW()');
            $groupsModel->update(array('group_permissions' => $permissions, 'group_date_modified' => $current_time), 'group_id=' . $id);
            $group_info->group_permissions = $permissions;
        }

        $this->view->group_info = $group_info;
        $this->view->success_message = $success_message;
        $this->view->error_message = $error_message;
    }

}