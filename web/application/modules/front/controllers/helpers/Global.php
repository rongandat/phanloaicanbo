<?php

/**
 * Description of Global
 *
 * @author Nguyen
 */
class Zend_Controller_Action_Helper_Global extends Zend_Controller_Action_Helper_Abstract {

    function checkPermission($group_id, $permission_id) {

        if ($permission_id == '' || $permission_id == null) {
            $permission_id = 0;
        }
        $groupModel = new Front_Model_Groups();
        $check_group = $groupModel->checkPermission($group_id, $permission_id);
        if ($check_group->group_id) {
            return true;
        }
        return false;
    }

    function checkNangLuong($phong_ban = array()) {
        $date = time();
        $thang = date('m', $date);
        $nam = date('Y', $date);

        $employeesModel = new Front_Model_Employees();
        $nghachModel = new Front_Model_NgachCongChuc();
        $list_nghach = $nghachModel->fetchAll('ncc_status=1');

        $list_employees = array();
        foreach ($list_nghach as $nghach) {
            $nam_tim_kiem = $nam - $nghach->ncc_nam_nang_bac;            
            $list_employees = array_merge($list_employees, $employeesModel->getNangLuong($nghach->ncc_id, $thang, $nam_tim_kiem, $phong_ban));
        }
        
        $list_employees = array_merge($list_employees, $employeesModel->getNangPhuCap($thang, $nam-1, $phong_ban));
        $list_removed = array();
        foreach ($list_employees as $key_1 => $employees_1) {            
            foreach ($list_employees as $key_2 => $employees_2) {                
                if($key_1!=$key_2 && $employees_1['em_id']==$employees_2['em_id'] && !in_array($employees_1['em_id'], $list_removed)){                       
                    unset($list_employees[$key_2]);
                    $list_removed[] = $employees_1['em_id'];
                    break;
                }
            }
        }
        
        if (sizeof($list_employees)) {
            return $list_employees;
        }
        return 0;
    }

    function checkLuanChuyen() {
        $date = time();
        $thang = date('m', $date);
        $nam = date('Y', $date) - 3;

        $employeesModel = new Front_Model_Employees();
        $list_employees = $employeesModel->getLuanChuyen($thang, $nam, array())->toArray();
        if (sizeof($list_employees)) {
            return 1;
        }
        return 0;
    }

    function checkNghiHuu() {
        $employeesModel = new Front_Model_Employees();
        $list_employees = $employeesModel->getNghiHuu(array())->toArray();
        if (sizeof($list_employees)) {
            return 1;
        }
        return 0;
    }

}

?>
