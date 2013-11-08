<?php

class Front_Model_Groups extends Zend_Db_Table_Abstract {

    /**
     * Model GROUPS
     * @author Nguyen Manh Hung
     */
    protected $_name = TABLE_GROUPS;
    protected $_id = 'group_id';

    public function checkPermission($group_id, $permission_id) {
        $select = $this->select();        
        $select->where("group_permissions like '$permission_id%' or group_permissions like '%$permission_id%' or group_permissions like '%$permission_id'");
        $select->where('group_id=' . $group_id);
        return $this->fetchRow($select);
    }

}