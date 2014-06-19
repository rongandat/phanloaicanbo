<?php

class Canhan_DanhgiaphanloaiController extends Zend_Controller_Action {

    protected $_arrParam;
    protected $_page = 1;
    protected $_kw = '';
    protected $_actionMain;

    public function init() {
        $auth = Zend_Auth::getInstance();
        $identity = $auth->getIdentity();

        //kiem tra permission
        $check_permission = $this->_helper->global->checkPermission($identity->group_id, '2008');
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
        $this->view->title = 'Tự đánh giá phân loại - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => 'canhan/layout',
            'layoutPath' => $layoutPath);

        Zend_Layout::startMvc($option);
        $this->view->page = $this->_page;

        $date = new Zend_Date();
        $date->subMonth(1);
        $thang = $this->_getParam('thang', $date->toString("M"));
        $nam = $this->_getParam('nam', $date->toString("Y"));

        $auth = Zend_Auth::getInstance();
        $identity = $auth->getIdentity();
        $em_id = $identity->em_id;

        $danhgiaModel = new Front_Model_DanhGia();
        $danh_gia = $danhgiaModel->fetchOneData(array('dg_em_id' => $em_id, 'dg_thang' => $thang, 'dg_nam' => $nam));

        $tieuchiModel = new Front_Model_TieuChiDanhGiaCB();
        $list_tieuchi = $tieuchiModel->fetchData(array('tcdgcb_status' => 1), 'tcdgcb_order ASC');

        $ketquaModel = new Front_Model_DanhGiaKetQuaCV();
        $list_ketqua = $ketquaModel->fetchData(array('dgkqcv_status' => 1), 'dgkqcv_order ASC');

        $error_message = array();
        $success_message = '';

        if ($this->_request->isPost()) {
            $cong_viec = $this->_arrParam['d_cong_viec'];
            $kq_cong_viec = $this->_arrParam['d_kq_cong_viec'];
            $ngay_nghi = $this->_arrParam['d_ngay_nghi'];
            $ly_do_nghi = $this->_arrParam['d_ly_do'];
            $y_thuc_tn = $this->_arrParam['d_y_thuc'];
            $khuyet_diem = $this->_arrParam['d_khuyet_diem'];
            $tc_danh_gia = serialize($this->_arrParam['d_tieu_chi']);
            $ghi_chu = $this->_arrParam['d_ghi_chu'];
            $phan_loai = $this->_arrParam['d_phan_loai'];
            $current_time = new Zend_Db_Expr('NOW()');
            if ($danh_gia && ($danh_gia->dg_don_vi_status != '' || $danh_gia->dg_ptccb_status != '')) {
                $error_message[] = 'Đánh giá phân loại đã được duyệt nên không thể thay đổi.';
            }

            if (!$cong_viec) {
                $error_message[] = 'Công việc trong tháng không được để trống';
            }
            if (!sizeof($error_message)) {
                if ($danh_gia) {
                    $danhgiaModel->update(array(
                        'dg_cong_viec' => $cong_viec,
                        'dg_ket_qua_cong_viec' => $kq_cong_viec,
                        'dg_so_ngay_nghi' => $ngay_nghi,
                        'dg_ly_do_nghi' => $ly_do_nghi,
                        'dg_y_thuc_xay_dung' => $y_thuc_tn,
                        'dg_khuyet_diem' => $khuyet_diem,
                        'dg_tc_danh_gia' => $tc_danh_gia,
                        'dg_ghi_chu' => $ghi_chu,
                        'dg_phan_loai' => $phan_loai,
                        'dg_date_modifyed' => $current_time
                            ), 'dg_id=' . $danh_gia->dg_id
                    );
                } else {
                    $danhgiaModel->insert(array(
                        'dg_em_id' => $em_id,
                        'dg_thang' => $thang,
                        'dg_nam' => $nam,
                        'dg_cong_viec' => $cong_viec,
                        'dg_ket_qua_cong_viec' => $kq_cong_viec,
                        'dg_so_ngay_nghi' => $ngay_nghi,
                        'dg_ly_do_nghi' => $ly_do_nghi,
                        'dg_y_thuc_xay_dung' => $y_thuc_tn,
                        'dg_khuyet_diem' => $khuyet_diem,
                        'dg_tc_danh_gia' => $tc_danh_gia,
                        'dg_ghi_chu' => $ghi_chu,
                        'dg_phan_loai' => $phan_loai,
                        'dg_date_modifyed' => $current_time,
                        'dg_date_created' => $current_time
                            )
                    );
                }
            }

            $users = $this->_helper->GlobalHelpers->checkDonViUsers($em_id,3005);
            $thongbao_model = new Front_Model_ThongBao();
            $data = array();
            $data['tb_from'] = 0;
            $data['tb_tieu_de'] = '[Thông báo] Duyệt đánh giá phân loại.';
            $data['tb_noi_dung'] = 'Có khai báo đánh giá phân loại mới.<br/> Bạn hãy <strong><a href="'.$this->view->baseUrl('donvi/duyetphanloai').'">click vào đây</a></strong> để xét duyệt.';
            $data['tb_status'] = 0;
            $data['tb_date_added'] = $current_time;
            $data['tb_date_modified'] = $current_time;

            foreach ($users as $user) {
                $data['tb_to'] = $user->em_id;
                $thongbao_model->insert($data);
            }

            $success_message = 'Đã cập nhật thành công.';
            $danh_gia = $danhgiaModel->fetchOneData(array('dg_em_id' => $em_id, 'dg_thang' => $thang, 'dg_nam' => $nam));
        }

        if ($danh_gia) {
            $this->_arrParam['d_cong_viec'] = $danh_gia->dg_cong_viec;
            $this->_arrParam['d_kq_cong_viec'] = $danh_gia->dg_ket_qua_cong_viec;
            $this->_arrParam['d_ngay_nghi'] = $danh_gia->dg_so_ngay_nghi;
            $this->_arrParam['d_ly_do'] = $danh_gia->dg_ly_do_nghi;
            $this->_arrParam['d_y_thuc'] = $danh_gia->dg_y_thuc_xay_dung;
            $this->_arrParam['d_khuyet_diem'] = $danh_gia->dg_khuyet_diem;
            $this->_arrParam['d_tieu_chi'] = unserialize($danh_gia->dg_tc_danh_gia);
            $this->_arrParam['d_ghi_chu'] = $danh_gia->dg_ghi_chu;
            $this->_arrParam['d_phan_loai'] = $danh_gia->dg_phan_loai;
        }

        $this->view->tieu_chi = $list_tieuchi;
        $this->view->ket_qua = $list_ketqua;
        $this->view->success_message = $success_message;
        $this->view->error_message = $error_message;
        $this->view->thang = $thang;
        $this->view->nam = $nam;
        $this->view->danh_gia = $danh_gia;
        $this->view->arrParam = $this->_arrParam;
    }

}