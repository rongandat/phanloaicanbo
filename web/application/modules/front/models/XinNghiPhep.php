<?php

class Front_Model_XinNghiPhep extends Zend_Db_Table_Abstract {

    /**
     * Model Xin Nghi Phep
     * @author Nguyen Manh Hung
     */
    protected $_name = TABLE_XINNGHIPHEP;
    protected $_id = 'xnp_id';

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
    
    public function fetchByDate($em_id,$from_date, $to_date, $status=1){
        $select = $this->select();
        $select->where('xnp_em_id =?', $em_id);
        $select->where('xnp_from_date >=?', $from_date);
        $select->where('xnp_from_date <=?', $to_date);
        $select->where('xnp_ptccb_status =?', $status);        
        return $this->fetchAll($select);
    }

}