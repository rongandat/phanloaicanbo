<?php

class Hethong_GroupsController extends Zend_Controller_Action {

    protected $_arrParam;
    protected $_page = 1;
    protected $_kw = '';

    public function init() {

        $auth = Zend_Auth::getInstance();
        $identity = $auth->getIdentity();

        //kiem tra permission
        $check_permission = $this->_helper->global->checkPermission($identity->group_id, '1002');
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

        $this->view->permissions = array(
            array(
                'group' => 'Hệ thống',
                'permissions' => array(
                    array('id' => 1001, 'name' => 'Quản lý tài khoản'),
                    array('id' => 1002, 'name' => 'Quản lý nhóm, phân quyền'),
                    array('id' => 1003, 'name' => 'Quản lý phòng ban'),
                    array('id' => 1004, 'name' => 'Quản lý ngày công'),
                    array('id' => 1005, 'name' => 'Quản lý tiêu chí đánh giá cán bộ'),
                    array('id' => 1006, 'name' => 'Quản lý đánh giá kết quả công việc'),
                    array('id' => 1007, 'name' => 'Quản lý bằng cấp'),
                    array('id' => 1008, 'name' => 'Quản lý chứng chỉ'),
                    array('id' => 1009, 'name' => 'Quản lý học hàm'),
                    array('id' => 1010, 'name' => 'Quản lý dân tộc'),
                    array('id' => 1011, 'name' => 'Quản lý tỉnh, huyện'),
                    array('id' => 1012, 'name' => 'Quản lý chức vụ'),
                    array('id' => 1013, 'name' => 'Quản lý ngạch công chức'),
                    array('id' => 1014, 'name' => 'Quản lý chức chức vụ đoàn'),
                    array('id' => 1015, 'name' => 'Quản lý chức vụ đảng'),
                    array('id' => 1016, 'name' => 'Quản lý chức vụ công đoàn'),
                    array('id' => 1017, 'name' => 'Quản lý nhà nước'),
                    array('id' => 1018, 'name' => 'Quản lý lý luận chính trị'),
                    array('id' => 1019, 'name' => 'Quản lý Ngày nghỉ lễ')
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
                    array('id' => 2008, 'name' => 'Đánh giá phân loại'),
                    array('id' => 2009, 'name' => 'Xem bảng lương')
                )
            ),
            array(
                'group' => 'Đơn vị',
                'permissions' => array(
                    array('id' => 3001, 'name' => 'Quản lý thành viên'),
                    array('id' => 3002, 'name' => 'Duyệt nghỉ phép'),
                    array('id' => 3003, 'name' => 'Duyệt thêm giờ'),
                    array('id' => 3004, 'name' => 'Duyệt chấm công'),
                    array('id' => 3005, 'name' => 'Duyệt phân loại cán bộ'),
                    array('id' => 3006, 'name' => 'Thống kê tháng')
                )
            ),
            array(
                'group' => 'Tài vụ',
                'permissions' => array(
                    array('id' => 6001, 'name' => 'QL hệ số lương & phụ cấp'),
                    array('id' => 6002, 'name' => 'Tính lương'),
                )
            ),
            array(
                'group' => 'Quản lý cán bộ',
                'permissions' => array(
                    array('id' => 4001, 'name' => 'Quản lý cán bộ'),
                    array('id' => 4002, 'name' => 'Quản lý yêu cầu cập nhật thông tin'),
                    array('id' => 4003, 'name' => 'Duyệt phân loại cán bộ'),
                    array('id' => 4004, 'name' => 'Duyệt nghỉ phép'),
                    array('id' => 4005, 'name' => 'Duyệt thêm giờ'),
                    array('id' => 4006, 'name' => 'Duyệt chấm công'),
                    array('id' => 4007, 'name' => 'Quản lý yêu cầu khen thưởng'),
                    array('id' => 4008, 'name' => 'Quản lý yêu cầu kỷ luật/khiển trách'),
                    array('id' => 4009, 'name' => 'Quản lý hệ số lương'),
                    array('id' => 4010, 'name' => 'Tính lương'),
                    array('id' => 4011, 'name' => 'In lương'),
                    array('id' => 4012, 'name' => 'Quản lý khen thưởng'),
                    array('id' => 4013, 'name' => 'Quản lý kỷ luật/khiển trách'),
                    array('id' => 4014, 'name' => 'Quản lý bậc lương'),
                    array('id' => 4015, 'name' => 'Quản lý hệ số 0.2')
                )
            ),
            array(
                'group' => 'Xem danh sách',
                'permissions' => array(
                    array('id' => 5001, 'name' => 'Lọc danh sách theo phòng ban'),
                    array('id' => 5002, 'name' => 'Lọc danh sách theo chức vụ'),
                    array('id' => 5003, 'name' => 'Lọc danh sách theo bằng cấp'),
                    array('id' => 5004, 'name' => 'Lọc danh sách theo học hàm'),
                    array('id' => 5005, 'name' => 'Lọc danh sách theo tỉnh/huyện'),
                    array('id' => 5006, 'name' => 'Lọc danh sách theo dân tộc'),
                    array('id' => 5007, 'name' => 'Lọc danh sách theo ngạch công chức'),
                    array('id' => 5008, 'name' => 'Lọc danh sách theo chứng chỉ')
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
        $list_groups = $groupsModel->fetchData(array(), 'group_order ASC');
        $this->view->list_groups = $list_groups;
    }

    public function searchAction() {
        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => 'hethong/layout',
            'layoutPath' => $layoutPath);
        Zend_Layout::startMvc($option);

        $translate = Zend_Registry::get('Zend_Translate');
        $this->view->title = 'Quản lý Nhóm, Quyền - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $groupsModel = new Front_Model_Groups();
        if ($this->_kw)
            $list_groups = $groupsModel->fetchData(array('keyword' => $this->_kw), 'group_order ASC');
        else {
            $this->_redirect('hethong/groups/');
            $list_groups = $groupsModel->fetchData(array(), 'group_order ASC');
        }
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
            $group_order = $this->_arrParam['group_order'];

            $validator_length = new Zend_Validate_StringLength(array('min' => 4, 'max' => 255));
            if (!is_numeric ($group_order)) {
                $group_order = 0;
            }
            //kiem tra dữ liệu
            if (!$validator_length->isValid($group_name)) {
                $error_message[] = 'Tên nhóm phải bằng hoặc hơn 4 ký tự và nhỏ hơn hoặc bằng 255 ký tự.';
            }

            if (!sizeof($error_message)) {
                $current_time = new Zend_Db_Expr('NOW()');
                $groupsModel->insert(array(
                    'group_name' => $group_name,
                    'group_status' => $group_status,
                    'group_order' => $group_order,
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
            $group_order = $this->_arrParam['group_order'];
            
            $validator_length = new Zend_Validate_StringLength(array('min' => 4, 'max' => 255));            
            if (!is_numeric($group_order)) {
                $group_order = 0;
            }
            
            //kiem tra dữ liệu
            if (!$validator_length->isValid($group_name)) {
                $error_message[] = 'Tên nhóm phải bằng hoặc hơn 4 ký tự và nhỏ hơn hoặc bằng 255 ký tự.';
            }

            if (!sizeof($error_message)) {
                $current_time = new Zend_Db_Expr('NOW()');
                $groupsModel->update(array(
                    'group_name' => $group_name,
                    'group_status' => $group_status,
                    'group_order' => $group_order,
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