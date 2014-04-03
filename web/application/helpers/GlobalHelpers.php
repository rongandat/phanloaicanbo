<?php

class GlobalHelpers extends Zend_Controller_Action_Helper_Abstract {

    public function checkPhongUsers($user_id = 0, $permission = 0) {
        $users = $groups = array();
        $groupsModel = new Front_Model_Groups();
        $employeeModel = new Front_Model_Employees();
        
        $list_groups = $groupsModel->getGroupByPermission($permission);
        $employeeInfo = $employeeModel->fetchRow('em_id=' . $user_id);        
        
        if ($list_groups) {
            foreach ($list_groups as $group) {
                $groups[] = $group->group_id;
            }
            $groups = implode(',', $groups);
            $list_users = $employeeModel->fetchAll("em_phong_ban in ($phong_ban_id) and em_status=1");
        }
                
        return $list_users;
    }

}
