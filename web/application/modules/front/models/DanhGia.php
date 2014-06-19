<?php

class Front_Model_DanhGia extends Zend_Db_Table_Abstract {

    /**
     * Model Danh Gia
     * @author Nguyen Manh Hung
     */
    protected $_name = TABLE_DANHGIA;
    protected $_id = 'dg_id';

    public function fetchData($filters = array(), $sortFeild = null, $limit = null, $page = 1) {
        $select = $this->select();
        //add cac filter vao truy van tim kiem
        if (count($filters) > 0) {
            foreach ($filters as $feild => $keyword) {
                $select->where($feild . ' =?', $keyword);
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

    public function fetchOneData($filters = array(), $sortFeild = null, $limit = null, $page = 1) {
        $select = $this->select();
        //add cac filter vao truy van tim kiem
        if (count($filters) > 0) {
            foreach ($filters as $feild => $keyword) {
                $select->where($feild . ' =?', $keyword);
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
        return $this->fetchRow($select);
    }

    public function getPhanLoai($em_id, $thang, $nam) {
        $select = $this->select();
        $select->where('dg_em_id =?', $em_id);
        $select->where('dg_thang =?', $thang);
        $select->where('dg_nam <=?', $nam);
        $select->where('dg_ptccb_status !=?', '');
        return $this->fetchRow($select);
    }

}