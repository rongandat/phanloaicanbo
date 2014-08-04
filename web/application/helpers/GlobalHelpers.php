<?php

class GlobalHelpers extends Zend_Controller_Action_Helper_Abstract {

    public function checkDonViUsers($user_id = 0, $permission = 0) {
        $users = $groups = array();
        $groupsModel = new Front_Model_Groups();
        $employeeModel = new Front_Model_Employees();

        $list_groups = $groupsModel->getGroupByPermission($permission);
        $employeeInfo = $employeeModel->fetchRow('em_id=' . $user_id);

        if ($list_groups) {
            foreach ($list_groups as $group) {
                $groups[] = $group->group_id;
            }
            $users = $employeeModel->getUsersByGroupsAndPhong($groups, $employeeInfo->em_phong_ban);
        }
        return $users;
    }

    public function checkToChucUsers($permission = 0) {
        $users = $groups = array();
        $groupsModel = new Front_Model_Groups();
        $employeeModel = new Front_Model_Employees();
        $list_groups = $groupsModel->getGroupByPermission($permission);
        if ($list_groups) {
            foreach ($list_groups as $group) {
                $groups[] = $group->group_id;
            }
            $users = $employeeModel->getUsersByGroups($groups);
        }
        return $users;
    }

}
