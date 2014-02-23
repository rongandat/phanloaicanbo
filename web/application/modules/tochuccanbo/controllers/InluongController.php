<?php

class Tochuccanbo_InluongController extends Zend_Controller_Action {

    protected $_arrParam;
    protected $_page = 1;
    protected $_kw = '';
    protected $_actionMain;

    public function init() {
        $auth = Zend_Auth::getInstance();
        $identity = $auth->getIdentity();

        //kiem tra permission
        $check_permission = $this->_helper->global->checkPermission($identity->group_id, '4011');
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
        $this->view->title = 'In lương - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => '1_column/layout',
            'layoutPath' => $layoutPath);
        Zend_Layout::startMvc($option);

        $date = time();
        $thang = $this->_getParam('thang', date('m', $date));
        $nam = $this->_getParam('nam', date('Y', $date));
        $em_id = $this->_getParam('id', 0);
        $emModel = new Front_Model_Employees();
        $em_info = $emModel->fetchRow("em_id=$em_id");

        $khenthuongModel = new Front_Model_KhenThuong();
        $khen_thuong = $khenthuongModel->fetchByDate($em_id, "$nam-$thang-01 00:00:00", "$nam-$thang-31 23:59:59");

        $kyluatModel = new Front_Model_KyLuat();
        $ky_luat = $kyluatModel->fetchByDate($em_id, "$nam-$thang-01 00:00:00", "$nam-$thang-31 23:59:59");

        $bangluongModel = new Front_Model_BangLuong();
        $bang_luong = $bangluongModel->fetchByDate($em_id, "$nam-$thang-01 00:00:00", "$nam-$thang-31 23:59:59");

        $this->view->khen_thuong = $khen_thuong;
        $this->view->ky_luat = $ky_luat;
        $this->view->em_info = $em_info;
        $this->view->thang = $thang;
        $this->view->nam = $nam;
        $this->view->nv_id = $em_id;
        $this->view->bang_luong = $bang_luong;
    }

    function downAction() {
        $translate = Zend_Registry::get('Zend_Translate');
        $this->view->title = 'In lương - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => '1_column/layout',
            'layoutPath' => $layoutPath);
        Zend_Layout::startMvc($option);

        $date = time();
        $thang = $this->_getParam('thang', date('m', $date));
        $nam = $this->_getParam('nam', date('Y', $date));
        $em_id = $this->_getParam('id', 0);
        $emModel = new Front_Model_Employees();
        $em_info = $emModel->fetchRow("em_id=$em_id");

        $khenthuongModel = new Front_Model_KhenThuong();
        $khen_thuong = $khenthuongModel->fetchByDate($em_id, "$nam-$thang-01 00:00:00", "$nam-$thang-31 23:59:59");

        $kyluatModel = new Front_Model_KyLuat();
        $ky_luat = $kyluatModel->fetchByDate($em_id, "$nam-$thang-01 00:00:00", "$nam-$thang-31 23:59:59");

        $bangluongModel = new Front_Model_BangLuong();
        $bang_luong = $bangluongModel->fetchByDate($em_id, "$nam-$thang-01 00:00:00", "$nam-$thang-31 23:59:59");
        if (!$em_info || !$bang_luong) {
            $this->_helper->viewRenderer->setRender('loi');
        } else {

            $luong_thu_viec = 0;
            $luong_toi_thieu = $bang_luong->bl_luong_toi_thieu;
            $giai_doan = $bang_luong->bl_giai_doan;
            $loai_luong = $bang_luong->bl_loai_luong;
            $luong_thu_viec = $bang_luong->bl_luong_thu_viec;
            $he_so_luong = $bang_luong->bl_hs_luong;
            $bhxh = $bang_luong->bl_bhxh;
            $bhyt = $bang_luong->bl_bhyt;
            $hs_pc_cong_viec = $bang_luong->bl_hs_pc_cong_viec;
            $hs_pc_trach_nhiem = $bang_luong->bl_hs_pc_trach_nhiem;
            $hs_pc_khu_vuc = $bang_luong->bl_hs_pc_khu_vuc;
            $hs_pc_tnvk_phan_tram = $bang_luong->bl_hs_pc_tnvk;
            $tham_nien = $bang_luong->bl_tham_nien;
            $uu_dai_nghe = $bang_luong->bl_hs_pc_udn;
            $cong_vu = $bang_luong->bl_hs_pc_cong_vu;
            $kiem_nhiem = $bang_luong->bl_pc_kiem_nhiem;
            $hs_pc_khac = $bang_luong->bl_hs_pc_khac;
            $he_so_tang_them = $bang_luong->bl_pc_tang_them;

            $luong_toi_thieu_sau_bh = (int) ($luong_toi_thieu * (100 - ($bhxh + $bhyt)) / 100);
            $pc_cong_viec = (int) ($luong_toi_thieu * (100 - ($bhxh + $bhyt)) / 100);
            $pc_trach_nhiem = $luong_toi_thieu;
            $pc_khu_vuc = (int) ($luong_toi_thieu * (100 - $bhyt) / 100);
            $pc_tnvk = (int) ($luong_toi_thieu * (100 - ($bhxh + $bhyt)) / 100);
            $pc_cong_vu = $luong_toi_thieu;
            $pc_khac = $luong_toi_thieu;
            $pc_tham_nien = (int) ($luong_toi_thieu * (100 - ($bhxh + $bhyt)) / 100);
            $pc_kiem_nhiem = $luong_toi_thieu;
            $pc_uu_dai_nghe = $luong_toi_thieu;


            $thanh_tien_hsl = $luong_toi_thieu_sau_bh * $he_so_luong;


            $thanh_tien_pc_cong_viec = $hs_pc_cong_viec * $pc_cong_viec;


            $thanh_tien_pc_trach_nhiem = $hs_pc_trach_nhiem * $pc_trach_nhiem;


            $thanh_tien_pc_khu_vuc = $hs_pc_khu_vuc * $pc_khu_vuc;


            $hs_pc_tnvk = $he_so_luong * $hs_pc_tnvk_phan_tram / 100;
            $thanh_tien_pc_tham_nien_vuot_khung = $hs_pc_tnvk * $pc_tnvk;


            $hs_pc_tham_nien = floor((($he_so_luong + $hs_pc_cong_viec + $hs_pc_trach_nhiem + $hs_pc_khu_vuc) * $tham_nien / 100) * 100) / 100;
            $thanh_tien_pc_tham_nien = $hs_pc_tham_nien * $pc_tham_nien;


            $hs_pc_uu_dai_nghe = floor((($he_so_luong + $hs_pc_cong_viec + $hs_pc_tnvk) * $uu_dai_nghe / 100) * 100) / 100;
            $thanh_tien_pc_uu_dai_nghe = $hs_pc_uu_dai_nghe * $pc_uu_dai_nghe;


            $hs_pc_cong_vu = floor((($he_so_luong + $hs_pc_cong_viec + $hs_pc_tnvk) * $cong_vu / 100) * 100) / 100;
            $thanh_tien_pc_cong_vu = $hs_pc_cong_vu * $pc_cong_vu;


            $hs_pc_kiem_nhiem = floor((($he_so_luong + $hs_pc_cong_viec + $hs_pc_tnvk) * $kiem_nhiem / 100) * 100) / 100;
            $thanh_tien_pc_kiem_nhiem = $hs_pc_kiem_nhiem * $pc_kiem_nhiem;


            $thanh_tien_pc_khac = $hs_pc_khac * $pc_khac;
            $tong_1 = (int) ($thanh_tien_hsl + $thanh_tien_pc_cong_viec + $thanh_tien_pc_trach_nhiem + $thanh_tien_pc_khu_vuc + $thanh_tien_pc_tham_nien_vuot_khung + $thanh_tien_pc_tham_nien + $thanh_tien_pc_uu_dai_nghe + $thanh_tien_pc_cong_vu + $thanh_tien_pc_kiem_nhiem);


            $hs_tang_them = $he_so_luong + $hs_pc_cong_viec + $hs_pc_trach_nhiem + $hs_pc_khu_vuc + $hs_pc_tnvk + $hs_pc_tham_nien + $hs_pc_uu_dai_nghe + $hs_pc_cong_vu + $hs_pc_kiem_nhiem + $hs_pc_khac;
            $ti_le_tang_them = ($hs_tang_them - $hs_pc_kiem_nhiem) * $luong_toi_thieu * $he_so_tang_them;
            $tong_2 = (int) $tong_1 + $ti_le_tang_them;

            $tong_khen_thuong = 0;
            if (sizeof($khen_thuong)) {
                foreach ($khen_thuong as $kt) {
                    $tong_khen_thuong +=$kt->kt_money;
                }
            }

            $tong_khien_trach = 0;
            foreach ($ky_luat as $kl) {
                $tong_khien_trach +=$kl->kl_money;
            }

            $tong_cong = $tong_2 + $tong_khen_thuong - $tong_khien_trach;
            
            $mpdf = new mPDF();

            $text_outout = '
                <table width="500pt" border="0">
                    <tr>
                        <td width="200" style="text-align:center;">TỔNG CỤC HẢI QUAN
                            <div><strong>CỤC HẢI QUAN HÀ TĨNH</strong></div>
                        </td>
                        <td width="342">&nbsp;</td>
                        <td width="23">&nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="3" style="text-align:center; font-size: 11pt; padding-top:10pt">BẢNG LƯƠNG THÁNG ' . $thang . '-' . $nam . '</td>
                    </tr>
                    <tr>
                        <td colspan="3" style="text-align:left; font-size: 10pt; padding-top:10pt">
                            Thông tin cá nhân
                            <table width="500pt" border="1" style="margin-top: 5pt; margin-bottom: 10pt;  font-family: Mono; padding: 10pt; font-size: 9pt;">                                
                                <tr>
                                        <td style="padding-top: 2pt; width: 120pt; padding-bottom: 2pt;">Họ tên</td>
                                        <td style="padding-top: 2pt; width: 80pt; padding-bottom: 2pt;">Giới tính</td>
                                        <td style="padding-top: 2pt; width: 100pt; padding-bottom: 2pt;">Ngày sinh</td>
                                        <td style="padding-top: 2pt; width: 100pt; padding-bottom: 2pt;">Phòng ban</td>
                                        <td style="padding-top: 2pt; width: 100pt; padding-bottom: 2pt;">Chức vụ</td>
                                </tr>
                                <tr>
                                        <td style="padding-top: 2pt; padding-bottom: 2pt;">' . $em_info->em_ho . ' ' . $em_info->em_ten_dem . ' ' . $em_info->em_ten . '</td>
                                        <td style="padding-top: 2pt; padding-bottom: 2pt;">' . ($em_info->em_gioi_tinh ? 'Nam' : 'Nữ') . '</td>
                                        <td style="padding-top: 2pt; padding-bottom: 2pt;">' . date('d-m-Y', strtotime($em_info->em_ngay_sinh)) . '</td>
                                        <td style="padding-top: 2pt; padding-bottom: 2pt;">' . $this->view->viewGetPhongBanName($em_info->em_phong_ban) . '</td>
                                        <td style="padding-top: 2pt; padding-bottom: 2pt;">' . $this->view->viewGetChucVuName($em_info->em_chuc_vu) . '</td>
                                </tr>                        
                            </table>
                            Thông tin cá nhân
                            <table width="500pt" border="1" style="margin-top: 5pt;  margin-bottom: 10pt; font-family: Mono; padding: 10pt; font-size: 9pt;" class="widecells">                                
                                <tr>
                                        <td style="padding-top: 2pt; padding-bottom: 2pt;">Lương cơ bản</td>   
                                        ' . ($giai_doan ? '<td style="padding-top: 2pt; padding-bottom: 2pt;">Thử việc</td>  ' : '') . '
                                        <td style="padding-top: 2pt; width: 70pt; padding-bottom: 2pt;">BHXH</td>
                                        <td style="padding-top: 2pt; width: 70pt; padding-bottom: 2pt;">BHYT</td>
                                        <td style="padding-top: 2pt; width: 190pt; padding-bottom: 2pt;">Đã trừ BHXH+BHYT</td>
                                </tr>
                                <tr>
                                        <td style="padding-top: 2pt; padding-bottom: 2pt;">' . number_format($luong_toi_thieu, 0, '.', ',') . '</td>
                                        ' . ($giai_doan ? '<td style="padding-top: 2pt; padding-bottom: 2pt;">' . $luong_thu_viec . '%</td>  ' : '') . '
                                        <td style="padding-top: 2pt; padding-bottom: 2pt;">' . $bhxh . '%</td>
                                        <td style="padding-top: 2pt; padding-bottom: 2pt;">' . $bhyt . '%</td>
                                        <td style="padding-top: 2pt; padding-bottom: 2pt;">
                                            Lương tối thiểu: ' . number_format($luong_toi_thieu_sau_bh, 0, '.', ',') . '<br>
                                            PC công việc: ' . number_format($pc_cong_viec, 0, '.', ',') . '<br>
                                            PC trách nhiệm: ' . number_format($pc_trach_nhiem, 0, '.', ',') . '<br>
                                            PC khu vực: ' . number_format($pc_khu_vuc, 0, '.', ',') . '<br>
                                            PC TNVK: ' . number_format($pc_tnvk, 0, '.', ',') . ' <br>
                                            PC công vụ: ' . number_format($pc_cong_vu, 0, '.', ',') . '<br>
                                            PC khác: ' . number_format($pc_khac, 0, '.', ',') . '<br>
                                            PC thâm niên: ' . number_format($pc_tham_nien, 0, '.', ',') . '<br>
                                            PC kiêm nhiệm: ' . number_format($pc_kiem_nhiem, 0, '.', ',') . '<br>
                                            PC ưu đãi nghề: ' . number_format($pc_uu_dai_nghe, 0, '.', ',') . '<br>
                                        </td>
                                </tr>                               
                            </table>
                            Bảng lương
                            <table width="500pt" border="1" style="margin-top: 5pt;  margin-bottom: 10pt; font-family: Mono; padding: 10pt; font-size: 9pt;" class="widecells">                                
                                <tr>
                                        <td style="padding-top: 2pt; width: 150pt; padding-bottom: 2pt;">Tên</td>
                                        <td style="padding-top: 2pt; width: 245pt; padding-bottom: 2pt;" colspan="2">Hệ số</td>
                                        <td style="padding-top: 2pt; width: 105pt; padding-bottom: 2pt;">Thành tiền</td>
                                </tr>
                                <tr>
                                        <tr>
                                            <td>Hệ số lương</td>
                                            <td colspan="2">' . $he_so_luong . '</td>
                                            <td>' . number_format($thanh_tien_hsl, 0, '.', ',') . '</td>
                                        </tr>
                                        <tr>
                                            <td>PC công việc</td>
                                            <td colspan="2">' . $hs_pc_cong_viec . '</td>
                                            <td>' . number_format($thanh_tien_pc_cong_viec, 0, '.', ',') . '</td>
                                        </tr>
                                        <tr>
                                            <td>PC trách nhiệm</td>
                                            <td colspan="2">' . $hs_pc_trach_nhiem . '</td>
                                            <td>' . number_format($thanh_tien_pc_trach_nhiem, 0, '.', ',') . '</td>
                                        </tr>
                                        <tr>
                                            <td>PC khu vực</td>
                                            <td colspan="2">' . $hs_pc_khu_vuc . '</td>
                                            <td>' . number_format($thanh_tien_pc_khu_vuc, 0, '.', ',') . '</td>
                                        </tr>
                                        <tr>
                                            <td>PC thâm niên vượt khung</td>
                                            <td style="width: 100px;">' . $hs_pc_tnvk_phan_tram . '%</td>
                                            <td>' . $hs_pc_tnvk . '</td>
                                            <td>' . number_format($thanh_tien_pc_tham_nien_vuot_khung, 0, '.', ',') . '</td>
                                        </tr>
                                        <tr>
                                            <td>PC thâm niên</td>
                                            <td style="width: 100px;">' . $tham_nien . ' Năm</td>
                                            <td>' . $hs_pc_tham_nien . '</td>
                                            <td>' . number_format($thanh_tien_pc_tham_nien, 0, '.', ',') . '</td>
                                        </tr>
                                        <tr>
                                            <td>PC ưu đãi nghề</td>
                                            <td style="width: 100px;">' . $uu_dai_nghe . '%</td>
                                            <td>' . $hs_pc_uu_dai_nghe . '</td>
                                            <td>' . number_format($thanh_tien_pc_uu_dai_nghe, 0, '.', ',') . '</td>
                                        </tr>
                                        <tr>
                                            <td>PC công vụ</td>
                                            <td style="width: 100px;">' . $cong_vu . '%</td>
                                            <td>' . $hs_pc_cong_vu . '</td>
                                            <td>' . number_format($thanh_tien_pc_cong_vu, 0, '.', ',') . '</td>
                                        </tr>
                                        <tr>
                                            <td>PC kiêm nhiệm</td>
                                            <td colspan="2">' . $hs_pc_kiem_nhiem . '</td>
                                            <td>' . number_format($thanh_tien_pc_kiem_nhiem, 0, '.', ',') . '</td>
                                        </tr>
                                        <tr>
                                            <td>PC khác</td>
                                            <td colspan="2">' . $hs_pc_khac . '</td>
                                            <td>' . number_format($thanh_tien_pc_khac, 0, '.', ',') . '</td>
                                        </tr>
                                        <tr>
                                            <td colspan="3">Tổng cộng (I)</td>
                                            <td>' . number_format($tong_1, 0, '.', ',') . '</td>
                                        </tr>
                                        <tr>
                                            <td>Tỷ lệ tăng thêm</td>
                                            <td colspan="2">' . $hs_tang_them . '</td>
                                            <td>' . number_format($ti_le_tang_them, 0, '.', ',') . '</td>
                                        </tr>
                                        <tr>
                                            <td colspan="3"><strong>Tổng cộng (II)</strong></td>
                                            <td><strong>' . number_format($tong_2, 0, '.', ',') . '</strong></td>
                                        </tr>
                                </tr>                               
                            </table>
                            
                            Khen thưởng
                            <table width="500pt" border="1" style="margin-top: 5pt;  margin-bottom: 10pt; font-family: Mono; padding: 10pt; font-size: 9pt;" class="widecells">                                
                                <tr>
                                        <td style="padding-top: 2pt; width: 15pt; padding-bottom: 2pt;">#</td>
                                        <td style="padding-top: 2pt; width: 80pt; padding-bottom: 2pt;">Ngày</td>
                                        <td style="padding-top: 2pt; width: 300pt; padding-bottom: 2pt;">Lý do</td>
                                        <td style="padding-top: 2pt; width: 105pt; padding-bottom: 2pt;">Mức thưởng</td>
                                </tr>';
            if (sizeof($khen_thuong)) {
                $i = 0;
                foreach ($khen_thuong as $kt) {
                    $i++;

                    $text_outout .= '<tr id="r_kl_' . $kt->kt_id . '"><td>' . $i . '</td>
                                        <td>' . date('d-m-Y', strtotime($kt->kt_date)) . '</td>
                                        <td>' . $kt->kt_ly_do . '</td>
                                        <td>' . number_format($kt->kt_money, 0, '.', ',') . '</td>
                                    </tr>';
                }
            } else {
                echo '<tr><td colspan="4">Không có khen thưởng nào!</td></tr>';
            }


            $text_outout.= '<tr>
                                        <td colspan="3"><strong>Tổng cộng (III)</strong></td>
                                        <td><strong>' . number_format($tong_khen_thuong, 0, '.', ',') . '</strong></td>
                                    </tr>                            
                            </table>
                           Kỷ luật
                            <table width="500pt" border="1" style="margin-top: 5pt;  margin-bottom: 10pt; font-family: Mono; padding: 10pt; font-size: 9pt;" class="widecells">                                
                                <tr>
                                        <td style="padding-top: 2pt; width: 15pt; padding-bottom: 2pt;">#</td>
                                        <td style="padding-top: 2pt; width: 80pt; padding-bottom: 2pt;">Ngày</td>
                                        <td style="padding-top: 2pt; width: 300pt; padding-bottom: 2pt;">Lý do</td>
                                        <td style="padding-top: 2pt; width: 105pt; padding-bottom: 2pt;">Mức phạt</td>
                                </tr>';


            if (sizeof($ky_luat)) {
                $i = 0;
                foreach ($ky_luat as $kl) {
                    $i++;

                    $text_outout .= '<tr id="r_kl_' . $kl->kl_id . '"><td>' . $i . '</td>
                                        <td>' . date('d-m-Y', strtotime($kl->kl_date)) . '</td>
                                        <td>' . $kl->kl_ly_do . '</td>
                                        <td>' . number_format($kl->kl_money, 0, '.', ',') . '</td>
                                    </tr>';
                }
            } else {
                echo '<tr><td colspan="4">Không có kỷ luật/khiển trách nào nào!</td></tr>';
            }

            $text_outout .= '<tr>
                                        <td colspan="3"><strong>Tổng cộng (IV)</strong></td>
                                        <td><strong>' . number_format($tong_khien_trach, 0, '.', ',') . '</strong></td>
                                    </tr>                            
                            </table>
                            <table width="500pt" border="1" style="margin-top: 5pt;  margin-bottom: 10pt; font-family: Mono; padding: 10pt; font-size: 9pt;" class="widecells">                                
                                <tr>
                                        <td style="padding-top: 2pt; padding-bottom: 2pt;">Tổng được nhận = II + III + IV</td>
                                        <td style="padding-top: 2pt; width: 105pt; padding-bottom: 2pt;"><strong>' . number_format($tong_cong, 0, '.', ',') . '</strong></td>
                                </tr>                          
                            </table>
                        </td>
                    </tr>
                </table>
            ';

            $mpdf->WriteHTML($text_outout);

            $file_name = $this->loc_tieng_viet($em_info->em_ho).'_'.$this->loc_tieng_viet($em_info->em_ten_dem).'_' . $this->loc_tieng_viet($em_info->em_ten) . '_' . $thang . '-' . $nam . '.pdf';
            $mpdf->Output($file_name, 'D');
            die();
        }
    }

    function loc_tieng_viet($chuoi_vao) {
        $marTViet = array("à", "á", "ạ", "ả", "ã", "â", "ầ", "ấ", "ậ", "ẩ", "ẫ", "ă",
            "ằ", "ắ", "ặ", "ẳ", "ẵ", "è", "é", "ẹ", "ẻ", "ẽ", "ê", "ề"
            , "ế", "ệ", "ể", "ễ",
            "ì", "í", "ị", "ỉ", "ĩ",
            "ò", "ó", "ọ", "ỏ", "õ", "ô", "ồ", "ố", "ộ", "ổ", "ỗ", "ơ"
            , "ờ", "ớ", "ợ", "ở", "ỡ",
            "ù", "ú", "ụ", "ủ", "ũ", "ư", "ừ", "ứ", "ự", "ử", "ữ",
            "ỳ", "ý", "ỵ", "ỷ", "ỹ",
            "đ",
            "À", "Á", "Ạ", "Ả", "Ã", "Â", "Ầ", "Ấ", "Ậ", "Ẩ", "Ẫ", "Ă"
            , "Ằ", "Ắ", "Ặ", "Ẳ", "Ẵ",
            "È", "É", "Ẹ", "Ẻ", "Ẽ", "Ê", "Ề", "Ế", "Ệ", "Ể", "Ễ",
            "Ì", "Í", "Ị", "Ỉ", "Ĩ",
            "Ò", "Ó", "Ọ", "Ỏ", "Õ", "Ô", "Ồ", "Ố", "Ộ", "Ổ", "Ỗ", "Ơ"
            , "Ờ", "Ớ", "Ợ", "Ở", "Ỡ",
            "Ù", "Ú", "Ụ", "Ủ", "Ũ", "Ư", "Ừ", "Ứ", "Ự", "Ử", "Ữ",
            "Ỳ", "Ý", "Ỵ", "Ỷ", "Ỹ",
            "Đ");

        $marKoDau = array("a", "a", "a", "a", "a", "a", "a", "a", "a", "a", "a"
            , "a", "a", "a", "a", "a", "a",
            "e", "e", "e", "e", "e", "e", "e", "e", "e", "e", "e",
            "i", "i", "i", "i", "i",
            "o", "o", "o", "o", "o", "o", "o", "o", "o", "o", "o", "o"
            , "o", "o", "o", "o", "o",
            "u", "u", "u", "u", "u", "u", "u", "u", "u", "u", "u",
            "y", "y", "y", "y", "y",
            "d",
            "A", "A", "A", "A", "A", "A", "A", "A", "A", "A", "A", "A"
            , "A", "A", "A", "A", "A",
            "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E",
            "I", "I", "I", "I", "I",
            "O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O"
            , "O", "O", "O", "O", "O",
            "U", "U", "U", "U", "U", "U", "U", "U", "U", "U", "U",
            "Y", "Y", "Y", "Y", "Y",
            "D");
        $chuoi_ra = str_replace($marTViet, $marKoDau, $chuoi_vao);
        return $chuoi_ra;
    }

}