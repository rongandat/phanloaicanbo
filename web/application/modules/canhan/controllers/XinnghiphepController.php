<?php

class Canhan_XinnghiphepController extends Zend_Controller_Action {

    protected $_arrParam;
    protected $_page = 1;
    protected $_kw = '';
    protected $_actionMain;

    public function init() {
        $auth = Zend_Auth::getInstance();
        $identity = $auth->getIdentity();

        //kiem tra permission
        $check_permission = $this->_helper->global->checkPermission($identity->group_id, '2004');
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
        $this->view->title = 'Quản lý đơn nghỉ phép - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => 'canhan/layout',
            'layoutPath' => $layoutPath);
        Zend_Layout::startMvc($option);

        $auth = Zend_Auth::getInstance();
        $identity = $auth->getIdentity();
        $em_id = $identity->em_id;

        $xinnghiphepModel = new Front_Model_XinNghiPhep();
        $list_nghi_phep = $xinnghiphepModel->fetchData(array('xnp_em_id' => $em_id), 'xnp_date_created ASC');
        $paginator = Zend_Paginator::factory($list_nghi_phep);
        $paginator->setItemCountPerPage(NUM_PER_PAGE);
        $paginator->setCurrentPageNumber($this->_page);
        $this->view->page = $this->_page;
        $this->view->paginator = $paginator;
        $this->view->list_nghi_phep = $list_nghi_phep;
    }

    public function addAction() {
        $translate = Zend_Registry::get('Zend_Translate');
        $this->view->title = 'Quản lý đơn nghỉ phép - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => 'canhan/layout',
            'layoutPath' => $layoutPath);
        Zend_Layout::startMvc($option);

        $auth = Zend_Auth::getInstance();
        $identity = $auth->getIdentity();
        $em_id = $identity->em_id;

        $error_message = array();
        $success_message = '';
        $xinnghiphepModel = new Front_Model_XinNghiPhep();
        if ($this->_request->isPost()) {
            $ly_do = trim($this->_arrParam['xnp_ly_do']);
            $chi_tiet = trim($this->_arrParam['xnp_chi_tiet']);
            $ngay_bat_dau = $this->_arrParam['xnp_from_date'];
            $ngay_ket_thuc = $this->_arrParam['xnp_to_date'];

            $validator_length = new Zend_Validate_StringLength(array('min' => 10, 'max' => 255));
            if (!$validator_length->isValid($ly_do)) {
                $error_message[] = 'Lý do phải lớn hơn 10 ký tự.';
            }

            if (!$ngay_bat_dau) {
                $error_message[] = 'Ngày bắt đầu không được để trống.';
            }

            if (!$ngay_ket_thuc) {
                $error_message[] = 'Ngày kết thúc không được để trống.';
            }

            if (!sizeof($error_message)) {
                $current_time = new Zend_Db_Expr('NOW()');

                $ngay_bat_dau = str_replace('/', '-', $ngay_bat_dau);
                $ngay_bat_dau = date('Y-m-d', strtotime($ngay_bat_dau));

                $ngay_ket_thuc = str_replace('/', '-', $ngay_ket_thuc);
                $ngay_ket_thuc = date('Y-m-d', strtotime($ngay_ket_thuc));

                $xinnghiphepModel->insert(array(
                    'xnp_em_id' => $em_id,
                    'xnp_ly_do' => $ly_do,
                    'xnp_chi_tiet' => $chi_tiet,
                    'xnp_from_date' => $ngay_bat_dau,
                    'xnp_to_date' => $ngay_ket_thuc,
                    'xnp_date_created' => $current_time
                        )
                );

                $users = $this->_helper->GlobalHelpers->checkDonViUsers($em_id, 3002);
                $thongbao_model = new Front_Model_ThongBao();
                $data = array();
                $data['tb_from'] = 0;
                $data['tb_tieu_de'] = '[Thông báo] Duyệt đơn xin nghỉ phép.';
                $data['tb_noi_dung'] = 'Có đơn xin nghỉ phép mới<br/> Bạn hãy vào <strong>Đơn vị => Duyệt nghỉ phép</strong> để xét duyệt.';
                $data['tb_status'] = 0;
                $data['tb_date_added'] = $current_time;
                $data['tb_date_modified'] = $current_time;

                foreach ($users as $user) {
                    $data['tb_to'] = $user->em_id;
                    $thongbao_model->insert($data);
                }

                $success_message = 'Đã nộp đơn nghỉ phép thành công.';
            }
        }
        $this->view->success_message = $success_message;
        $this->view->error_message = $error_message;
    }

    public function editAction() {
        $translate = Zend_Registry::get('Zend_Translate');
        $this->view->title = 'Quản lý đơn nghỉ phép - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => 'canhan/layout',
            'layoutPath' => $layoutPath);
        Zend_Layout::startMvc($option);

        $auth = Zend_Auth::getInstance();
        $identity = $auth->getIdentity();
        $em_id = $identity->em_id;
        $xnp_id = $this->_getParam('id', 0);
        $error_message = array();
        $success_message = '';
        $xinnghiphepModel = new Front_Model_XinNghiPhep();
        $xnp_info = $xinnghiphepModel->fetchRow($xinnghiphepModel->select()->where('xnp_id = ?', $xnp_id)->where('xnp_em_id=?', $em_id)->where('xnp_don_vi_status=?', '-1')->where('xnp_ptccb_status=?', '-1'));
        if ($xnp_info) {
            if ($this->_request->isPost()) {
                $ly_do = trim($this->_arrParam['xnp_ly_do']);
                $chi_tiet = trim($this->_arrParam['xnp_chi_tiet']);
                $ngay_bat_dau = $this->_arrParam['xnp_from_date'];
                $ngay_ket_thuc = $this->_arrParam['xnp_to_date'];

                $validator_length = new Zend_Validate_StringLength(array('min' => 10, 'max' => 255));
                if (!$validator_length->isValid($ly_do)) {
                    $error_message[] = 'Lý do phải lớn hơn 10 ký tự.';
                }

                if (!$ngay_bat_dau) {
                    $error_message[] = 'Ngày bắt đầu không được để trống.';
                }

                if (!$ngay_ket_thuc) {
                    $error_message[] = 'Ngày kết thúc không được để trống.';
                }

                if (!sizeof($error_message)) {
                    $current_time = new Zend_Db_Expr('NOW()');

                    $ngay_bat_dau = str_replace('/', '-', $ngay_bat_dau);
                    $ngay_bat_dau = date('Y-m-d', strtotime($ngay_bat_dau));

                    $ngay_ket_thuc = str_replace('/', '-', $ngay_ket_thuc);
                    $ngay_ket_thuc = date('Y-m-d', strtotime($ngay_ket_thuc));

                    $xinnghiphepModel->update(array(
                        'xnp_ly_do' => $ly_do,
                        'xnp_chi_tiet' => $chi_tiet,
                        'xnp_from_date' => $ngay_bat_dau,
                        'xnp_to_date' => $ngay_ket_thuc,
                        'xnp_date_created' => $current_time
                            ), 'xnp_id = ' . $xnp_id
                    );
                    $xnp_info = $xinnghiphepModel->fetchRow($xinnghiphepModel->select()->where('xnp_id = ?', $xnp_id));
                    $success_message = 'Đã sửa đơn nghỉ phép thành công.';
                }
            }
        }
        $this->view->xnp_info = $xnp_info;
        $this->view->success_message = $success_message;
        $this->view->error_message = $error_message;
    }

    function deleteAction() {
        $this->_helper->layout()->disableLayout();
        $xinnghiphepModel = new Front_Model_XinNghiPhep();
        if ($this->_request->isPost()) {
            $auth = Zend_Auth::getInstance();
            $identity = $auth->getIdentity();
            $em_id = $identity->em_id;
            $xnp_id = $this->_arrParam['xnp_id'];
            $xnp_info = $xinnghiphepModel->fetchRow($xinnghiphepModel->select()->where('xnp_id = ?', $xnp_id)->where('xnp_em_id=?', $em_id)->where('xnp_don_vi_status=?', '-1')->where('xnp_ptccb_status=?', '-1'));
            if ($xnp_info) {
                $success_message = $xinnghiphepModel->delete(array('xnp_id' => $xnp_id));
                $this->view->success_message = $success_message;
            }
        }
    }

}