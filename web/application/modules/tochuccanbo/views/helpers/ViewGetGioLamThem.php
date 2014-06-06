<?php

class Zend_View_Helper_ViewGetGioLamThem extends Zend_Controller_Action_Helper_Abstract {

    /**
     * @var Zend_View_Interface 
     */
    public $view;

    public function viewGetGioLamThem($em_id, $ngay, $thang, $nam) {
        if ($em_id) {
            $lamthemgioModel = new Front_Model_LamThemGio();
            $lam_them_gio = $lamthemgioModel->fetchRowByDate($em_id, "$nam-$thang-$ngay 00:00:00", "$nam-$thang-$ngay 23:59:59", 1, 1);
            if ($lam_them_gio) {
                $tong_gio = 0;
                $tong_phut = 0;
                if ($lam_them_gio->ltg_gio_bat_dau) {
                    $tong_gio += $lam_them_gio->ltg_gio_ket_thuc - $lam_them_gio->ltg_gio_bat_dau;
                    if ($lam_them_gio->ltg_phut_ket_thuc < $lam_them_gio->ltg_phut_bat_dau) {
                        $tong_gio--;
                        $tong_phut += $lam_them_gio->ltg_phut_bat_dau - $lam_them_gio->ltg_phut_ket_thuc;
                    } else {
                        $tong_phut += $lam_them_gio->ltg_phut_ket_thuc - $lam_them_gio->ltg_phut_bat_dau;
                    }
                }

                if ($lam_them_gio->ltg_gio_bat_dau_chieu) {
                    $tong_gio += $lam_them_gio->ltg_gio_ket_thuc_chieu - $lam_them_gio->ltg_gio_bat_dau_chieu;
                    if ($lam_them_gio->ltg_phut_ket_thuc_chieu < $lam_them_gio->ltg_phut_bat_dau_chieu) {
                        $tong_gio--;
                        $tong_phut += $lam_them_gio->ltg_phut_bat_dau_chieu - $lam_them_gio->ltg_phut_ket_thuc_chieu;
                    } else {
                        $tong_phut += $lam_them_gio->ltg_phut_ket_thuc_chieu - $lam_them_gio->ltg_phut_bat_dau_chieu;
                    }
                }

                if ($tong_phut >= 60) {
                    $tong_gio++;
                    $tong_phut = $tong_phut - 60;
                }
                return array('gio' => $tong_gio, 'phut' => $tong_phut);
            }
            return false;
        }
        return false;
    }

    /**
     * Sets the view field 
     * @param $view Zend_View_Interface
     */
    public function setView(Zend_View_Interface $view) {
        $this->view = $view;
    }

}