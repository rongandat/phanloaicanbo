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

    public function fetchData($filters = array(), $sortFeild = null, $limit = null, $page = 1) {
        $select = $this->select();
        //add cac filter vao truy van tim kiem
        if (count($filters) > 0) {
            foreach ($filters as $feild => $keyword) {
                if ($feild === 'keyword') {
                    $select->where('group_name like?', $keyword . '%')->orWhere('group_name like?', '%' . $keyword . '%')->orWhere('group_name like?', '%' . $keyword)->group('group_id');
                } else {
                    $select->where($feild . ' =?', $keyword);
                }
            }
        }
        //add sort vao truy van
        if (null != $sortFeild) {
            $select->order($sortFeild);
        }
        //add limit - offset vao truy van		
        if (null != $limit) {
            $offset = $page * NUM_PER_PAGE;
            if ($offset <= $limit) {
                $offset = $limit + NUM_PER_PAGE;
            }
            $select->limit($limit, $offset);
        }
        return $this->fetchAll($select);
    }

}