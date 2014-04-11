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

    function checkNangLuong() {
        $date = time();
        $thang = date('m', $date);
        $nam = date('Y', $date);

        $employeesModel = new Front_Model_Employees();
        $list_employees = $employeesModel->getNangLuong($thang, $nam, array())->toArray();
        if (sizeof($list_employees)) {
            return 1;
        }
        return 0;
    }

    function checkLuanChuyen() {
        $date = time();
        $thang = date('m', $date);
        $nam = date('Y', $date);

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
