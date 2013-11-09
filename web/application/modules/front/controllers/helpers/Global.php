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
        if($check_group->group_id){
            return true;
        }        
        return false;
    }

}

?>
