<?php

class Front_Model_Phongban extends Zend_Db_Table_Abstract {

    /**
     * Model Phong ban
     * @author Nguyen Manh Hung
     */
    protected $_name = TABLE_PHONGBAN;
    protected $_id = 'pb_id';

    public function fetchData($parent, &$phong_ban, $loai_bo = -1, $prefix = '') {
        $select = $this->select();
        $select->where('pb_parent =?', $parent);
        $select->where('pb_id !=?', $loai_bo);
        $select->order('pb_order ASC');
        $datas = $this->fetchAll($select);
        foreach ($datas as $item) {
            if ($item->pb_parent)
                $item->pb_name = $prefix . '» ' . $item->pb_name;
            else
                $item->pb_name = $prefix . $item->pb_name;
            $phong_ban[] = $item;
            $phong_ban = $this->fetchData($item->pb_id, $phong_ban, $loai_bo, '-' . $prefix);
        }
        return $phong_ban;
    }

    public function fetchDataStatus($parent, &$phong_ban, $status = 1, $prefix = '') {
        $select = $this->select();
        $select->where('pb_parent =?', $parent);
        $select->where('pb_status =?', $status);
        $select->order('pb_order ASC');
        $datas = $this->fetchAll($select);
        foreach ($datas as $item) {
            if ($item->pb_parent)
                $item->pb_name = $prefix . '» ' . $item->pb_name;
            else
                $item->pb_name = $prefix . $item->pb_name;
            $phong_ban[] = $item;
            $phong_ban = $this->fetchData($item->pb_id, $phong_ban, $status, '-' . $prefix);
        }
        return $phong_ban;
    }

    public function getPhongBanByName($name, $status = 1) {
        $select = $this->select();
        $select->where('LOWER(pb_name) =?', $name);
        $select->where('pb_status =?', $status);
        return $this->fetchRow($select);
    }

}