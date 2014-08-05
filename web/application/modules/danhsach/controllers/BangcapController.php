<?php

class Danhsach_BangcapController extends Zend_Controller_Action {

    protected $_arrParam;
    protected $_page = 1;
    protected $_kw = '';
    protected $_actionMain;

    public function init() {
        $auth = Zend_Auth::getInstance();
        $identity = $auth->getIdentity();

        //kiem tra permission
        $check_permission = $this->_helper->global->checkPermission($identity->group_id, '5003');
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

    public function xuatAction() {
        //$inputFileName = APPLICATION_PATH . "/../tmp/Mau_Ca_Nhan_Excel.xlsx";
        $inputFileName = APPLICATION_PATH . "/../tmp/xuat_du_lieu.xlsx";

        $objPHPExcel = PHPExcel_IOFactory::load($inputFileName);

        $objPHPExcel->getProperties()->setCreator("Cục Hải Quan Hà Tĩnh");
        $objPHPExcel->getProperties()->setLastModifiedBy("Cục Hải Quan Hà Tĩnh");
        $objPHPExcel->getProperties()->setTitle("Bảng thông tin");
        $objPHPExcel->getProperties()->setSubject("Bảng thông tin");
        $objPHPExcel->getProperties()->setDescription("Bảng thông tin nhân viên - Cục Hải Quan Hà Tĩnh");


        $translate = Zend_Registry::get('Zend_Translate');
        $this->view->title = 'Lọc danh sách theo bằng cấp - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => 'danhsach/layout',
            'layoutPath' => $layoutPath);
        Zend_Layout::startMvc($option);

        $filter_selected = $this->_getParam('id', 0);

        $date = time();
        $thang = date('m', $date);
        $nam = date('Y', $date);

        $emModel = new Front_Model_Employees();
        $hesoModel = new Front_Model_EmployeesHeso();
        $phucapModel = new Front_Model_EmployeesPhuCap();
        $filters = array();
        if ($filter_selected)
            $filters['em_bang_cap'] = $filter_selected;
        $list_items = $emModel->getListNhanVienDanhSachTheoChucVu($filters);
        $i = 4;
        if (sizeof($list_items)) {
            $stt = 1;
            foreach ($list_items as $item) {
                $time_tang_bac = 0;
                $em_he_so = $hesoModel->getCurrentHeSo($thang, $nam, $item->em_id);
                $em_phu_cap = $phucapModel->getCurrentHeSo($thang, $nam, $item->em_id);

                $objPHPExcel->setActiveSheetIndex(0);
                $ngach_cong_chuc = $this->view->viewGetNgachCongChuc($item->em_ngach_cong_chuc);
                $objPHPExcel->getActiveSheet()->SetCellValue('A' . $i, $stt);
                $objPHPExcel->getActiveSheet()->SetCellValue('B' . $i, $item->em_ho . ' ' . $item->em_ten);
                $objPHPExcel->getActiveSheet()->SetCellValue('C' . $i, $item->em_ho);
                $objPHPExcel->getActiveSheet()->SetCellValue('D' . $i, $item->em_ten);
                if ($item->em_gioi_tinh) {
                    if ($item->em_ngay_sinh && $item->em_ngay_sinh != '' && $item->em_ngay_sinh != '0000-00-00 00:00:00')
                        $objPHPExcel->getActiveSheet()->SetCellValue('E' . $i, date('m/Y', strtotime($item->em_ngay_sinh)));
                } else {
                    if ($item->em_ngay_sinh && $item->em_ngay_sinh != '' && $item->em_ngay_sinh != '0000-00-00 00:00:00')
                        $objPHPExcel->getActiveSheet()->SetCellValue('F' . $i, date('m/Y', strtotime($item->em_ngay_sinh)));
                }
                $objPHPExcel->getActiveSheet()->SetCellValue('G' . $i, $this->view->viewGetChucVuName($item->em_chuc_vu));
                $objPHPExcel->getActiveSheet()->SetCellValue('H' . $i, $this->view->viewGetPhongBanName($item->em_phong_ban));

                if ($ngach_cong_chuc) {
                    $objPHPExcel->getActiveSheet()->SetCellValue('I' . $i, $ngach_cong_chuc->ncc_ma_ngach);
                    $objPHPExcel->getActiveSheet()->SetCellValue('J' . $i, $ngach_cong_chuc->ncc_name);
                    $time_tang_bac = $ngach_cong_chuc->ncc_nam_nang_bac;
                }
                if ($item->em_time_cong_tac && $item->em_time_cong_tac != '' && $item->em_time_cong_tac != '0000-00-00 00:00:00')
                    $objPHPExcel->getActiveSheet()->SetCellValue('L' . $i, date('m/Y', strtotime($item->em_time_cong_tac)));

                foreach (unserialize($item->em_lich_su_dao_tao) as $item_daotao) {
                    $objPHPExcel->getActiveSheet()->SetCellValue('M' . $i, $item_daotao['chuyen_nghanh']);
                    $objPHPExcel->getActiveSheet()->SetCellValue('N' . $i, $item_daotao['ten_truong']);
                    $objPHPExcel->getActiveSheet()->SetCellValue('O' . $i, $item_daotao['van_bang']);
                    $objPHPExcel->getActiveSheet()->SetCellValue('P' . $i, $item_daotao['hinh_thuc']);
                }

                $objPHPExcel->getActiveSheet()->SetCellValue('Q' . $i, $this->view->viewGetQuanLyNhaNuocName($item->em_quan_ly_nha_nuoc));
                $objPHPExcel->getActiveSheet()->SetCellValue('R' . $i, $this->view->viewGetLyLuanChinhTriName($item->em_ly_luan_chinh_tri));

                if ($item->em_chuc_vu_dang) {
                    $objPHPExcel->getActiveSheet()->SetCellValue('S' . $i, 'X');
                }
                if ($em_he_so) {
                    $bac_luong = $this->view->viewGetBacLuong($em_he_so->eh_bac_luong);
                    if ($bac_luong) {
                        $objPHPExcel->getActiveSheet()->SetCellValue('T' . $i, $bac_luong->bl_name);
                        $objPHPExcel->getActiveSheet()->SetCellValue('W' . $i, date('1/m', strtotime($em_he_so->eh_han_dieu_chinh)) . (date('Y', strtotime($em_he_so->eh_han_dieu_chinh)) + $time_tang_bac));
                    }
                    $objPHPExcel->getActiveSheet()->SetCellValue('U' . $i, $em_he_so->eh_he_so);

                    if ($em_phu_cap) {
                        $hs_pc_chuc_vu = $em_phu_cap->eh_pc_cong_viec;
                        $hs_pc_tnvk_phan_tram = $em_phu_cap->eh_pc_tnvk_phan_tram;
                        $he_so_luong = $em_he_so->eh_he_so;
                        $hs_pc_tnvk = ($he_so_luong + $hs_pc_chuc_vu) * $hs_pc_tnvk_phan_tram / 100;
                        if ($em_phu_cap->eh_tham_niem && $em_phu_cap->eh_tham_niem != '' && $em_phu_cap->eh_tham_niem != '0000-00-00 00:00:00')
                            $objPHPExcel->getActiveSheet()->SetCellValue('K' . $i, date('1/m/Y', strtotime($em_phu_cap->eh_tham_niem)));
                        if ($em_he_so->eh_han_dieu_chinh && $em_he_so->eh_han_dieu_chinh != '' && $em_he_so->eh_han_dieu_chinh != '0000-00-00 00:00:00')
                            $objPHPExcel->getActiveSheet()->SetCellValue('V' . $i, date('1/m/Y', strtotime($em_he_so->eh_han_dieu_chinh)));
                        $objPHPExcel->getActiveSheet()->SetCellValue('X' . $i, number_format($hs_pc_tnvk, 0, '.', ','));
                    }
                }

                $objPHPExcel->getActiveSheet()->SetCellValue('Y' . $i, $item->em_so_cong_chuc);
                $objPHPExcel->getActiveSheet()->SetCellValue('Z' . $i, $item->em_phone);

                $i++;
                $stt++;
            }
            header('Content-Type: application/vnd.ms-excel');
            header('Content-Disposition: attachment;filename="Bang_Thong_Tin_Nhan_Vien_Theo_Bang_Cap.xls"');
            header('Cache-Control: max-age=0');
            $objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel2007');
            $objWriter->save('php://output');
            die();
        } else {
            die('Không có dữ liệu nào');
        }
    }

    public function indexAction() {
        $translate = Zend_Registry::get('Zend_Translate');
        $this->view->title = 'Lọc danh sách theo bằng cấp - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => 'danhsach/layout',
            'layoutPath' => $layoutPath);
        Zend_Layout::startMvc($option);

        $filter_selected = $this->_getParam('id', 0);

        $emModel = new Front_Model_Employees();
        $bangcapModel = new Front_Model_Bangcap();
        $list_bang_cap = $bangcapModel->fetchData(array('bc_status' => 1));
        $filters = array();
        if ($filter_selected)
            $filters['em_bang_cap'] = $filter_selected;
        $list_items = $emModel->getListNhanVienDanhSachTheoChucVu($filters);
        $paginator = Zend_Paginator::factory($list_items);
        $paginator->setItemCountPerPage(NUM_PER_PAGE);
        $paginator->setCurrentPageNumber($this->_page);
        $this->view->page = $this->_page;
        $this->view->paginator = $paginator;
        $this->view->filter = $list_bang_cap;
        $this->view->filter_selected = $filter_selected;
    }

}
